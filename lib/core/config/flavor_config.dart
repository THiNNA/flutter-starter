enum AppFlavor { dev, staging, prod }

/// Configuration class for different environments (flavors).
class FlavorConfig {
  final AppFlavor flavor;
  final String name;
  final String baseUrl;

  static late FlavorConfig instance;

  FlavorConfig({
    required this.flavor,
    required this.name,
    required this.baseUrl,
  }) {
    instance = this;
  }

  static bool get isDev => instance.flavor == AppFlavor.dev;
  static bool get isProd => instance.flavor == AppFlavor.prod;
}
