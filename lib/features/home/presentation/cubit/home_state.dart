part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetImagesLoading extends HomeState {}

class GetImagesSuccess extends HomeState {}

class GetImagesFailure extends HomeState {
  final String errMessage;

  GetImagesFailure(this.errMessage);
}

class UploadImageLoading extends HomeState {}

class UploadImageSuccess extends HomeState {}

class UploadImageFailure extends HomeState {
  final String errMessage;

  UploadImageFailure(this.errMessage);
}
