import '../models/_model.dart';

abstract class ServiceRemoteDataSource {
  Future<ServiceModel> fetch();
}

