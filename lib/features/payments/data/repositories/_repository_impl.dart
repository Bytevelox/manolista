import '../../domain/entities/_entity.dart';
import '../../domain/repositories/_repository.dart';
import '../datasources/remote_data_source.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  final PaymentRemoteDataSource remoteDataSource;

  const PaymentRepositoryImpl(this.remoteDataSource);

  @override
  Future<PaymentEntity> getData() async {
    await remoteDataSource.fetch();
    return const PaymentEntity();
  }
}
