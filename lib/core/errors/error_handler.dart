import 'package:dio/dio.dart';
import 'exceptions.dart';
import 'failures.dart';

/// Centralized error handler to convert DioExceptions into clean Failures.
class ErrorHandler {
  static Failure handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkFailure('Connection timed out. Please try again.');
      case DioExceptionType.badResponse:
        final message = error.response?.data['message'] ?? 'Server error occurred.';
        return ServerFailure(message);
      case DioExceptionType.connectionError:
        return const NetworkFailure('No internet connection.');
      default:
        return const ServerFailure('An unexpected error occurred.');
    }
  }
}
