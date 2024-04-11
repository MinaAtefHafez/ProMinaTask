import 'package:dartz/dartz.dart';
import 'package:gallery_app/core/exceptions/failures.dart';
import 'package:gallery_app/features/home/domain/entities/images_entity.dart';
import 'package:gallery_app/features/home/domain/repositories/home_repo.dart';

class GetImagesUseCase {
  final HomeRepo _homeRepo;

  GetImagesUseCase(this._homeRepo);

  Future<Either<Failure, ImagesEntity>> call() {
    return _homeRepo.getImages();
  }
}
