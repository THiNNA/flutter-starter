import 'app/bootstrap.dart';
import 'core/config/app_config.dart';

void main() async {
  AppConfig.initializeDev();
  await bootstrap();
}
