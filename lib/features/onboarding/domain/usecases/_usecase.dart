import '../repositories/_repository.dart';

class OnboardingUseCase {
  final OnboardingRepository repository;

  const OnboardingUseCase(this.repository);

  Future<void> call() async {
    await repository.execute();
  }
}
