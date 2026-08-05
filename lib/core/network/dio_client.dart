import 'package:dio/dio.dart';

import '../../config/api/api_config.dart';

class DioClient {
  static Dio create() {
    return Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: ApiConfig.timeout,
        receiveTimeout: ApiConfig.timeout,
      ),
    );
  }
}
