import '../entities/_entity.dart';

abstract class ProfileRepository {
  Future<ProfileEntity> getData();
}
