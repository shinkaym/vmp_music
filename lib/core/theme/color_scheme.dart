import 'package:flutter/material.dart';
import '../constants/index.dart';

/// Light theme color scheme
class LightColorScheme {
  static const ColorScheme scheme = ColorScheme(
    brightness: Brightness.light,
    primary: UIColors.primary,
    onPrimary: UIColors.white,
    primaryContainer: UIColors.primaryLight,
    onPrimaryContainer: UIColors.white,
    secondary: UIColors.secondary,
    onSecondary: UIColors.black,
    secondaryContainer: UIColors.secondaryLight,
    onSecondaryContainer: UIColors.black,
    tertiary: UIColors.info,
    onTertiary: UIColors.white,
    error: UIColors.error,
    onError: UIColors.white,
    surface: UIColors.surface,
    onSurface: UIColors.black,
    outline: UIColors.grey400,
    scrim: UIColors.scrim,
    shadow: UIColors.shadow,
  );
}

/// Dark theme color scheme
class DarkColorScheme {
  static const ColorScheme scheme = ColorScheme(
    brightness: Brightness.dark,
    primary: UIColors.primaryLight,
    onPrimary: UIColors.primaryDark,
    primaryContainer: UIColors.primaryDark,
    onPrimaryContainer: UIColors.primaryLight,
    secondary: UIColors.secondary,
    onSecondary: UIColors.secondaryDark,
    secondaryContainer: UIColors.secondaryDark,
    onSecondaryContainer: UIColors.secondary,
    tertiary: UIColors.info,
    onTertiary: UIColors.black,
    error: UIColors.error,
    onError: UIColors.black,
    surface: UIColors.grey800,
    onSurface: UIColors.white,
    outline: UIColors.grey600,
    scrim: UIColors.scrim,
    shadow: UIColors.shadow,
  );
}
