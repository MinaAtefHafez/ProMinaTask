import 'package:gallery_app/features/login/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({required super.user, required super.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
      token: json["token"],
    );
  }
}

class UserModel extends UserEntity {
  UserModel(
      {required super.id,
      required super.name,
      required super.email,
      required super.emailVerifiedAt,
      required super.createdAt,
      required super.updatedAt});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      emailVerifiedAt: json["email_verified_at"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }
}
