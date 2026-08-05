import '../../domain/entities/_entity.dart';
import '../../domain/repositories/_repository.dart';
import '../datasources/remote_data_source.dart';

class ReviewRepositoryImpl implements ReviewRepository {
  final ReviewRemoteDataSource remoteDataSource;

  const ReviewRepositoryImpl(this.remoteDataSource);

  @override
  Future<ReviewEntity> getData() async {
    await remoteDataSource.fetch();
    return const ReviewEntity();
  }
}
