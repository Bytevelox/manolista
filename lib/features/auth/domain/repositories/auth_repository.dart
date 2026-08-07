import 'package:manolista/features/auth/domain/entities/auth_session_entity.dart';

abstract class AuthRepository {
  Future<AuthSessionEntity> login(String email, String password);
}
