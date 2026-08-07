import 'package:dio/dio.dart';
import 'package:manolista/config/api/api_endpoints.dart';
import 'package:manolista/core/errors/error_mapper.dart';
import 'package:manolista/core/errors/network_exception.dart';
import 'package:manolista/core/errors/server_exception.dart';
import 'package:manolista/core/network/api_client.dart';
import 'package:manolista/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:manolista/features/auth/data/models/user_model.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSourceImpl(this.apiClient);

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await apiClient.dio.post(
        ApiEndpoints.login,
        data: {'email': email, 'password': password},
      );
      return UserModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        throw const NetworkException('No hay conexión con el servidor');
      }

      throw ServerException(ErrorMapper.fromDioException(e));
    }
  }
}
