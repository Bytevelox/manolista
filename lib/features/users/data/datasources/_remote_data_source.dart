import '../models/_model.dart';

abstract class UserProfileRemoteDataSource {
  Future<UserProfileModel> fetch();
}
