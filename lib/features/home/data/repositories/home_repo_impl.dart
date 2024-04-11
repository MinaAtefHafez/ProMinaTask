import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:gallery_app/core/exceptions/exceptions.dart';
import 'package:gallery_app/core/exceptions/failures.dart';
import 'package:gallery_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:gallery_app/features/home/data/models/images_model.dart';
import 'package:gallery_app/features/home/domain/entities/images_entity.dart';
import 'package:gallery_app/features/home/domain/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;

  HomeRepoImpl(this._homeRemoteDataSource);

  @override
  Future<Either<Failure, ImagesEntity>> getImages() async {
    try {
      final data = await _homeRemoteDataSource.getImages();
      return right(ImagesModel.fromJson(data));
    } on ServerException catch (e) {
      return left(ServerFailure(e.errMessage));
    }
  }

  @override
  Future<Option<Failure>> uploadImage(File file) async {
    try {
      await _homeRemoteDataSource.uploadImage(file);
      return none();
    } on ServerException catch (e) {
      return some(ServerFailure(e.errMessage));
    }
  }
}
