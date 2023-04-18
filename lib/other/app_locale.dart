import 'package:flutter/material.dart';

class AppLocale extends ChangeNotifier {
  static const Locale localeEn = Locale('en', '');
  static const Locale localeZh = Locale('zh', '');
  // Locale.fromSubtags(languageCode: 'zh'), // generic Chinese 'zh'
  // Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'), // generic simplified Chinese 'zh_Hans'
  // Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'), // generic traditional Chinese 'zh_Hant'
  // Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans', countryCode: 'CN'), // 'zh_Hans_CN'
  // Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant', countryCode: 'TW'), // 'zh_Hant_TW'
  // Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant', countryCode: 'HK'), // 'zh_Hant_HK'

  static supportedLocales() {
    return const [
      localeEn,
      localeZh,
    ];
  }

  static AppLocale? _instance;

  factory AppLocale() {
    _instance ??= AppLocale._internal();
    return _instance!;
  }

  AppLocale._internal();

  Locale? _current;
  Locale? get current => _current;

  String? _currentLocaleCode;
  String get currentLocaleCode => _currentLocaleCode ?? LocaleCode.en;
  bool get hasCurrentLocale => _currentLocaleCode != null;

  /// url语言参数 isEn ? 'en' : 'zh';
  String get urlLocalCode => isEn ? 'en' : 'zh';

  bool get isEn => currentLocaleCode == LocaleCode.en;

  void configCurrent(String value) {
    Locale newLocale;
    String newLocaleCode;
    switch (value) {
      case 'zh':
        newLocale = localeZh;
        newLocaleCode = LocaleCode.cn;
        break;
      default:
        newLocale = localeEn;
        newLocaleCode = LocaleCode.en;
    }
    if (newLocale != _current) {
      _current = newLocale;
      _currentLocaleCode = newLocaleCode;
      notifyListeners();
    }
  }
}

class LocaleCode {
  static const String cn = 'cn';
  static const String en = 'en';
}
