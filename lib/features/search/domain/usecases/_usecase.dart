import '../repositories/_repository.dart';

class SearchUseCase {
  final SearchRepository repository;

  const SearchUseCase(this.repository);

  Future<void> call() async {
    await repository.execute();
  }
}
