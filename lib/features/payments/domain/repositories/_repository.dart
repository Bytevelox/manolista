import '../entities/_entity.dart';

abstract class PaymentRepository {
  Future<PaymentEntity> getData();
}
