import 'package:flutter/material.dart';
import 'package:oryon_mobile/shared/design_system/design_system.dart';

abstract final class AppTheme {
  /// Light theme configuration
  static ThemeData get lightTheme => theme(lightScheme());

  /// Dark theme configuration
  static ThemeData get darkTheme => theme(darkScheme());

  /// Light color scheme
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFFc15f3c),
      surfaceTint: Color(0xFFc15f3c),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFffaf8c),
      onPrimaryContainer: Color(0xFF993714),
      secondary: Color(0xFFf4f3ee),
      onSecondary: Color(0xFF000000),
      secondaryContainer: Color(0xFFffffff),
      onSecondaryContainer: Color(0xFFcccbc6),
      tertiary: Color(0xFFb1ada1),
      onTertiary: Color(0xFF000000),
      tertiaryContainer: Color(0xFFfffdf1),
      onTertiaryContainer: Color(0xFF898579),
      error: Color(0xFFBA1A1A),
      onError: Color(0xFFFFFFFF),
      errorContainer: Color(0xFFFFDAD6),
      onErrorContainer: Color(0xFF93000A),
      surface: Color(0xFFFFFBFE),
      onSurface: Color(0xFF1C1B1F),
      onSurfaceVariant: Color(0xFF49454F),
      outline: Color(0xFF79747E),
      outlineVariant: Color(0xFFCAC4D0),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFF313033),
      onInverseSurface: Color(0xFFF4EFF4),
      inversePrimary: Color(0xFFad4b28),
      primaryFixed: Color(0xFFffaf8c),
      onPrimaryFixed: Color(0xFF852300),
      primaryFixedDim: Color(0xFFfd9b78),
      onPrimaryFixedVariant: Color(0xFFad4b28),
      secondaryFixed: Color(0xFFffffff),
      onSecondaryFixed: Color(0xFFb8b7b2),
      secondaryFixedDim: Color(0xFFffffff),
      onSecondaryFixedVariant: Color(0xFFe0dfda),
      tertiaryFixed: Color(0xFFfffdf1),
      onTertiaryFixed: Color(0xFF757165),
      tertiaryFixedDim: Color(0xFFede9dd),
      onTertiaryFixedVariant: Color(0xFF9d998d),
      surfaceDim: Color(0xFFE6E0E9),
      surfaceBright: Color(0xFFFFFBFE),
      surfaceContainerLowest: Color(0xFFFFFFFF),
      surfaceContainerLow: Color(0xFFF7F2FA),
      surfaceContainer: Color(0xFFF3EDF7),
      surfaceContainerHigh: Color(0xFFECE6F0),
      surfaceContainerHighest: Color(0xFFE6E0E9),
    );
  }

  /// Dark color scheme 0xFFc15f3c
  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFad4b28),
      surfaceTint: Color(0xFFad4b28),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFF852300),
      onPrimaryContainer: Color(0xFFFFFFFF),
      secondary: Color(0xFFe0dfda),
      onSecondary: Color(0xFF000000),
      secondaryContainer: Color(0xFFb8b7b2),
      onSecondaryContainer: Color(0xFF000000),
      tertiary: Color(0xFF9d998d),
      onTertiary: Color(0xFF000000),
      tertiaryContainer: Color(0xFF757165),
      onTertiaryContainer: Color(0xFFFFFFFF),
      error: Color(0xFFFFB4AB),
      onError: Color(0xFF000000),
      errorContainer: Color(0xFF93000A),
      onErrorContainer: Color(0xFFFFFFFF),
      surface: Color(0xFF10090D),
      onSurface: Color(0xFFE6E0E9),
      onSurfaceVariant: Color(0xFFCAC4D0),
      outline: Color(0xFF938F99),
      outlineVariant: Color(0xFF49454F),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFFE6E0E9),
      onInverseSurface: Color(0xFF313033),
      inversePrimary: Color(0xFFc15f3c),
      primaryFixed: Color(0xFFffaf8c),
      onPrimaryFixed: Color(0xFF852300),
      primaryFixedDim: Color(0xFFfd9b78),
      onPrimaryFixedVariant: Color(0xFFad4b28),
      secondaryFixed: Color(0xFFffffff),
      onSecondaryFixed: Color(0xFFb8b7b2),
      secondaryFixedDim: Color(0xFFffffff),
      onSecondaryFixedVariant: Color(0xFFe0dfda),
      tertiaryFixed: Color(0xFFfffdf1),
      onTertiaryFixed: Color(0xFF757165),
      tertiaryFixedDim: Color(0xFFede9dd),
      onTertiaryFixedVariant: Color(0xFF9d998d),
      surfaceDim: Color(0xFF10090D),
      surfaceBright: Color(0xFF362F33),
      surfaceContainerLowest: Color(0xFF0B0509),
      surfaceContainerLow: Color(0xFF1D1418),
      surfaceContainer: Color(0xFF211A1E),
      surfaceContainerHigh: Color(0xFF2B2329),
      surfaceContainerHighest: Color(0xFF362F33),
    );
  }

  /// Main theme function that combines all theme components
  /// Uses clean, modular structure with proper AppConstants integration
  static ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
    dividerColor: colorScheme.outlineVariant,
    visualDensity: VisualDensity.standard,
    materialTapTargetSize: MaterialTapTargetSize.padded,
    textTheme: AppTypography.textTheme,
    appBarTheme: const AppBarTheme(
      elevation: AppElevations.xs,
      scrolledUnderElevation: AppElevations.xs,
      centerTitle: false,
      titleSpacing: AppSpacing.lg,
    ),
    elevatedButtonTheme: elevatedButtonTheme(colorScheme),
    filledButtonTheme: filledButtonTheme(colorScheme),
    textButtonTheme: textButtonTheme(colorScheme),
    outlinedButtonTheme: outlinedButtonTheme(colorScheme),
    iconButtonTheme: iconButtonTheme(colorScheme),
    inputDecorationTheme: _inputDecorationTheme,
    cardTheme: _cardTheme,
    chipTheme: _chipTheme,
    progressIndicatorTheme: const ProgressIndicatorThemeData(),
    dividerTheme: const DividerThemeData(
      thickness: AppBorders.thin,
      space: AppSpacing.lg,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
    ),
    tabBarTheme: const TabBarThemeData(
      labelPadding: EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.sm,
      ),
    ),
    switchTheme: switchTheme(colorScheme),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.xs),
      ),
    ),
    radioTheme: const RadioThemeData(),
    sliderTheme: const SliderThemeData(),
    iconTheme: const IconThemeData(size: AppSizing.iconLg),
  );

  /// Elevated button theme - M3 compliant with WidgetStateProperty
  static ElevatedButtonThemeData elevatedButtonTheme(ColorScheme colorScheme) =>
      ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return AppElevations.none;
            }
            if (states.contains(WidgetState.hovered)) return AppElevations.md;
            if (states.contains(WidgetState.pressed)) return AppElevations.xs;
            return AppElevations.sm;
          }),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(
              horizontal: AppSpacing.xxl,
              vertical: AppSpacing.lg,
            ),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.lg),
            ),
          ),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return colorScheme.onSurface.withValues(alpha: 0.12);
            }
            return colorScheme.primary;
          }),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return colorScheme.onSurface.withValues(alpha: 0.38);
            }
            return colorScheme.onPrimary;
          }),
          overlayColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return colorScheme.onPrimary.withValues(alpha: 0.1);
            }
            if (states.contains(WidgetState.hovered)) {
              return colorScheme.onPrimary.withValues(alpha: 0.08);
            }
            if (states.contains(WidgetState.focused)) {
              return colorScheme.onPrimary.withValues(alpha: 0.1);
            }
            return null;
          }),
          shadowColor: WidgetStateProperty.all(colorScheme.shadow),
        ),
      );

  /// Filled button theme - M3 compliant with WidgetStateProperty
  static FilledButtonThemeData filledButtonTheme(ColorScheme colorScheme) =>
      FilledButtonThemeData(
        style: ButtonStyle(
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(
              horizontal: AppSpacing.xxl,
              vertical: AppSpacing.lg,
            ),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.lg),
            ),
          ),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return colorScheme.onSurface.withValues(alpha: 0.12);
            }
            return colorScheme.secondaryContainer;
          }),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return colorScheme.onSurface.withValues(alpha: 0.38);
            }
            return colorScheme.onSecondaryContainer;
          }),
          overlayColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return colorScheme.onSecondaryContainer.withValues(alpha: 0.1);
            }
            if (states.contains(WidgetState.hovered)) {
              return colorScheme.onSecondaryContainer.withValues(alpha: 0.08);
            }
            return null;
          }),
        ),
      );

  /// Text button theme - M3 compliant with WidgetStateProperty
  static TextButtonThemeData textButtonTheme(ColorScheme colorScheme) =>
      TextButtonThemeData(
        style: ButtonStyle(
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(
              horizontal: AppSpacing.xxl,
              vertical: AppSpacing.lg,
            ),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.lg),
            ),
          ),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return colorScheme.onSurface.withValues(alpha: 0.38);
            }
            return colorScheme.primary;
          }),
          overlayColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return colorScheme.primary.withValues(alpha: 0.1);
            }
            if (states.contains(WidgetState.hovered)) {
              return colorScheme.primary.withValues(alpha: 0.08);
            }
            if (states.contains(WidgetState.focused)) {
              return colorScheme.primary.withValues(alpha: 0.1);
            }
            return null;
          }),
        ),
      );

  /// Outlined button theme - M3 compliant with WidgetStateProperty
  static OutlinedButtonThemeData outlinedButtonTheme(ColorScheme colorScheme) =>
      OutlinedButtonThemeData(
        style: ButtonStyle(
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(
              horizontal: AppSpacing.xxl,
              vertical: AppSpacing.lg,
            ),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.lg),
            ),
          ),
          side: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return BorderSide(
                color: colorScheme.onSurface.withValues(alpha: 0.12),
              );
            }
            if (states.contains(WidgetState.focused)) {
              return BorderSide(color: colorScheme.primary);
            }
            return BorderSide(color: colorScheme.outline);
          }),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return colorScheme.onSurface.withValues(alpha: 0.38);
            }
            return colorScheme.primary;
          }),
          overlayColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return colorScheme.primary.withValues(alpha: 0.1);
            }
            if (states.contains(WidgetState.hovered)) {
              return colorScheme.primary.withValues(alpha: 0.08);
            }
            return null;
          }),
        ),
      );

  /// Icon button theme - M3 compliant with WidgetStateProperty
  static IconButtonThemeData iconButtonTheme(ColorScheme colorScheme) =>
      IconButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return colorScheme.onSurface.withValues(alpha: 0.38);
            }
            return colorScheme.onSurfaceVariant;
          }),
          overlayColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return colorScheme.onSurfaceVariant.withValues(alpha: 0.1);
            }
            if (states.contains(WidgetState.hovered)) {
              return colorScheme.onSurfaceVariant.withValues(alpha: 0.08);
            }
            return null;
          }),
        ),
      );

  /// Input decoration theme
  static final InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.lg,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
      );

  /// Card theme
  static final CardThemeData _cardTheme = CardThemeData(
    elevation: AppElevations.xs,
    margin: const EdgeInsets.all(AppSpacing.sm),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.xl),
    ),
  );

  /// Chip theme
  static final ChipThemeData _chipTheme = ChipThemeData(
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.lg,
      vertical: AppSpacing.sm,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppRadius.full),
    ),
  );

  /// Switch theme - uses colorScheme from theme() parameter
  static SwitchThemeData switchTheme(ColorScheme colorScheme) =>
      SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primary;
          }
          return null;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.primaryContainer;
          }
          return null;
        }),
      );
}

/// Custom theme colors extension for additional brand colors
extension CustomColors on ColorScheme {
  /// Success color for positive actions and states
  Color get success => const Color(0xFF2E7D32);

  /// Warning color for caution states
  Color get warning => const Color(0xFFF57C00);

  /// Info color for informational states
  Color get info => const Color(0xFF1976D2);
}
