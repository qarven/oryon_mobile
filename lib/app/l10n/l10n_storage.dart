import 'package:flutter/material.dart';
import 'package:oryon_mobile/app/l10n/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class L10nStorage {
  L10nStorage(this._prefs);

  final SharedPreferences _prefs;

  static const _key = 'locale';
  static const _fallback = Locale('en');

  Locale read() => AppLocalizations.supportedLocales.firstWhere(
    (l) => l.languageCode == _prefs.getString(_key),
    orElse: () => _fallback,
  );

  Future<void> write(Locale locale) =>
      _prefs.setString(_key, locale.languageCode);
}
