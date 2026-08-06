import 'package:dio/dio.dart';
import '../../config/api/api_config.dart';

class DioClient {
  DioClient._();

  static Dio create({String? Function()? tokenGetter}) {
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

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (tokenGetter != null) {
            final token = tokenGetter();
            if (token != null && token.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $token';
            }
          }
          return handler.next(options);
        },
        onError: (DioException error, handler) {
          // Log network error or trigger refresh token logic here when needed
          return handler.next(error);
        },
      ),
    );

    return dio;
  }
}
