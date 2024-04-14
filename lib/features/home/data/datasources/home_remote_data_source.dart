import 'dart:io';
import 'package:dio/dio.dart';
import 'package:gallery_app/core/exceptions/exceptions.dart';
import 'package:gallery_app/core/helpers/api/api_consumer.dart';
import 'package:gallery_app/core/helpers/api/end_points.dart';

abstract class HomeRemoteDataSource {
  Future<Map<String, dynamic>> getImages();
  Future<void> uploadImage(File file);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiConsumer _apiConsumer;

  HomeRemoteDataSourceImpl(this._apiConsumer);

  @override
  Future<Map<String, dynamic>> getImages() async {
    try {
      final data = await _apiConsumer.get(url: ApiEndPoints.myGallery);
      return data;
    } on DioException catch (e) {
      throw ServerException.fromDioException(e);
    }
  }

  @override
  Future<void> uploadImage(File file) async {
    try {
      var formData = FormData.fromMap({
        'img': await MultipartFile.fromFile(file.path),
      });

      await _apiConsumer.post(
        url: ApiEndPoints.upload,
        body: formData,
      );
    } on DioException catch (e) {
      throw ServerException.fromDioException(e);
    }
  }
}
