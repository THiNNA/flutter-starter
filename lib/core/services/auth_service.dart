import '../storage/secure_storage_helper.dart';

/// Core authentication service interface.
/// Handled by GetIt for global access (e.g., checking if logged in on startup).
class AuthService {
  final SecureStorageHelper _secureStorage;

  AuthService(this._secureStorage);

  Future<bool> isLoggedIn() async {
    final token = await _secureStorage.getToken();
    return token != null;
  }

  Future<void> logout() async {
    await _secureStorage.deleteToken();
    // Additional logout cleanup logic
  }
}
