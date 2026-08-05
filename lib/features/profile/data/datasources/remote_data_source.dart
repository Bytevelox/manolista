import '../models/_model.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> fetch();
}

