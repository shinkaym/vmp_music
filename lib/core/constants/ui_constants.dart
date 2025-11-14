import 'package:flutter/material.dart';

/// UI layout and spacing constants
class UISizes {
  // Padding and margins
  static const double paddingXSmall = 4.0;
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXLarge = 32.0;

  // Border radius
  static const double radiusSmall = 4.0;
  static const double radiusMedium = 8.0;
  static const double radiusLarge = 16.0;
  static const double radiusXLarge = 24.0;

  // Icon sizes
  static const double iconSmall = 16.0;
  static const double iconMedium = 24.0;
  static const double iconLarge = 32.0;
  static const double iconXLarge = 48.0;

  // Button sizes
  static const double buttonHeightSmall = 32.0;
  static const double buttonHeightMedium = 44.0;
  static const double buttonHeightLarge = 56.0;
  static const double buttonMinWidth = 80.0;

  // Image sizes
  static const double albumArtSmall = 48.0;
  static const double albumArtMedium = 100.0;
  static const double albumArtLarge = 200.0;

  // Divider thickness
  static const double dividerThickness = 1.0;

  // App bar height
  static const double appBarHeight = 56.0;

  // Bottom nav height
  static const double bottomNavHeight = 64.0;
}

/// UI color palette
class UIColors {
  // Primary colors
  static const Color primary = Color(0xFF6200EE);
  static const Color primaryLight = Color(0xFF9C27B0);
  static const Color primaryDark = Color(0xFF4A148C);

  // Secondary colors
  static const Color secondary = Color(0xFF03DAC6);
  static const Color secondaryLight = Color(0xFF66FFF9);
  static const Color secondaryDark = Color(0xFF00897B);

  // Neutral colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey50 = Color(0xFFFAFAFA);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey800 = Color(0xFF424242);
  static const Color grey900 = Color(0xFF212121);

  // Semantic colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFFF5252);
  static const Color info = Color(0xFF2196F3);

  // Background colors
  static const Color background = white;
  static const Color surface = Color(0xFFFAFAFA);
  static const Color surfaceVariant = Color(0xFFF5F5F5);

  // Overlay colors
  static const Color scrim = Color(0x1F000000);
  static const Color shadow = Color(0x0F000000);
}

/// Typography styles and font constants
class UITypography {
  // Font sizes
  static const double fontSizeXSmall = 10.0;
  static const double fontSizeSmall = 12.0;
  static const double fontSizeMedium = 14.0;
  static const double fontSizeLarge = 16.0;
  static const double fontSizeXLarge = 18.0;
  static const double fontSizeXXLarge = 20.0;
  static const double fontSizeTitle = 24.0;
  static const double fontSizeHeading1 = 28.0;
  static const double fontSizeHeading2 = 24.0;
  static const double fontSizeHeading3 = 20.0;

  // Font family
  static const String fontFamilyDefault = 'Roboto';

  // Line heights
  static const double lineHeightSmall = 1.25;
  static const double lineHeightMedium = 1.5;
  static const double lineHeightLarge = 1.75;

  // Font weights
  static const FontWeight fontWeightThin = FontWeight.w100;
  static const FontWeight fontWeightLight = FontWeight.w300;
  static const FontWeight fontWeightRegular = FontWeight.w400;
  static const FontWeight fontWeightMedium = FontWeight.w500;
  static const FontWeight fontWeightSemiBold = FontWeight.w600;
  static const FontWeight fontWeightBold = FontWeight.w700;
  static const FontWeight fontWeightExtraBold = FontWeight.w800;
}

/// Animation durations
class AnimationDurations {
  static const Duration veryFast = Duration(milliseconds: 100);
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration verySlow = Duration(milliseconds: 800);
}
