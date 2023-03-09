import 'dart:convert';
import 'dart:developer';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

enum LanguageEnum { vietnamese, english }

extension LanguageEnumEx on LanguageEnum {
  Locale get locale {
    switch (this) {
      case LanguageEnum.vietnamese:
        return const Locale('vi', 'VN');
      case LanguageEnum.english:
        return const Locale('en', 'US');
    }
  }

  static LanguageEnum fromLanguage(String code) {
    switch (code) {
      case 'vi':
        return LanguageEnum.vietnamese;
      default:
        return LanguageEnum.english;
    }
  }
}

class LocalizationService extends Translations {
  static final Map<String, Map<String, String>> _currentKeys = {};
  static const fallbackLocale = Locale('en', 'US');

  static Locale get currentLocale => const Locale('en', 'US');

  static LanguageEnum get currentLanguage {
    final current = Get.locale?.languageCode ?? 'en';
    return LanguageEnumEx.fromLanguage(current);
  }

  @override
  Map<String, Map<String, String>> get keys => _currentKeys;

  static Future<void> loadLanguage() async {
    const viFilePath = 'packages/flutter_clean_example_core/lib/asset/lang/vi_VN.json';
    const enFilePath = 'packages/flutter_clean_example_core/lib/asset/lang/en_US.json';

    _currentKeys['vi_VN'] = await _parseJsonFromAssets(viFilePath);
    _currentKeys['en_US'] = await _parseJsonFromAssets(enFilePath);
  }

  static void changeLocale(LanguageEnum languageEnum) => Get.updateLocale(languageEnum.locale);

  static Future<Map<String, String>> _parseJsonFromAssets(String assetsPath) async {
    final String dataString = await rootBundle.loadString(assetsPath);
    final Map<String, dynamic> jsonResult = jsonDecode(dataString);
    final Map<String, String> data = jsonResult.map((key, value) => MapEntry(key, value.toString()));
    return data;
  }
}
