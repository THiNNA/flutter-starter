import 'flavor_config.dart';

/// Bootstraps the application configuration based on the target flavor.
class AppConfig {
  static void initializeDev() {
    FlavorConfig(
      flavor: AppFlavor.dev,
      name: 'App Dev',
      baseUrl: 'https://dev.api.example.com',
    );
  }

  static void initializeStaging() {
    FlavorConfig(
      flavor: AppFlavor.staging,
      name: 'App Staging',
      baseUrl: 'https://staging.api.example.com',
    );
  }

  static void initializeProd() {
    FlavorConfig(
      flavor: AppFlavor.prod,
      name: 'App',
      baseUrl: 'https://api.example.com',
    );
  }
}
