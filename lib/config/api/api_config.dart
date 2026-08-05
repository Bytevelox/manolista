import '../app_config.dart';

class ApiConfig {
  ApiConfig._();

  static String get baseUrl => AppConfig.current.baseUrl;
  static const Duration timeout = Duration(seconds: 30);
}
