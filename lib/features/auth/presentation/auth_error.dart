import 'package:flutter/widgets.dart';
import 'package:oryon_mobile/app/l10n/l10n.dart';
import 'package:oryon_mobile/features/auth/domain/entities/auth_failure.dart';

extension AuthErrorX on BuildContext {
  String authErrorMessage(Object error) => switch (error) {
    AuthException(failure: AuthFailure.mfaUnsupported) =>
      l10n.authMfaUnsupported,
    AuthException(failure: AuthFailure.invalidCredentials) =>
      l10n.authErrorInvalidCredentials,
    AuthException(failure: AuthFailure.tooManyAttempts) =>
      l10n.authErrorTooManyAttempts,
    AuthException(failure: AuthFailure.network) => l10n.authErrorNetwork,
    _ => l10n.authErrorGeneric,
  };
}
