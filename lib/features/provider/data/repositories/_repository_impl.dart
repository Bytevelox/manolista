import '../../domain/repositories/_repository.dart';
import '../datasources/_remote_data_source.dart';

class ProviderRepositoryImpl implements ProviderRepository {
  final ProviderRemoteDataSource remoteDataSource;

  const ProviderRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> execute() async {
    await remoteDataSource.fetch();
  }
}
