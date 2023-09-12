import 'dart:ui';

const _en = 'en';
const _ru = 'ru';

abstract final class Locales {
  static const en = Locale(_en);
  static const ru = Locale(_ru);

  static const all = [en, ru];

  static const byLang = {
    _en: en,
    _ru: ru,
  };

  static const _countryByLang = {
    _en: 'gb',
  };

  static String get fallbackLang => _en;

  static String getCountryCode(String lang) => _countryByLang[lang] ?? lang;
}
