import '../../domain/entities/_entity.dart';
import '../../domain/repositories/_repository.dart';
import '../datasources/remote_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  const HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<HomeEntity> getData() async {
    await remoteDataSource.fetch();
    return const HomeEntity();
  }
}
