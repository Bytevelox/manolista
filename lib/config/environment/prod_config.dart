import '../app_config.dart';

class ProdConfig {
  static void initialize() {
    AppConfig.current = const AppConfig(
      appName: 'Mi App',
      baseUrl: 'https://api.midominio.com/api',
      isProduction: true,
    );
  }
}
