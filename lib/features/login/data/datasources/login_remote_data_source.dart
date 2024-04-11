import 'package:dio/dio.dart';
import 'package:gallery_app/core/exceptions/exceptions.dart';
import 'package:gallery_app/core/helpers/api/api_consumer.dart';
import 'package:gallery_app/core/helpers/api/end_points.dart';
import 'package:gallery_app/features/login/data/models/login_param_model/login_param_model.dart';
import 'package:gallery_app/features/login/domain/entities/login_param_entity.dart';

abstract class LoginRemoteDataSource {
  Future<Map<String, dynamic>> login(LoginParamModel loginParam);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final ApiConsumer _dioConsumer;

  LoginRemoteDataSourceImpl(this._dioConsumer);

  @override
  Future<Map<String, dynamic>> login(LoginParamEntity loginParam) async {
    try {
      final response = await _dioConsumer.post(
          url: ApiEndPoints.login, body: loginParam.toJson());
      return response;
    } on DioException catch (e) {
      throw ServerException.fromDioException(e);
    }
  }
}
