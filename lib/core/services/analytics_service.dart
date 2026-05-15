/// Service to log analytics events (e.g., Firebase Analytics, Mixpanel).
class AnalyticsService {
  Future<void> logEvent(String eventName, {Map<String, dynamic>? parameters}) async {
    /// TODO: Send event to analytics provider
  }

  Future<void> setUserId(String userId) async {
    /// TODO: Set user ID for crashlytics/analytics
  }
}
