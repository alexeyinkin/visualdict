import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/locales.dart';

abstract final class _Keys {
  static const lang = 'lang';
}

class SettingsNotifier extends ChangeNotifier {
  String _lang = '';

  String get lang => _lang;

  Future<void> setLang(String newValue) async {
    _lang = newValue;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_Keys.lang, newValue);
  }

  Locale get locale => Locales.byLang[_lang]!;

  Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();

    _loadLang(prefs);
  }

  void _loadLang(SharedPreferences prefs) {
    final saved = prefs.getString(_Keys.lang) ?? Locales.fallbackLang;

    if (Locales.byLang.containsKey(saved)) {
      _lang = saved;
    } else {
      _lang = Locales.fallbackLang;
      // ignore: avoid_print
      print('Lang not found: $saved, falling back to ${Locales.fallbackLang}');
    }

    notifyListeners();
  }
}
