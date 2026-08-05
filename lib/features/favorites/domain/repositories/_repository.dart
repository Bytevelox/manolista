import '../entities/_entity.dart';

abstract class FavoriteRepository {
  Future<FavoriteEntity> getData();
}
