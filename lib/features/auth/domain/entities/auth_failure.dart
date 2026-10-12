// Why a login-family call failed, in terms the domain owns. The data layer maps
// transport specific errors onto these so presentation never depends on them.
enum AuthFailure {
  invalidCredentials,
  tooManyAttempts,
  network,
  mfaUnsupported,
  unknown,
}

class AuthException implements Exception {
  const AuthException(this.failure);

  final AuthFailure failure;

  @override
  String toString() => 'AuthException($failure)';
}
