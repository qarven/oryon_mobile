import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oryon_mobile/app/l10n/l10n.dart';

class L10nCubit extends Cubit<Locale> {
  L10nCubit(this._storage) : super(_storage.read());

  final L10nStorage _storage;

  Future<void> set(Locale locale) async {
    if (locale == state ||
        !AppLocalizations.supportedLocales.contains(locale)) {
      return;
    }
    emit(locale);
    await _storage.write(locale);
  }

  Future<void> toggle() => set(
    state == const Locale('id') ? const Locale('en') : const Locale('id'),
  );
}
