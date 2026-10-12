import 'package:flutter/material.dart';
import 'package:oryon_mobile/shared/design_system/design_system.dart';

/// Theme access extensions
extension ThemeX on BuildContext {
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
  /// Double extra small gap (2px) - For hairline separations
  Widget get gapXXS => const SizedBox.square(dimension: AppSpacing.xxs);

  /// Extra small gap (4px) - For tight layouts, icon-text spacing
  Widget get gapXS => const SizedBox.square(dimension: AppSpacing.xs);

  /// Small gap (8px) - For compact layouts, button spacing
  Widget get gapSM => const SizedBox.square(dimension: AppSpacing.sm);

  /// Medium gap (12px) - For standard content spacing, form fields
  Widget get gapMD => const SizedBox.square(dimension: AppSpacing.md);

  /// Large gap (16px) - For section spacing, card separation
  Widget get gapLG => const SizedBox.square(dimension: AppSpacing.lg);

  /// Extra large gap (20px) - For major section breaks
  Widget get gapXL => const SizedBox.square(dimension: AppSpacing.xl);

  /// Double extra large gap (24px) - For screen sections
  Widget get gapXXL => const SizedBox.square(dimension: AppSpacing.xxl);

  /// Triple extra large gap (32px) - For dramatic spacing
  Widget get gapXXXL => const SizedBox.square(dimension: AppSpacing.xxxl);

  /// Huge gap (48px) - For screen sections, major breaks
  Widget get gapHuge => const SizedBox.square(dimension: AppSpacing.huge);
}

/// Padding extensions - Space inside widgets
extension PaddingExtensions on BuildContext {
  /// Double extra small padding (2px all sides) - For hairline insets
  EdgeInsets get paddingXXS => const EdgeInsets.all(AppSpacing.xxs);

  /// Extra small padding (4px all sides) - For tight spacing, borders
  EdgeInsets get paddingXS => const EdgeInsets.all(AppSpacing.xs);

  /// Small padding (8px all sides) - For compact elements, buttons
  EdgeInsets get paddingSM => const EdgeInsets.all(AppSpacing.sm);

  /// Medium padding (12px all sides) - For standard content, cards
  EdgeInsets get paddingMD => const EdgeInsets.all(AppSpacing.md);

  /// Large padding (16px all sides) - For standard content, cards
  EdgeInsets get paddingLG => const EdgeInsets.all(AppSpacing.lg);

  /// Extra large padding (20px all sides) - For spacious layouts, dialogs
  EdgeInsets get paddingXL => const EdgeInsets.all(AppSpacing.xl);

  /// Double extra large padding (24px all sides) - For major spacing
  EdgeInsets get paddingXXL => const EdgeInsets.all(AppSpacing.xxl);

  /// Triple extra large padding (32px all sides) - For major spacing
  EdgeInsets get paddingXXXL => const EdgeInsets.all(AppSpacing.xxxl);

  /// Huge padding (48px all sides) - For dramatic spacing, screen edges
  EdgeInsets get paddingHuge => const EdgeInsets.all(AppSpacing.huge);

  /// Responsive padding that adjusts based on screen size
  EdgeInsets get paddingResponsive =>
      AppSizing.getResponsivePadding(mediaQuery.size.width);
}

/// Border radius extensions
extension BorderRadiusExtensions on BuildContext {
  /// Extra small border radius (4px) - For subtle rounding, checkboxes
  BorderRadius get radiusXS => BorderRadius.circular(AppRadius.xs);

  /// Small border radius (6px) - For tight rounding, chips, form fields
  BorderRadius get radiusSM => BorderRadius.circular(AppRadius.sm);

  /// Medium border radius (8px) - For buttons, compact elements
  BorderRadius get radiusMD => BorderRadius.circular(AppRadius.md);

  /// Large border radius (12px) - For cards, containers, most elements
  BorderRadius get radiusLG => BorderRadius.circular(AppRadius.lg);

  /// Extra large border radius (16px) - For prominent elements, dialogs
  BorderRadius get radiusXL => BorderRadius.circular(AppRadius.xl);

  /// Double extra large border radius (24px) - For hero elements, bottom sheets
  BorderRadius get radiusXXL => BorderRadius.circular(AppRadius.xxl);

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
