import 'package:manolista/features/auth/domain/entities/user_entity.dart';

class UserModel {
  final String id;
  final String email;
  final String? name;

  const UserModel({required this.id, required this.email, this.name});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      name: json['name']?.toString(),
    );
  }

  UserEntity toEntity() {
    return UserEntity(id: id, email: email, name: name);
  }
}
