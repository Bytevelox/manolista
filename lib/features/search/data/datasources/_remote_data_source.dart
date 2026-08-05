import '../models/_model.dart';

abstract class SearchRemoteDataSource {
  Future<SearchModel> fetch();
}
