import 'package:manolista/features/auth/domain/entities/user_entity.dart';

class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String? profileImgUrl;
  final String token;
  final bool isActive;

  const UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.profileImgUrl,
    required this.token,
    required this.isActive,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']?.toString() ?? '',
      firstName: json['first_name']?.toString() ?? '',
      lastName: json['last_name']?.toString() ?? '',
      profileImgUrl: json['profile_img_url']?.toString(),
      token: json['token']?.toString() ?? '',
      isActive: json['isActive'] ?? false,
    );
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      profileImgUrl: profileImgUrl,
      isActive: isActive,
    );
  }
}
