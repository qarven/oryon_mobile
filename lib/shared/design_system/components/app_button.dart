import 'package:flutter/material.dart';
import 'package:oryon_mobile/shared/design_system/design_system.dart';

/// Visual emphasis of an [AppButton].
///
/// Use [AppButtonVariant.primary] for the main action of a screen,
/// [AppButtonVariant.secondary] for supporting actions,
/// [AppButtonVariant.destructive] for irreversible actions,
/// [AppButtonVariant.ghost] for low emphasis inline actions, and
/// [AppButtonVariant.link] for navigation-like actions.
enum AppButtonVariant {
  primary,
  secondary,
  destructive,
  ghost,
  link,
}

/// Size of an [AppButton], controlling its height, padding, and label style.
///
/// All sizes keep a 48x48 tap target (Material 3 minimum) even when the
/// rendered button is smaller.
enum AppButtonSize {
  xs,
  sm,
  md,
  lg,
  icon,
}

class AppButton extends StatelessWidget {
  const AppButton({
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.md,
    this.isLoading = false,
    this.isExpanded = false,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final bool isLoading;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final metrics = size.metrics;

    final style =
        switch (variant) {
          AppButtonVariant.primary => FilledButton.styleFrom(
            backgroundColor: colors.primary,
            foregroundColor: colors.onPrimary,
          ),
          AppButtonVariant.secondary => OutlinedButton.styleFrom(
            foregroundColor: colors.primary,
          ),
          AppButtonVariant.destructive => FilledButton.styleFrom(
            backgroundColor: colors.error,
            foregroundColor: colors.onError,
          ),
          AppButtonVariant.ghost ||
          AppButtonVariant.link => TextButton.styleFrom(
            foregroundColor: colors.primary,
          ),
        }.copyWith(
          minimumSize: WidgetStatePropertyAll(metrics.minimumSize),
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: metrics.padding),
          ),
          textStyle: WidgetStatePropertyAll(metrics.textStyle),
        );

    final child = isLoading
        ? SizedBox.square(
            dimension: metrics.indicatorSize,
            child: const CircularProgressIndicator(strokeWidth: 2),
          )
        : Text(
            label,
            style: variant == AppButtonVariant.link
                ? const TextStyle(decoration: TextDecoration.underline)
                : null,
          );

    final effectiveOnPressed = isLoading ? null : onPressed;

    final Widget button = switch (variant) {
      AppButtonVariant.secondary => OutlinedButton(
        onPressed: effectiveOnPressed,
        style: style,
        child: child,
      ),
      AppButtonVariant.ghost || AppButtonVariant.link => TextButton(
        onPressed: effectiveOnPressed,
        style: style,
        child: child,
      ),
      _ => FilledButton(
        onPressed: effectiveOnPressed,
        style: style,
        child: child,
      ),
    };

    if (!isExpanded) return button;

    return SizedBox(
      width: double.infinity,
      child: button,
    );
  }
}

extension on AppButtonSize {
  /// Height, padding, label style, and indicator size of this size.
  ///
  /// Heights follow the Material 3 button scale; the tap target stays at
  /// 48x48 through Flutter's default [MaterialTapTargetSize.padded].
  ({
    Size minimumSize,
    double padding,
    TextStyle textStyle,
    double indicatorSize,
  })
  get metrics => switch (this) {
    AppButtonSize.xs => (
      minimumSize: const Size(0, 32),
      padding: AppSpacing.sm,
      textStyle: AppTypography.labelSmall,
      indicatorSize: 14,
    ),
    AppButtonSize.sm => (
      minimumSize: const Size(0, 40),
      padding: AppSpacing.md,
      textStyle: AppTypography.labelMedium,
      indicatorSize: 16,
    ),
    AppButtonSize.md => (
      minimumSize: const Size(0, 48),
      padding: AppSpacing.md,
      textStyle: AppTypography.labelLarge,
      indicatorSize: 18,
    ),
    AppButtonSize.lg => (
      minimumSize: const Size(0, 56),
      padding: AppSpacing.lg,
      textStyle: AppTypography.titleMedium,
      indicatorSize: 20,
    ),
    AppButtonSize.icon => (
      minimumSize: const Size.square(40),
      padding: AppSpacing.xs,
      textStyle: AppTypography.labelSmall,
      indicatorSize: 16,
    ),
  };
}
