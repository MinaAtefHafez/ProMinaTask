import 'package:dartz/dartz.dart';
import 'package:gallery_app/core/exceptions/exceptions.dart';
import 'package:gallery_app/core/exceptions/failures.dart';
import 'package:gallery_app/features/login/data/datasources/login_local_data_source.dart';
import 'package:gallery_app/features/login/data/datasources/login_remote_data_source.dart';
import 'package:gallery_app/features/login/data/models/login_model/login_model.dart';
import 'package:gallery_app/features/login/data/models/login_param_model/login_param_model.dart';
import 'package:gallery_app/features/login/domain/entities/login_entity.dart';
import 'package:gallery_app/features/login/domain/entities/login_param_entity.dart';
import 'package:gallery_app/features/login/domain/repositories/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final LoginRemoteDataSource _loginRemoteDataSource;
  final LoginLocalDataSource _loginLocalDataSource;
  LoginRepoImpl(this._loginRemoteDataSource, this._loginLocalDataSource);

  @override
  Future<Either<Failure, LoginEntity>> login(
      LoginParamEntity loginParam) async {
    try {
      final data = await _loginRemoteDataSource
          .login(LoginParamModel.fromEntity(loginParam));
      return right(LoginModel.fromJson(data));
    } on ServerException catch (e) {
      return left(ServerFailure(e.errMessage));
    }
  }

  @override
  Future<void> saveToken(String token) async {
    await _loginLocalDataSource.saveToken(token);
  }

  @override
  Future<void> saveUserName(String userName) async {
    await _loginLocalDataSource.saveUserName(userName);
  }
}
