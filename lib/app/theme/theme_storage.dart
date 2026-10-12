import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeStorage {
  ThemeStorage(this._prefs);

  static const _key = 'themeMode';

  final SharedPreferences _prefs;

  ThemeMode read() => switch (_prefs.getString(_key)) {
    'light' => ThemeMode.light,
    'dark' => ThemeMode.dark,
    _ => ThemeMode.system,
  };

  Future<void> write(ThemeMode mode) => _prefs.setString(_key, mode.name);
}
