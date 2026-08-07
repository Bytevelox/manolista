import 'package:dio/dio.dart';
import '../../config/api/api_config.dart';
import '../storage/token_storage.dart';
import 'interceptors/auth_interceptor.dart';

class DioClient {
  DioClient._();

  static Dio create(TokenStorage tokenStorage) {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConfig.baseUrl,
        connectTimeout: ApiConfig.timeout,
        receiveTimeout: ApiConfig.timeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(AuthInterceptor(tokenStorage));

    return dio;
  }
}
