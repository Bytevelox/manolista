import '../entities/_entity.dart';
import '../repositories/_repository.dart';

class ServiceUseCase {
  final ServiceRepository repository;

  const ServiceUseCase(this.repository);

  Future<ServiceEntity> call() async {
    return repository.getData();
  }
}
