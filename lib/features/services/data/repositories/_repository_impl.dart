import '../../domain/entities/_entity.dart';
import '../../domain/repositories/_repository.dart';
import '../datasources/remote_data_source.dart';

class ServiceRepositoryImpl implements ServiceRepository {
  final ServiceRemoteDataSource remoteDataSource;

  const ServiceRepositoryImpl(this.remoteDataSource);

  @override
  Future<ServiceEntity> getData() async {
    await remoteDataSource.fetch();
    return const ServiceEntity();
  }
}
