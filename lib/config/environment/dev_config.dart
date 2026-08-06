import '../app_config.dart';

class DevConfig {
  static void initialize() {
    AppConfig.current = const AppConfig(
      appName: 'Mi App DEV',
      baseUrl: 'https://obbaramarket-backend.onrender.com/api/ObbaraMarket',
      isProduction: false,
    );
  }
}
