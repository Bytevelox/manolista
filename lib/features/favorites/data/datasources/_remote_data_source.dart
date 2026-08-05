import '../models/_model.dart';

abstract class FavoriteRemoteDataSource {
  Future<FavoriteModel> fetch();
}
