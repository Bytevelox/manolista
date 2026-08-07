class UserEntity {
  final String id;
  final String firstName;
  final String lastName;
  final String? profileImgUrl;
  final bool isActive;

  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.profileImgUrl,
    required this.isActive,
  });
}
