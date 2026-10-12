import 'package:oryon_mobile/features/auth/domain/entities/auth_failure.dart';

/// Contract for the auth feature. Throws [AuthException] when a call fails.
abstract interface class AuthRepository {
  Future<void> login({
    required String identifier,
    required String password,
  });

  /// Returns the flow id the verification screen needs.
  Future<String> register({
    required String name,
    required String identifier,
    required String password,
    required bool viaPhone,
  });

  Future<void> verifyRegistration({
    required String flowId,
    required String code,
    required bool viaPhone,
  });

  Future<void> requestPasswordReset(String identifier);
}
