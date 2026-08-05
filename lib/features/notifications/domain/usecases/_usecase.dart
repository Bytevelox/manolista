import '../entities/_entity.dart';
import '../repositories/_repository.dart';

class NotificationUseCase {
  final NotificationRepository repository;

  const NotificationUseCase(this.repository);

  Future<NotificationEntity> call() async {
    return repository.getData();
  }
}
