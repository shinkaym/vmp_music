import 'package:flutter/material.dart';
import 'color_scheme.dart';
import 'typography.dart';
import '../constants/index.dart';

/// Application theme configuration
class AppTheme {
  /// Light theme data
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: LightColorScheme.scheme,
    textTheme: AppTypography.lightTextTheme,

    // AppBar theme
    appBarTheme: AppBarTheme(
      backgroundColor: LightColorScheme.scheme.primary,
      foregroundColor: LightColorScheme.scheme.onPrimary,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: AppTypography.lightTextTheme.titleLarge?.copyWith(
        color: LightColorScheme.scheme.onPrimary,
      ),
    ),

    // Bottom navigation bar theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: LightColorScheme.scheme.surface,
      selectedItemColor: LightColorScheme.scheme.primary,
      unselectedItemColor: UIColors.grey600,
      elevation: 8,
      type: BottomNavigationBarType.fixed,
    ),

    // Floating action button theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: LightColorScheme.scheme.primary,
      foregroundColor: LightColorScheme.scheme.onPrimary,
      elevation: 4,
    ),

    // Button themes
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: LightColorScheme.scheme.primary,
        foregroundColor: LightColorScheme.scheme.onPrimary,
        padding: const EdgeInsets.symmetric(
          horizontal: UISizes.paddingLarge,
          vertical: UISizes.paddingMedium,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UISizes.radiusMedium),
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: LightColorScheme.scheme.primary,
        side: BorderSide(color: LightColorScheme.scheme.primary),
        padding: const EdgeInsets.symmetric(
          horizontal: UISizes.paddingLarge,
          vertical: UISizes.paddingMedium,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UISizes.radiusMedium),
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: LightColorScheme.scheme.primary,
        padding: const EdgeInsets.symmetric(
          horizontal: UISizes.paddingMedium,
          vertical: UISizes.paddingSmall,
        ),
      ),
    ),

    // Card theme
    cardTheme: CardThemeData(
      color: LightColorScheme.scheme.surface,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UISizes.radiusMedium),
      ),
      margin: const EdgeInsets.all(0),
    ),

    // Dialog theme
    dialogTheme: DialogThemeData(
      backgroundColor: LightColorScheme.scheme.surface,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UISizes.radiusLarge),
      ),
    ),

    // Input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: UIColors.grey100,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: UISizes.paddingMedium,
        vertical: UISizes.paddingMedium,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(UISizes.radiusMedium),
        borderSide: const BorderSide(color: UIColors.grey300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(UISizes.radiusMedium),
        borderSide: const BorderSide(color: UIColors.grey300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(UISizes.radiusMedium),
        borderSide: BorderSide(
          color: LightColorScheme.scheme.primary,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(UISizes.radiusMedium),
        borderSide: const BorderSide(color: UIColors.error),
      ),
      labelStyle: AppTypography.lightTextTheme.bodyMedium,
      hintStyle: AppTypography.lightTextTheme.bodySmall,
    ),

    // Divider theme
    dividerTheme: const DividerThemeData(
      color: UIColors.grey200,
      thickness: UISizes.dividerThickness,
      space: UISizes.paddingMedium,
    ),

    // Icon theme
    iconTheme: const IconThemeData(
      color: UIColors.black,
      size: UISizes.iconMedium,
    ),

    // Scaffold background
    scaffoldBackgroundColor: LightColorScheme.scheme.surface,
  );

  /// Dark theme data
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: DarkColorScheme.scheme,
    textTheme: AppTypography.darkTextTheme,

    // AppBar theme
    appBarTheme: AppBarTheme(
      backgroundColor: DarkColorScheme.scheme.primary,
      foregroundColor: DarkColorScheme.scheme.onPrimary,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: AppTypography.darkTextTheme.titleLarge?.copyWith(
        color: DarkColorScheme.scheme.onPrimary,
      ),
    ),

    // Bottom navigation bar theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: DarkColorScheme.scheme.surface,
      selectedItemColor: DarkColorScheme.scheme.primary,
      unselectedItemColor: UIColors.grey400,
      elevation: 8,
      type: BottomNavigationBarType.fixed,
    ),

    // Floating action button theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: DarkColorScheme.scheme.primary,
      foregroundColor: DarkColorScheme.scheme.onPrimary,
      elevation: 4,
    ),

    // Button themes
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: DarkColorScheme.scheme.primary,
        foregroundColor: DarkColorScheme.scheme.onPrimary,
        padding: const EdgeInsets.symmetric(
          horizontal: UISizes.paddingLarge,
          vertical: UISizes.paddingMedium,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UISizes.radiusMedium),
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: DarkColorScheme.scheme.primary,
        side: BorderSide(color: DarkColorScheme.scheme.primary),
        padding: const EdgeInsets.symmetric(
          horizontal: UISizes.paddingLarge,
          vertical: UISizes.paddingMedium,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(UISizes.radiusMedium),
        ),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: DarkColorScheme.scheme.primary,
        padding: const EdgeInsets.symmetric(
          horizontal: UISizes.paddingMedium,
          vertical: UISizes.paddingSmall,
        ),
      ),
    ),

    // Card theme
    cardTheme: CardThemeData(
      color: DarkColorScheme.scheme.surface,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UISizes.radiusMedium),
      ),
      margin: const EdgeInsets.all(0),
    ),

    // Dialog theme
    dialogTheme: DialogThemeData(
      backgroundColor: DarkColorScheme.scheme.surface,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UISizes.radiusLarge),
      ),
    ),

    // Input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: UIColors.grey700,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: UISizes.paddingMedium,
        vertical: UISizes.paddingMedium,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(UISizes.radiusMedium),
        borderSide: const BorderSide(color: UIColors.grey600),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(UISizes.radiusMedium),
        borderSide: const BorderSide(color: UIColors.grey600),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(UISizes.radiusMedium),
        borderSide: BorderSide(
          color: DarkColorScheme.scheme.primary,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(UISizes.radiusMedium),
        borderSide: const BorderSide(color: UIColors.error),
      ),
      labelStyle: AppTypography.darkTextTheme.bodyMedium,
      hintStyle: AppTypography.darkTextTheme.bodySmall,
    ),

    // Divider theme
    dividerTheme: const DividerThemeData(
      color: UIColors.grey700,
      thickness: UISizes.dividerThickness,
      space: UISizes.paddingMedium,
    ),

    // Icon theme
    iconTheme: const IconThemeData(
      color: UIColors.white,
      size: UISizes.iconMedium,
    ),

    // Scaffold background
    scaffoldBackgroundColor: DarkColorScheme.scheme.surface,
  );
}
