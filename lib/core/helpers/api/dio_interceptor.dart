import 'package:dio/dio.dart';
import 'package:gallery_app/core/helpers/api/end_points.dart';
import 'package:gallery_app/core/helpers/shared_preference/local_storage_keys.dart';
import 'package:gallery_app/core/helpers/shared_preference/shared_preference.dart';

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.baseUrl = ApiEndPoints.baseUrl;

    if (!options.headers.containsKey('Authorization')) {
      options.headers['Authorization'] =
          "Bearer ${SharedPref.getValue(LocalStorageKeys.token)}";
    }

    super.onRequest(options, handler);
  }
}
