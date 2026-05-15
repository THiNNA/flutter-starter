import 'package:flutter/foundation.dart';

/// Simple logger wrapper. In a real app, you might use the 'logger' package.
class Logger {
  static void d(String message) {
    if (kDebugMode) {
      print('💡 DEBUG: $message');
    }
  }

  static void e(String message, [dynamic error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      print('🔴 ERROR: $message');
      if (error != null) print('Exception: $error');
      if (stackTrace != null) print('StackTrace: $stackTrace');
    }
  }
}
