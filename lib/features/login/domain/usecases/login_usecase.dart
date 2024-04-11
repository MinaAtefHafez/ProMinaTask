import 'package:dartz/dartz.dart';
import 'package:gallery_app/core/exceptions/failures.dart';
import 'package:gallery_app/features/login/domain/entities/login_entity.dart';
import 'package:gallery_app/features/login/domain/entities/login_param_entity.dart';
import 'package:gallery_app/features/login/domain/repositories/login_repo.dart';

class LoginUseCase {
  final LoginRepo _loginRepo;

  LoginUseCase(this._loginRepo);

  Future<Either<Failure, LoginEntity>> call(LoginParamEntity loginParam) async {
    return _loginRepo.login(loginParam);
  }
}
