import '../entities/_entity.dart';
import '../repositories/_repository.dart';

class FavoriteUseCase {
  final FavoriteRepository repository;

  const FavoriteUseCase(this.repository);

  Future<FavoriteEntity> call() async {
    return repository.getData();
  }
}
