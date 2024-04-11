import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_app/features/home/domain/entities/images_entity.dart';
import 'package:gallery_app/features/home/domain/usecases/get_images_usecase.dart';
import 'package:gallery_app/features/home/domain/usecases/upload_image_usecase.dart';
import 'package:image_picker/image_picker.dart';

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

  bool isImagesListNotEmpty() {
    return imagesEntity!.dataEntity!.images.isNotEmpty;
  }

  Future<void> uploadImage() async {
    emit(UploadImageLoading());
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    final result = await _uploadImageUseCase(File(image!.path));
    result.fold(() {
      emit(UploadImageSuccess());
    }, (failure) {
      log(failure.message);
      emit(UploadImageFailure(failure.message));
    });
  }

  @override
  void onChange(Change<HomeState> change) {
    super.onChange(change);
    log(change.toString());
  }
}
