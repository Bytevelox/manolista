import '../entities/_entity.dart';
import '../repositories/_repository.dart';

class BookingUseCase {
  final BookingRepository repository;

  const BookingUseCase(this.repository);

  Future<BookingEntity> call() async {
    return repository.getData();
  }
}
