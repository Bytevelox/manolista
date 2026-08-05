import '../entities/_entity.dart';

abstract class AuthRepository {
  Future<AuthEntity> getData();
}
