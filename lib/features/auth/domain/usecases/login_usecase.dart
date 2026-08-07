import 'package:manolista/features/auth/domain/entities/auth_session_entity.dart';

import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  const LoginUseCase(this.repository);

  Future<AuthSessionEntity> call(String email, String password) {
    return repository.login(email, password);
  }
}
