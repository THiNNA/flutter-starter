import '../../../../core/storage/secure_storage_helper.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheToken(String token);
  Future<void> clearToken();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SecureStorageHelper _secureStorage;

  AuthLocalDataSourceImpl(this._secureStorage);

  @override
  Future<void> cacheToken(String token) async {
    await _secureStorage.saveToken(token);
  }

  @override
  Future<void> clearToken() async {
    await _secureStorage.deleteToken();
  }
}
