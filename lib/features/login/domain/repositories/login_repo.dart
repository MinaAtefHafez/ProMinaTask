import 'package:dartz/dartz.dart';
import 'package:gallery_app/core/exceptions/failures.dart';
import 'package:gallery_app/features/login/domain/entities/login_entity.dart';
import 'package:gallery_app/features/login/domain/entities/login_param_entity.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginEntity>> login(LoginParamEntity loginParam);
  Future <void> saveToken (String token);
  Future <void> saveUserName (String userName);
 }
