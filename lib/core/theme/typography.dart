import 'package:flutter/material.dart';
import '../constants/index.dart';

/// Application typography configuration
class AppTypography {
  /// Light theme text theme
  static TextTheme lightTextTheme = TextTheme(
    // Display styles
    displayLarge: TextStyle(
      fontSize: UITypography.fontSizeHeading1,
      fontWeight: UITypography.fontWeightBold,
      color: UIColors.black,
      height: UITypography.lineHeightSmall,
    ),
    displayMedium: TextStyle(
      fontSize: 24.0,
      fontWeight: UITypography.fontWeightBold,
      color: UIColors.black,
      height: UITypography.lineHeightSmall,
    ),
    displaySmall: TextStyle(
      fontSize: 20.0,
      fontWeight: UITypography.fontWeightBold,
      color: UIColors.black,
      height: UITypography.lineHeightSmall,
    ),

    // Headline styles
    headlineLarge: TextStyle(
      fontSize: UITypography.fontSizeHeading1,
      fontWeight: UITypography.fontWeightBold,
      color: UIColors.black,
      height: UITypography.lineHeightMedium,
    ),
    headlineMedium: TextStyle(
      fontSize: UITypography.fontSizeHeading2,
      fontWeight: UITypography.fontWeightBold,
      color: UIColors.black,
      height: UITypography.lineHeightMedium,
    ),
    headlineSmall: TextStyle(
      fontSize: UITypography.fontSizeHeading3,
      fontWeight: UITypography.fontWeightSemiBold,
      color: UIColors.black,
      height: UITypography.lineHeightMedium,
    ),

    // Title styles
    titleLarge: TextStyle(
      fontSize: UITypography.fontSizeTitle,
      fontWeight: UITypography.fontWeightSemiBold,
      color: UIColors.black,
      height: UITypography.lineHeightMedium,
    ),
    titleMedium: TextStyle(
      fontSize: UITypography.fontSizeXLarge,
      fontWeight: UITypography.fontWeightMedium,
      color: UIColors.black,
      height: UITypography.lineHeightMedium,
    ),
    titleSmall: TextStyle(
      fontSize: UITypography.fontSizeLarge,
      fontWeight: UITypography.fontWeightMedium,
      color: UIColors.black,
      height: UITypography.lineHeightMedium,
    ),

    // Body styles
    bodyLarge: TextStyle(
      fontSize: UITypography.fontSizeLarge,
      fontWeight: UITypography.fontWeightRegular,
      color: UIColors.black,
      height: UITypography.lineHeightMedium,
    ),
    bodyMedium: TextStyle(
      fontSize: UITypography.fontSizeMedium,
      fontWeight: UITypography.fontWeightRegular,
      color: UIColors.black,
      height: UITypography.lineHeightMedium,
    ),
    bodySmall: TextStyle(
      fontSize: UITypography.fontSizeSmall,
      fontWeight: UITypography.fontWeightRegular,
      color: UIColors.grey600,
      height: UITypography.lineHeightMedium,
    ),

    // Label styles
    labelLarge: TextStyle(
      fontSize: UITypography.fontSizeMedium,
      fontWeight: UITypography.fontWeightSemiBold,
      color: UIColors.black,
      height: UITypography.lineHeightMedium,
    ),
    labelMedium: TextStyle(
      fontSize: UITypography.fontSizeSmall,
      fontWeight: UITypography.fontWeightMedium,
      color: UIColors.black,
      height: UITypography.lineHeightSmall,
    ),
    labelSmall: TextStyle(
      fontSize: UITypography.fontSizeXSmall,
      fontWeight: UITypography.fontWeightMedium,
      color: UIColors.grey600,
      height: UITypography.lineHeightSmall,
    ),
  );

  /// Dark theme text theme
  static TextTheme darkTextTheme = TextTheme(
    // Display styles
    displayLarge: TextStyle(
      fontSize: UITypography.fontSizeHeading1,
      fontWeight: UITypography.fontWeightBold,
      color: UIColors.white,
      height: UITypography.lineHeightSmall,
    ),
    displayMedium: TextStyle(
      fontSize: 24.0,
      fontWeight: UITypography.fontWeightBold,
      color: UIColors.white,
      height: UITypography.lineHeightSmall,
    ),
    displaySmall: TextStyle(
      fontSize: 20.0,
      fontWeight: UITypography.fontWeightBold,
      color: UIColors.white,
      height: UITypography.lineHeightSmall,
    ),

    // Headline styles
    headlineLarge: TextStyle(
      fontSize: UITypography.fontSizeHeading1,
      fontWeight: UITypography.fontWeightBold,
      color: UIColors.white,
      height: UITypography.lineHeightMedium,
    ),
    headlineMedium: TextStyle(
      fontSize: UITypography.fontSizeHeading2,
      fontWeight: UITypography.fontWeightBold,
      color: UIColors.white,
      height: UITypography.lineHeightMedium,
    ),
    headlineSmall: TextStyle(
      fontSize: UITypography.fontSizeHeading3,
      fontWeight: UITypography.fontWeightSemiBold,
      color: UIColors.white,
      height: UITypography.lineHeightMedium,
    ),

    // Title styles
    titleLarge: TextStyle(
      fontSize: UITypography.fontSizeTitle,
      fontWeight: UITypography.fontWeightSemiBold,
      color: UIColors.white,
      height: UITypography.lineHeightMedium,
    ),
    titleMedium: TextStyle(
      fontSize: UITypography.fontSizeXLarge,
      fontWeight: UITypography.fontWeightMedium,
      color: UIColors.white,
      height: UITypography.lineHeightMedium,
    ),
    titleSmall: TextStyle(
      fontSize: UITypography.fontSizeLarge,
      fontWeight: UITypography.fontWeightMedium,
      color: UIColors.white,
      height: UITypography.lineHeightMedium,
    ),

    // Body styles
    bodyLarge: TextStyle(
      fontSize: UITypography.fontSizeLarge,
      fontWeight: UITypography.fontWeightRegular,
      color: UIColors.white,
      height: UITypography.lineHeightMedium,
    ),
    bodyMedium: TextStyle(
      fontSize: UITypography.fontSizeMedium,
      fontWeight: UITypography.fontWeightRegular,
      color: UIColors.white,
      height: UITypography.lineHeightMedium,
    ),
    bodySmall: TextStyle(
      fontSize: UITypography.fontSizeSmall,
      fontWeight: UITypography.fontWeightRegular,
      color: UIColors.grey300,
      height: UITypography.lineHeightMedium,
    ),

    // Label styles
    labelLarge: TextStyle(
      fontSize: UITypography.fontSizeMedium,
      fontWeight: UITypography.fontWeightSemiBold,
      color: UIColors.white,
      height: UITypography.lineHeightMedium,
    ),
    labelMedium: TextStyle(
      fontSize: UITypography.fontSizeSmall,
      fontWeight: UITypography.fontWeightMedium,
      color: UIColors.white,
      height: UITypography.lineHeightSmall,
    ),
    labelSmall: TextStyle(
      fontSize: UITypography.fontSizeXSmall,
      fontWeight: UITypography.fontWeightMedium,
      color: UIColors.grey300,
      height: UITypography.lineHeightSmall,
    ),
  );
}
