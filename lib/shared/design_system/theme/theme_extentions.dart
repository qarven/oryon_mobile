import 'package:flutter/material.dart';
import 'package:oryon_mobile/shared/design_system/design_system.dart';

/// Theme access extensions
extension ThemeExtensions on BuildContext {
  /// Get the current theme data
  ThemeData get theme => Theme.of(this);

  /// Get the current color scheme (primary, secondary, surface, etc.)
  ColorScheme get colorScheme => theme.colorScheme;

  /// Get the current text theme (headlineLarge, bodyMedium, etc.)
  TextTheme get textTheme => theme.textTheme;

  /// Get the current platform (iOS, Android, etc.)
  TargetPlatform get platform => theme.platform;

  /// Check if current theme is dark mode
  bool get isDarkMode => theme.brightness == Brightness.dark;

  /// Get screen size information
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Check if device is in landscape orientation
  bool get isLandscape => mediaQuery.orientation == Orientation.landscape;

  /// Check if device is in portrait orientation
  bool get isPortrait => mediaQuery.orientation == Orientation.portrait;
}

/// Spacing extensions - Gaps between widgets
extension SpacingExtensions on BuildContext {
  /// Extra small gap (4px) - For tight layouts, icon-text spacing
  Widget get gapXS => const SizedBox.square(dimension: AppSpacing.xs);

  /// Small gap (8px) - For compact layouts, button spacing
  Widget get gapSM => const SizedBox.square(dimension: AppSpacing.sm);

  /// Medium gap (16px) - For standard content spacing, form fields
  Widget get gapMD => const SizedBox.square(dimension: AppSpacing.lg);

  /// Large gap (24px) - For section spacing, card separation
  Widget get gapLG => const SizedBox.square(dimension: AppSpacing.xxl);

  /// Extra large gap (32px) - For major section breaks
  Widget get gapXL => const SizedBox.square(dimension: AppSpacing.xxxl);

  /// Double extra large gap (48px) - For dramatic spacing, screen sections
  Widget get gapXXL => const SizedBox.square(dimension: AppSpacing.huge);
}

/// Padding extensions - Space inside widgets
extension PaddingExtensions on BuildContext {
  /// Extra small padding (4px all sides) - For tight spacing, borders
  EdgeInsets get paddingXS => const EdgeInsets.all(AppSpacing.xs);

  /// Small padding (8px all sides) - For compact elements, buttons
  EdgeInsets get paddingSM => const EdgeInsets.all(AppSpacing.sm);

  /// Medium padding (16px all sides) - For standard content, cards
  EdgeInsets get paddingMD => const EdgeInsets.all(AppSpacing.lg);

  /// Large padding (24px all sides) - For spacious layouts, dialogs
  EdgeInsets get paddingLG => const EdgeInsets.all(AppSpacing.xxl);

  /// Extra large padding (32px all sides) - For major spacing, screen edges
  EdgeInsets get paddingXL => const EdgeInsets.all(AppSpacing.xxxl);

  /// Double extra large padding (48px all sides) - For dramatic spacing
  EdgeInsets get paddingXXL => const EdgeInsets.all(AppSpacing.huge);

  /// Horizontal padding only (left and right)
  EdgeInsets paddingHorizontal(double value) =>
      EdgeInsets.symmetric(horizontal: value);

  /// Vertical padding only (top and bottom)
  EdgeInsets paddingVertical(double value) =>
      EdgeInsets.symmetric(vertical: value);

  /// Responsive padding that adjusts based on screen size
  EdgeInsets get paddingResponsive =>
      AppSizing.getResponsivePadding(mediaQuery.size.width);
}

/// Border radius extensions
extension BorderRadiusExtensions on BuildContext {
  /// Extra small border radius (4px) - For subtle rounding, checkboxes
  BorderRadius get radiusXS => BorderRadius.circular(AppRadius.xs);

  /// Small border radius (8px) - For buttons, chips, form fields
  BorderRadius get radiusSM => BorderRadius.circular(AppRadius.md);

  /// Medium border radius (12px) - For cards, containers, most elements
  BorderRadius get radiusMD => BorderRadius.circular(AppRadius.lg);

  /// Large border radius (16px) - For prominent elements, dialogs
  BorderRadius get radiusLG => BorderRadius.circular(AppRadius.xl);

  /// Extra large border radius (24px) - For hero elements, bottom sheets
  BorderRadius get radiusXL => BorderRadius.circular(AppRadius.xxl);

  /// Full border radius (circular) - For avatars, pills, circular buttons
  BorderRadius get radiusFull => BorderRadius.circular(AppRadius.full);

  /// Custom radius with specific value
  BorderRadius radius(double value) => BorderRadius.circular(value);
}

/// Responsive extensions
extension ResponsiveExtensions on BuildContext {
  /// Check if current device is mobile size (< 600px width)
  bool get isMobile => AppSizing.isMobile(mediaQuery.size.width);

  /// Check if current device is tablet size (600px - 1200px width)
  bool get isTablet => AppSizing.isTablet(mediaQuery.size.width);

  /// Check if current device is desktop size (>= 1200px width)
  bool get isDesktop => AppSizing.isDesktop(mediaQuery.size.width);

  /// Get responsive text size multiplier
  double get textSizeMultiplier =>
      AppSizing.getTextSizeMultiplier(mediaQuery.size.width);

  /// Get screen width
  double get screenWidth => mediaQuery.size.width;

  /// Get screen height
  double get screenHeight => mediaQuery.size.height;
}

/// Widget extensions - Convenience methods
extension WidgetExtensions on Widget {
  /// Wrap widget with Padding using all-sides padding
  Widget paddingAll(double value) => Padding(
    padding: EdgeInsets.all(value),
    child: this,
  );

  /// Wrap widget with symmetric padding
  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: this,
      );

  /// Center the widget
  Widget centered() => Center(child: this);

  /// Wrap with Expanded (for Flex children)
  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);

  /// Wrap with Flexible (for Flex children)
  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) =>
      Flexible(flex: flex, fit: fit, child: this);

  /// Add opacity to widget
  Widget opacity(double opacity) => Opacity(opacity: opacity, child: this);

  /// Add tap gesture
  Widget onTap(VoidCallback onTap) =>
      GestureDetector(onTap: onTap, child: this);

  /// Wrap with SafeArea
  Widget safeArea({
    bool top = true,
    bool bottom = true,
    bool left = true,
    bool right = true,
  }) => SafeArea(
    top: top,
    bottom: bottom,
    left: left,
    right: right,
    child: this,
  );
}
