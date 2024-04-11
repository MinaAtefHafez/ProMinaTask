import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:gallery_app/core/exceptions/failures.dart';
import 'package:gallery_app/features/home/domain/repositories/home_repo.dart';

class UploadImageUseCase {
  final HomeRepo _homeRepo;

  UploadImageUseCase(this._homeRepo);

  Future<Option<Failure>> call(File file) async {
    return _homeRepo.uploadImage(file);
  }
}
