import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/features/login/domain/entities/login_param_entity.dart';
import 'package:gallery_app/features/login/domain/usecases/login_usecase.dart';
import 'package:gallery_app/features/login/domain/usecases/save_token_usecase.dart';
import 'package:gallery_app/features/login/domain/usecases/save_user_name_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
      this._loginUseCase, this._saveTokenUseCase, this._saveUserNameUseCase)
      : super(LoginInitial());

  final LoginUseCase _loginUseCase;
  final SaveTokenUseCase _saveTokenUseCase;
  final SaveUserNameUseCase _saveUserNameUseCase;
  LoginParamEntity loginParam = LoginParamEntity();

  void onEmailChanged(String email) {
    loginParam = loginParam.copyWith(email: email);
  }

  void onPasswordChanged(String password) {
    loginParam = loginParam.copyWith(password: password);
  }

  Future<void> login() async {
    emit(LoginLoading());
    final result = await _loginUseCase(loginParam);
    result.fold((faliure) {
      emit(LoginFailure(faliure.message));
    }, (loginEntity) async {
      await saveToken(loginEntity.token!);
      await saveUserNameLocal(loginEntity.user!.name!);
      emit(LoginSuccess());
    });
  }

  Future<void> saveToken(String token) async {
    await _saveTokenUseCase(token);
  }

  Future<void> saveUserNameLocal(String userName) async {
    await _saveUserNameUseCase(userName);
  }

  @override
  void onChange(Change<LoginState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
