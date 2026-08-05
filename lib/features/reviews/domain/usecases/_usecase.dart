import '../entities/_entity.dart';
import '../repositories/_repository.dart';

class ReviewUseCase {
  final ReviewRepository repository;

  const ReviewUseCase(this.repository);

  Future<ReviewEntity> call() async {
    return repository.getData();
  }
}
