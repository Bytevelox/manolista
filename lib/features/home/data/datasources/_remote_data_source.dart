import '../models/_model.dart';

abstract class HomeRemoteDataSource {
  Future<HomeModel> fetch();
}
