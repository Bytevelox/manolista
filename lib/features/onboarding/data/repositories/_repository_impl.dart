import '../../domain/repositories/_repository.dart';
import '../datasources/_remote_data_source.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingRemoteDataSource remoteDataSource;

  const OnboardingRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> execute() async {
    await remoteDataSource.fetch();
  }
}
