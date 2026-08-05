import '../../domain/entities/_entity.dart';
import '../../domain/repositories/_repository.dart';
import '../datasources/remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  const AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<AuthEntity> getData() async {
    await remoteDataSource.fetch();
    return const AuthEntity();
  }
}
