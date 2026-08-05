import '../../domain/repositories/_repository.dart';
import '../datasources/_remote_data_source.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final UserProfileRemoteDataSource remoteDataSource;

  const UserProfileRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> execute() async {
    await remoteDataSource.fetch();
  }
}
