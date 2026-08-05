import '../models/_model.dart';

abstract class ReviewRemoteDataSource {
  Future<ReviewModel> fetch();
}

