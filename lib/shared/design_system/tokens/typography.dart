import 'package:flutter/material.dart';

abstract final class AppTypography {
  static const String headingFont = 'Poppins';
  static const String bodyFont = 'Poppins';
  static const String monoFont = 'GeistMono';

  /// Display Large (57px) - Hero text, major headlines
  static const TextStyle displayLarge = TextStyle(
    fontFamily: headingFont,
    fontSize: 57,
    fontWeight: FontWeight.w600, // w400
    height: 1.2, // 1.12
    letterSpacing: -0.5, // -0.25
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: headingFont,
    fontSize: 45,
    fontWeight: FontWeight.w600, // w400
    height: 1.25, // 1.16
    letterSpacing: -0.4, // 0
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: headingFont,
    fontSize: 36,
    fontWeight: FontWeight.w600, // w400
    height: 1.22,
    letterSpacing: 0,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontFamily: headingFont,
    fontSize: 32,
    fontWeight: FontWeight.w600, // w400
    height: 1.25,
    letterSpacing: 0,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: headingFont,
    fontSize: 28,
    fontWeight: FontWeight.w600, // w400
    height: 1.3, // 1.29
    letterSpacing: 0,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: headingFont,
    fontSize: 24,
    fontWeight: FontWeight.w600, // w400
    height: 1.3, // 1.33
    letterSpacing: 0,
  );

  static const TextStyle titleLarge = TextStyle(
    fontFamily: headingFont,
    fontSize: 22,
    fontWeight: FontWeight.w600, // w400
    height: 1.3, // 1.27
    letterSpacing: 0,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: headingFont,
    fontSize: 16,
    fontWeight: FontWeight.w600, // w400
    height: 1.4, // 1.50
    letterSpacing: 0.15,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: bodyFont,
    fontSize: 14,
    fontWeight: FontWeight.w600, // w400
    height: 1.4, // 1.43
    letterSpacing: 0.1,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: bodyFont,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.15,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: bodyFont,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5, // 1.43
    letterSpacing: 0.25,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: bodyFont,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.4, // 1.33
    letterSpacing: 0.4,
  );

  static const TextStyle labelLarge = TextStyle(
    fontFamily: bodyFont,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4, // 1.43
    letterSpacing: 0.1,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: bodyFont,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.4, // 1.33
    letterSpacing: 0.5,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: bodyFont,
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 1.4, // 1.45
    letterSpacing: 0.5,
  );

  static const TextStyle timer = TextStyle(
    fontFamily: monoFont,
    fontSize: 24,
    fontWeight: FontWeight.w500,
    height: 1.2,
    fontFeatures: <FontFeature>[FontFeature.tabularFigures()],
  );

  static const TextTheme textTheme = TextTheme(
    displayLarge: displayLarge,
    displayMedium: displayMedium,
    displaySmall: displaySmall,
    headlineLarge: headlineLarge,
    headlineMedium: headlineMedium,
    headlineSmall: headlineSmall,
    titleLarge: titleLarge,
    titleMedium: titleMedium,
    titleSmall: titleSmall,
    bodyLarge: bodyLarge,
    bodyMedium: bodyMedium,
    bodySmall: bodySmall,
    labelLarge: labelLarge,
    labelMedium: labelMedium,
    labelSmall: labelSmall,
  );
}
