import '../../domain/entities/_entity.dart';
import '../../domain/repositories/_repository.dart';
import '../datasources/remote_data_source.dart';

class BookingRepositoryImpl implements BookingRepository {
  final BookingRemoteDataSource remoteDataSource;

  const BookingRepositoryImpl(this.remoteDataSource);

  @override
  Future<BookingEntity> getData() async {
    await remoteDataSource.fetch();
    return const BookingEntity();
  }
}
