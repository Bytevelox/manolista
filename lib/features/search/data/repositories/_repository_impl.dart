import '../../domain/repositories/_repository.dart';
import '../datasources/_remote_data_source.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource remoteDataSource;

  const SearchRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> execute() async {
    await remoteDataSource.fetch();
  }
}
