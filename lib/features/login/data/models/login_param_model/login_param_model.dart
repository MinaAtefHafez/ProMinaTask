import 'package:gallery_app/features/login/domain/entities/login_param_entity.dart';

class LoginParamModel extends LoginParamEntity {
  LoginParamModel({required super.email, required super.password});

  factory LoginParamModel.fromEntity(LoginParamEntity loginParam) {
    return LoginParamModel(
        email: loginParam.email, password: loginParam.password);
  }
}
