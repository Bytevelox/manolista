import '../../domain/repositories/_repository.dart';
import '../datasources/_remote_data_source.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource remoteDataSource;

  const LocationRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> execute() async {
    await remoteDataSource.fetch();
  }
}
