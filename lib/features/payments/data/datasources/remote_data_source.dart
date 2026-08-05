import '../models/_model.dart';

abstract class PaymentRemoteDataSource {
  Future<PaymentModel> fetch();
}

