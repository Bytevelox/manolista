import '../models/_model.dart';

abstract class LocationRemoteDataSource {
  Future<LocationModel> fetch();
}
