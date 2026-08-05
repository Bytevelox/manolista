import '../entities/_entity.dart';

abstract class HomeRepository {
  Future<HomeEntity> getData();
}
