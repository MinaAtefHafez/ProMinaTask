import 'package:dio/dio.dart';
import 'package:gallery_app/core/helpers/api/api_consumer.dart';
import 'package:gallery_app/core/helpers/api/dio_interceptor.dart';

class DioConsumer implements ApiConsumer {
  final Dio _dio;

  DioConsumer(this._dio) {
    _dio.options
      ..connectTimeout = const Duration(seconds: 5)
      ..receiveTimeout = const Duration(seconds: 5);

    _dio.interceptors.add(CustomInterceptor());
  }

  @override
  Future<dynamic> get({required String url}) async {
    final response = await _dio.get(url);
    return response.data;
  }

  @override
  Future<dynamic> post(
      {required String url,
       dynamic body,
      
       dynamic query}) async {
    final response = await _dio.post(
        url,
        data: body, queryParameters: query);
    return response.data;
  }
}
