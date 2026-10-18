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

  /// Check if current platform is iOS
  bool get isIOS => platform == TargetPlatform.iOS;

  /// Check if current theme is dark mode
  bool get isDarkMode => theme.brightness == Brightness.dark;

  /// Get screen size information
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Get screen width
  double get screenWidth => mediaQuery.size.width;

  /// Get screen height
  double get screenHeight => mediaQuery.size.height;

  /// Check if device is in landscape orientation
  bool get isLandscape => mediaQuery.orientation == Orientation.landscape;

  /// Check if device is in portrait orientation
  bool get isPortrait => mediaQuery.orientation == Orientation.portrait;

  /// Check if current device is mobile size (< 600px width)
  bool get isMobile => AppSizing.isMobile(mediaQuery.size.width);

  /// Check if current device is tablet size (600px - 1200px width)
  bool get isTablet => AppSizing.isTablet(mediaQuery.size.width);

  /// Check if current device is desktop size (>= 1200px width)
  bool get isDesktop => AppSizing.isDesktop(mediaQuery.size.width);
}
