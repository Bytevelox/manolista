import '../entities/_entity.dart';

abstract class ReviewRepository {
  Future<ReviewEntity> getData();
}
