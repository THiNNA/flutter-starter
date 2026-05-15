/// Manages environment-specific configurations (Dev, Staging, Prod).
enum Environment { dev, staging, prod }

class EnvConfig {
  static late Environment environment;
  static late String baseUrl;

  static void init(Environment env) {
    environment = env;
    switch (env) {
      case Environment.dev:
        baseUrl = 'https://dev.api.example.com';
        break;
      case Environment.staging:
        baseUrl = 'https://staging.api.example.com';
        break;
      case Environment.prod:
        baseUrl = 'https://api.example.com';
        break;
    }
  }
}
