import 'package:flutter/material.dart';
import 'package:oryon_mobile/shared/design_system/design_system.dart';

/// Meets Android's common minimum touch target; keep at least this size for
/// icon buttons, checkboxes, and other important controls.
abstract final class AppSizing {
  static const double avatar = 40; // Standard user avatar
  static const double avatarSizeLarge = 64; // Profile or prominent display

  static const double iconSm = 16;
  static const double iconMd = 20;
  static const double iconLg = 24;

  static const double buttonHeightSmall = 40; // For compact layouts
  static const double buttonHeight = 48; // Meets accessibility guidelines
  static const double buttonHeightLarge = 56; // For prominent actions

  /// Text field height (56px) - Standard Material Design height
  static const double textFieldHeight = 56;

  /// App bar height (56px) - Standard Material Design app bar
  static const double appBarHeight = 56;

  /// Tab bar height (48px) - Standard Material Design tab bar
  static const double tabBarHeight = 48;

  /// Bottom navigation height (80px) - With padding and content
  static const double bottomNavHeight = 80;

  static const double fabSize = 56; // Standard floating action button
  static const double fabSizeLarge = 64; // Extended floating action button

  /// Mobile breakpoint (600px) - Phone screens
  /// Note: Breakpoints use raw logical pixels (not ScreenUtil-scaled)
  /// for correct responsive checks
  static const double breakpointMobile = 600;

  /// Tablet breakpoint (900px) - Tablet screens
  static const double breakpointTablet = 900;

  /// Desktop breakpoint (1200px) - Desktop screens
  static const double breakpointDesktop = 1200;

  /// Get responsive padding based on screen width
  static EdgeInsets getResponsivePadding(double screenWidth) {
    if (screenWidth >= breakpointDesktop) {
      return const EdgeInsets.all(AppSpacing.huge);
    } else if (screenWidth >= breakpointTablet) {
      return const EdgeInsets.all(AppSpacing.xxxl);
    } else {
      return const EdgeInsets.all(AppSpacing.lg);
    }
  }

  /// Get responsive text size multiplier
  static double getTextSizeMultiplier(double screenWidth) {
    if (screenWidth >= breakpointDesktop) {
      return 1.1; // 10% larger on desktop
    } else if (screenWidth >= breakpointTablet) {
      return 1.05; // 5% larger on tablet
    } else {
      return 1; // Standard size on mobile
    }
  }

  /// Check if screen is mobile size
  static bool isMobile(double screenWidth) => screenWidth < breakpointMobile;

  /// Check if screen is tablet size
  static bool isTablet(double screenWidth) =>
      screenWidth >= breakpointMobile && screenWidth < breakpointDesktop;

  /// Check if screen is desktop size
  static bool isDesktop(double screenWidth) => screenWidth >= breakpointDesktop;
}
