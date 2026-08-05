import '../repositories/_repository.dart';

class LocationUseCase {
  final LocationRepository repository;

  const LocationUseCase(this.repository);

  Future<void> call() async {
    await repository.execute();
  }
}
