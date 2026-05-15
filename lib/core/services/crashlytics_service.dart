import 'package:flutter/foundation.dart';
import '../utils/logger.dart';

/// Abstract class for crash reporting to allow switching providers.
abstract class CrashReportingService {
  Future<void> init();
  Future<void> recordError(dynamic exception, StackTrace? stack, {dynamic reason, bool fatal = false});
  Future<void> log(String message);
  Future<void> setUserId(String identifier);
}

/// A mock implementation of Crash Reporting using standard logging.
class MockCrashReportingService implements CrashReportingService {
  @override
  Future<void> init() async {
    Logger.d('MockCrashReportingService initialized');
  }

  @override
  Future<void> recordError(dynamic exception, StackTrace? stack, {dynamic reason, bool fatal = false}) async {
    Logger.e('Crash recorded: $exception', exception, stack);
  }

  @override
  Future<void> log(String message) async {
    Logger.d('Crashlytics Log: $message');
  }

  @override
  Future<void> setUserId(String identifier) async {
    Logger.d('Crashlytics UserID set: $identifier');
  }
}
