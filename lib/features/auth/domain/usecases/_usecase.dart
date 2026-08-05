import '../entities/_entity.dart';
import '../repositories/_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  const LoginUseCase(this.repository);

  Future<AuthEntity> call() async {
    return repository.getData();
  }
}
