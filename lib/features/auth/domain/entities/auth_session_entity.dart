import 'package:manolista/features/auth/domain/entities/user_entity.dart';

class AuthSessionEntity {
  final UserEntity user;
  final String token;

  const AuthSessionEntity({required this.user, required this.token});
}
