





import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:gallery_app/core/exceptions/failures.dart';
import 'package:gallery_app/features/home/domain/entities/images_entity.dart';

abstract class HomeRepo {
  Future <Either<Failure , ImagesEntity>> getImages () ;
  Future <Option <Failure>> uploadImage (File file);
}