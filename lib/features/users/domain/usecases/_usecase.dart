import '../repositories/_repository.dart';

class UserProfileUseCase {
  final UserProfileRepository repository;

  const UserProfileUseCase(this.repository);

  Future<void> call() async {
    await repository.execute();
  }
}
