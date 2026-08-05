import '../entities/_entity.dart';
import '../repositories/_repository.dart';

class PaymentUseCase {
  final PaymentRepository repository;

  const PaymentUseCase(this.repository);

  Future<PaymentEntity> call() async {
    return repository.getData();
  }
}
