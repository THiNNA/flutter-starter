import 'package:dio/dio.dart';
import '../storage/secure_storage_helper.dart';

/// Intercepts outgoing requests to inject the Auth Token.
class AuthInterceptor extends Interceptor {
  final SecureStorageHelper _secureStorage;

  AuthInterceptor(this._secureStorage);

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _secureStorage.getToken();
    
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle 401 Unauthorized (e.g., refresh token logic or force logout)
    if (err.response?.statusCode == 401) {
      // Trigger logout or token refresh
    }
    super.onError(err, handler);
  }
}
