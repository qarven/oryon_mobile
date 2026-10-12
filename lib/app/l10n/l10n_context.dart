import 'package:flutter/widgets.dart';
import 'package:oryon_mobile/app/l10n/l10n.dart';

extension L10nX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
