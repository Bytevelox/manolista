import '../entities/_entity.dart';
import '../repositories/_repository.dart';

class ProfileUseCase {
  final ProfileRepository repository;

  const ProfileUseCase(this.repository);

  Future<ProfileEntity> call() async {
    return repository.getData();
  }
}
