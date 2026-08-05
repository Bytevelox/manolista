import '../../domain/entities/_entity.dart';
import '../../domain/repositories/_repository.dart';
import '../datasources/remote_data_source.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteRemoteDataSource remoteDataSource;

  const FavoriteRepositoryImpl(this.remoteDataSource);

  @override
  Future<FavoriteEntity> getData() async {
    await remoteDataSource.fetch();
    return const FavoriteEntity();
  }
}
