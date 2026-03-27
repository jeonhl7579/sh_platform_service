import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract final class _Keys {
  static const accessToken = 'auth_access_token';
  static const refreshToken = 'auth_refresh_token';
}

class SecureStorageDataSource {
  const SecureStorageDataSource({FlutterSecureStorage? storage})
    : _storage =
          storage ??
          const FlutterSecureStorage(
            aOptions: AndroidOptions(),
            iOptions: IOSOptions(
              accessibility: KeychainAccessibility.first_unlock,
            ),
          );

  final FlutterSecureStorage _storage;

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await Future.wait([
      _storage.write(key: _Keys.accessToken, value: accessToken),
      _storage.write(key: _Keys.refreshToken, value: refreshToken),
    ]);
  }

  Future<String?> getAccessToken() {
    return _storage.read(key: _Keys.accessToken);
  }

  Future<String?> getRefreshToken() {
    return _storage.read(key: _Keys.refreshToken);
  }

  Future<bool> hasValidSession() async {
    final token = await _storage.read(key: _Keys.accessToken);
    return token != null && token.isNotEmpty;
  }

  Future<void> clearTokens() async {
    await Future.wait([
      _storage.delete(key: _Keys.accessToken),
      _storage.delete(key: _Keys.refreshToken),
    ]);
  }
}
