import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sdk_protobuf_gen_dart/oryon/identity/v1/model.pb.dart';

// Keeps the access token in memory so the router guard can answer "is the user
// signed in?" synchronously, and in secure storage so it survives a restart.
class AuthSession {
  AuthSession([FlutterSecureStorage? storage])
    : _storage = storage ?? const FlutterSecureStorage();

  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';

  final FlutterSecureStorage _storage;
  String? _accessToken;

  bool get isAuthenticated => _accessToken != null;
  String? get accessToken => _accessToken;

  Future<void> restore() async {
    _accessToken = await _storage.read(key: _accessTokenKey);
  }

  Future<void> save(Token token) async {
    _accessToken = token.accessToken;
    await _storage.write(key: _accessTokenKey, value: token.accessToken);
    await _storage.write(key: _refreshTokenKey, value: token.refreshToken);
  }

  Future<void> clear() async {
    _accessToken = null;
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }
}
