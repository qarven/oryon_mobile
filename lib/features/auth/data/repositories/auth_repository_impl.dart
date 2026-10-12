import 'package:oryon_mobile/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:oryon_mobile/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._remote);

  final AuthRemoteDataSource _remote;

  @override
  Future<void> login({
    required String identifier,
    required String password,
  }) async {
    final token = await _remote.login(
      identifier: identifier,
      password: password,
    );
    await _remote.saveSession(token);
  }

  @override
  Future<String> register({
    required String name,
    required String identifier,
    required String password,
    required bool viaPhone,
  }) => _remote.register(
    name: name,
    identifier: identifier,
    password: password,
    viaPhone: viaPhone,
  );

  @override
  Future<void> verifyRegistration({
    required String flowId,
    required String code,
    required bool viaPhone,
  }) => _remote.verifyRegistration(
    flowId: flowId,
    code: code,
    viaPhone: viaPhone,
  );

  @override
  Future<void> requestPasswordReset(String identifier) =>
      _remote.requestPasswordReset(identifier);
}
