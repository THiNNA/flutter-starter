import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../constants/storage_keys.dart';

/// Wrapper class for FlutterSecureStorage to handle sensitive data like tokens.
class SecureStorageHelper {
  final FlutterSecureStorage _storage;

  SecureStorageHelper(this._storage);

  Future<void> saveToken(String token) async {
    await _storage.write(key: StorageKeys.accessToken, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: StorageKeys.accessToken);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: StorageKeys.accessToken);
  }
}
