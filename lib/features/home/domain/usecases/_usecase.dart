import '../entities/_entity.dart';
import '../repositories/_repository.dart';

class HomeUseCase {
  final HomeRepository repository;

  const HomeUseCase(this.repository);

  Future<HomeEntity> call() async {
    return repository.getData();
  }
}
