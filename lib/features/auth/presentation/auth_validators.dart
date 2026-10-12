import 'package:oryon_mobile/app/l10n/l10n.dart';

// Same shape as the server side rules in authentication.proto.
final _email = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
final _phone = RegExp(r'^\+[1-9]\d{1,14}$');

String? validateRequired(AppLocalizations l10n, String? value) =>
    value == null || value.isEmpty ? l10n.authRequired : null;

String? validateEmail(AppLocalizations l10n, String? value) {
  if (value == null || value.isEmpty) return l10n.authRequired;
  return _email.hasMatch(value) ? null : l10n.authErrorInvalidEmail;
}

String? validatePhone(AppLocalizations l10n, String? value) {
  if (value == null || value.isEmpty) return l10n.authRequired;
  return _phone.hasMatch(value) ? null : l10n.authErrorInvalidPhone;
}

String? validatePassword(AppLocalizations l10n, String? value) {
  if (value == null || value.isEmpty) return l10n.authRequired;
  return value.length >= 8 ? null : l10n.authErrorPasswordTooShort;
}
