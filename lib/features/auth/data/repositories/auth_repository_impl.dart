import 'package:manolista/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:manolista/features/auth/domain/entities/user_entity.dart';
import 'package:manolista/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<UserEntity> login(String email, String password) async {
    final userModel = await remoteDataSource.login(email, password);
    return userModel.toEntity();
  }
}
