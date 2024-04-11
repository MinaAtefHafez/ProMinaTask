class LoginEntity {
  LoginEntity({
    required this.user,
    required this.token,
  });

  final UserEntity? user;
  final String? token;
}

class UserEntity {
  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? name;
  final String? email;

  final String? emailVerifiedAt;

  final String? createdAt;

  final String? updatedAt;
}
