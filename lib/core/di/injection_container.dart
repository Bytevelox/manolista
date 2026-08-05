import 'package:manolista/config/environment/dev_config.dart';

Future<void> initDependencies() async {
  // Initialize environment configuration
  // You can switch between DevConfig and ProdConfig based on your needs
  DevConfig.initialize(); // or ProdConfig.initialize();

  // Initialize other dependencies here
}
