class AppConfig {
  final String appName;
  final String baseUrl;
  final bool isProduction;

  const AppConfig({
    required this.appName,
    required this.baseUrl,
    required this.isProduction,
  });

  static late AppConfig current;
}
