import 'package:flutter/material.dart';
import 'package:oryon_mobile/shared/design_system/design_system.dart';

/// Circular action button wrapped in an animated progress ring drawn outside
/// its edge, so the arc reads as walkthrough progress and not as button fill.
class ProgressButton extends StatelessWidget {
  const ProgressButton({
    required this.progress,
    required this.icon,
    required this.label,
    required this.onPressed,
    super.key,
  });

  final double progress;
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  static const double _inset = AppSpacing.xs + (AppBorders.heavy / 2);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: progress),
      duration: AppMotion.medium,
      curve: AppMotion.enter,
      builder: (context, value, _) => SizedBox.square(
        dimension: AppSizing.buttonHeight + 2 * _inset,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
              value: value,
              strokeWidth: AppBorders.heavy,
              color: colors.primary,
              backgroundColor: colors.outlineVariant,
            ),
            Padding(
              padding: const EdgeInsets.all(_inset),
              child: IconButton.filled(
                onPressed: onPressed,
                tooltip: label,
                iconSize: AppSizing.iconLg,
                icon: Icon(icon, color: context.colorScheme.onPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
