import 'dart:developer';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/core/helpers/image_picker/image_picker.dart';
import 'package:gallery_app/features/home/domain/entities/images_entity.dart';
import 'package:gallery_app/features/home/domain/usecases/get_images_usecase.dart';
import 'package:gallery_app/features/home/domain/usecases/upload_image_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getImagesUseCase, this._uploadImageUseCase)
      : super(HomeInitial());

  final GetImagesUseCase _getImagesUseCase;
  ImagesEntity? imagesEntity;
  final UploadImageUseCase _uploadImageUseCase;

  Future<void> getImages() async {
    emit(GetImagesLoading());
    final result = await _getImagesUseCase();
    result.fold((failure) {
      emit(GetImagesFailure(failure.message));
    }, (model) {
      imagesEntity = model;
      emit(GetImagesSuccess());
    });
  }

  Future<void> uploadCameraImage() async {
    emit(UploadImageLoading());
    final File? imagePicked = await ImagePickerHelper.cameraPick();
    if (imagePicked != null) {
      final result = await _uploadImageUseCase(File(imagePicked.path));
      result.fold(() {
        getImages();
        emit(UploadImageSuccess());
      }, (failure) {
        emit(UploadImageFailure(failure.message));
      });
    } else {
      return;
    }
  }


   Future<void> uploadGalleryImage() async {
    emit(UploadImageLoading());
    final File? imagePicked = await ImagePickerHelper.galleryPick();
    if (imagePicked != null) {
      final result = await _uploadImageUseCase(File(imagePicked.path));
      result.fold(() {
        getImages();
        emit(UploadImageSuccess());
      }, (failure) {
        emit(UploadImageFailure(failure.message));
      });
    } else {
      return;
    }
  }


  @override
  void onChange(Change<HomeState> change) {
    super.onChange(change);
    log(change.toString());
  }
}
