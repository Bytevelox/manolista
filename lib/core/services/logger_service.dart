import 'dart:developer';

class LoggerService {
  static void info(String message) {
    log(message);
  }

  static void error(String message) {
    log(message, level: 1000);
  }
}
