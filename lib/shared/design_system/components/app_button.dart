import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oryon_mobile/shared/design_system/design_system.dart';

/// Visual emphasis of an [AppButton].
///
/// Use [AppButtonVariant.primary] for the main action of a screen,
/// [AppButtonVariant.secondary] for supporting actions,
/// [AppButtonVariant.destructive] for irreversible actions, and
/// [AppButtonVariant.link] for navigation-like actions.
enum AppButtonVariant {
  primary,
  secondary,
  destructive,
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
    this.prefixIcon,
    this.suffixIcon,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final bool isLoading;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isIos = Theme.of(context).platform == TargetPlatform.iOS;
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

    final effectiveOnPressed = isLoading ? null : onPressed;

    if (isIos) {
      final foregroundColor = switch (variant) {
        AppButtonVariant.primary => colors.onPrimary,
        AppButtonVariant.destructive => colors.onError,
        AppButtonVariant.secondary || AppButtonVariant.link => colors.primary,
      };
      final backgroundColor = switch (variant) {
        AppButtonVariant.primary => colors.primary,
        AppButtonVariant.destructive => colors.error,
        AppButtonVariant.secondary || AppButtonVariant.link => null,
      };

      return CupertinoButton(
        onPressed: effectiveOnPressed,
        color: backgroundColor,
        padding: EdgeInsets.symmetric(horizontal: metrics.padding),
        borderRadius: BorderRadius.circular(AppRadius.md),
        minimumSize: metrics.minimumSize,
        child: isLoading
            ? CupertinoActivityIndicator(
                radius: metrics.indicatorSize / 2,
                color: foregroundColor,
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (prefixIcon != null) ...[
                    Icon(prefixIcon, color: foregroundColor),
                    const SizedBox(width: AppSpacing.xs),
                  ],
                  Flexible(
                    child: Text(
                      label,
                      style: TextStyle(
                        color: foregroundColor,
                        decoration: variant == AppButtonVariant.link
                            ? TextDecoration.underline
                            : null,
                      ),
                    ),
                  ),
                  if (suffixIcon != null) ...[
                    const SizedBox(width: AppSpacing.xs),
                    Icon(suffixIcon, color: foregroundColor),
                  ],
                ],
              ),
      );
    }

    final child = isLoading
        ? SizedBox.square(
            dimension: metrics.indicatorSize,
            child: const CircularProgressIndicator(strokeWidth: 2),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (prefixIcon != null) ...[
                Icon(prefixIcon),
                const SizedBox(width: AppSpacing.xs),
              ],
              Flexible(
                child: Text(
                  label,
                  style: variant == AppButtonVariant.link
                      ? const TextStyle(decoration: TextDecoration.underline)
                      : null,
                ),
              ),
              if (suffixIcon != null) ...[
                const SizedBox(width: AppSpacing.xs),
                Icon(suffixIcon),
              ],
            ],
          );

    final Widget button = switch (variant) {
      AppButtonVariant.secondary => OutlinedButton(
        onPressed: effectiveOnPressed,
        style: style,
        child: child,
      ),
      AppButtonVariant.link => TextButton(
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

    return button;
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
