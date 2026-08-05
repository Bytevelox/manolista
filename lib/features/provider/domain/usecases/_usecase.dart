import '../repositories/_repository.dart';

class ProviderUseCase {
  final ProviderRepository repository;

  const ProviderUseCase(this.repository);

  Future<void> call() async {
    await repository.execute();
  }
}
