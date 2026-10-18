import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oryon_mobile/shared/design_system/design_system.dart';

/// Asks the user to confirm an action that cannot be undone, such as leaving
/// the app or signing out.
class AppConfirmDialog extends StatelessWidget {
  const AppConfirmDialog({
    required this.title,
    required this.message,
    required this.confirmLabel,
    required this.cancelLabel,
    this.isDestructive = true,
    super.key,
  });

  final String title;
  final String message;
  final String confirmLabel;
  final String cancelLabel;

  /// Whether the confirm action is irreversible, which colors it as a
  /// destructive action.
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(cancelLabel),
          ),
          CupertinoDialogAction(
            isDestructiveAction: isDestructive,
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(confirmLabel),
          ),
        ],
      );
    }

    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        AppButton(
          label: cancelLabel,
          variant: AppButtonVariant.secondary,
          onPressed: () => Navigator.of(context).pop(false),
        ),
        AppButton(
          label: confirmLabel,
          variant: isDestructive
              ? AppButtonVariant.destructive
              : AppButtonVariant.primary,
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    );
  }
}

extension AppConfirmDialogX on BuildContext {
  /// Shows [AppConfirmDialog] and reports whether the user confirmed.
  ///
  /// Dismissing the dialog, by tapping outside of it or by pressing back,
  /// counts as a cancel.
  Future<bool> showConfirmDialog({
    required String title,
    required String message,
    required String confirmLabel,
    required String cancelLabel,
    bool isDestructive = true,
  }) async {
    final confirmed = await showDialog<bool>(
      context: this,
      // This dialog guards actions the user cannot undo, so a stray tap
      // outside of it must not read as a decision.
      barrierDismissible: false,
      builder: (_) => AppConfirmDialog(
        title: title,
        message: message,
        confirmLabel: confirmLabel,
        cancelLabel: cancelLabel,
        isDestructive: isDestructive,
      ),
    );

    return confirmed ?? false;
  }
}
