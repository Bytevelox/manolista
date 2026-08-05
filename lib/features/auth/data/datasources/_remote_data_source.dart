import '../models/_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> fetch();
}
