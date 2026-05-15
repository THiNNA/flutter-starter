import 'package:dio/dio.dart';
import '../constants/api_endpoints.dart';
import '../constants/app_constants.dart';
import 'auth_interceptor.dart';

/// Centralized Dio client configuration.
class DioClient {
  late final Dio dio;

  DioClient(AuthInterceptor authInterceptor) {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(milliseconds: AppConstants.connectionTimeout),
        receiveTimeout: const Duration(milliseconds: AppConstants.receiveTimeout),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Add interceptors
    dio.interceptors.add(authInterceptor);
    
    // Add logging interceptor in debug mode
    // dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }
}
