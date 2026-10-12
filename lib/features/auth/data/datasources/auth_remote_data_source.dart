import 'package:connectrpc/connect.dart';
import 'package:oryon_mobile/features/auth/domain/entities/auth_failure.dart';
import 'package:oryon_mobile/features/auth/services/auth_session.dart';
import 'package:sdk_protobuf_gen_dart/oryon/identity/v1/authentication.connect.client.dart';
import 'package:sdk_protobuf_gen_dart/oryon/identity/v1/authentication.pb.dart';
import 'package:sdk_protobuf_gen_dart/oryon/identity/v1/model.pb.dart';

/// Talks to the identity service. Translates transport errors into
/// [AuthException] so nothing above the data layer sees a [ConnectException].
class AuthRemoteDataSource {
  const AuthRemoteDataSource(this._client, this._session);

  final AuthenticationServiceClient _client;
  final AuthSession _session;

  Future<Token> login({
    required String identifier,
    required String password,
  }) async {
    try {
      final response = await _client.login(
        LoginRequest(identifier: identifier, password: password),
      );
      // MFA is not wired yet; failing loudly beats a silent no-op.
      if (response.hasLoginMfa()) {
        throw const AuthException(AuthFailure.mfaUnsupported);
      }
      return response.loginToken.token;
    } on ConnectException catch (error) {
      throw AuthException(_failureOf(error.code));
    }
  }

  Future<String> register({
    required String name,
    required String identifier,
    required String password,
    required bool viaPhone,
  }) async {
    // The server rejects an empty identifier field, fill only the chosen one.
    final request = RegistrationRequest(name: name, password: password);
    if (viaPhone) {
      request.phone = identifier;
    } else {
      request.email = identifier;
    }

    try {
      final response = await _client.registration(request);
      return response.flow.id;
    } on ConnectException catch (error) {
      throw AuthException(_failureOf(error.code));
    }
  }

  Future<void> verifyRegistration({
    required String flowId,
    required String code,
    required bool viaPhone,
  }) async {
    final request = CompleteRegistrationRequest(flowId: flowId);
    if (viaPhone) {
      request.phoneCode = code;
    } else {
      request.emailCode = code;
    }

    try {
      await _client.completeRegistration(request);
    } on ConnectException catch (error) {
      throw AuthException(_failureOf(error.code));
    }
  }

  Future<void> requestPasswordReset(String identifier) async {
    try {
      await _client.initiatePasswordReset(
        InitiatePasswordResetRequest(identifier: identifier),
      );
    } on ConnectException catch (error) {
      throw AuthException(_failureOf(error.code));
    }
  }

  /// Persists the token so the router guard and the bearer interceptor see it.
  Future<void> saveSession(Token token) => _session.save(token);

  static AuthFailure _failureOf(Code code) => switch (code) {
    Code.unauthenticated => AuthFailure.invalidCredentials,
    Code.resourceExhausted => AuthFailure.tooManyAttempts,
    Code.unavailable => AuthFailure.network,
    _ => AuthFailure.unknown,
  };
}
