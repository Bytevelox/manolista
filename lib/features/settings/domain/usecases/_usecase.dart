import '../repositories/_repository.dart';

class SettingsUseCase {
  final SettingsRepository repository;

  const SettingsUseCase(this.repository);

  Future<void> call() async {
    await repository.execute();
  }
}
