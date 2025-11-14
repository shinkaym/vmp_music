import 'package:flutter/material.dart';
import 'localization_config.dart';

/// Custom localization delegate for the app
class AppLocalizationsDelegate extends LocalizationsDelegate<void> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return supportedLocales.any(
      (l) => l.languageCode == locale.languageCode,
    );
  }

  @override
  Future<void> load(Locale locale) async {
    LocalizationConfig.setLocale(locale);
    return;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
