import 'package:dio/dio.dart';
import 'package:gallery_app/core/helpers/api/api_consumer.dart';
import 'package:gallery_app/core/helpers/api/dio_consumer.dart';
import 'package:gallery_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:gallery_app/features/home/data/repositories/home_repo_impl.dart';
import 'package:gallery_app/features/home/domain/repositories/home_repo.dart';
import 'package:gallery_app/features/home/domain/usecases/get_images_usecase.dart';
import 'package:gallery_app/features/home/domain/usecases/upload_image_usecase.dart';
import 'package:gallery_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:gallery_app/features/login/data/datasources/login_local_data_source.dart';
import 'package:gallery_app/features/login/data/datasources/login_remote_data_source.dart';
import 'package:gallery_app/features/login/data/repositories/login_repo_impl.dart';
import 'package:gallery_app/features/login/domain/repositories/login_repo.dart';
import 'package:gallery_app/features/login/domain/usecases/login_usecase.dart';
import 'package:gallery_app/features/login/domain/usecases/save_token_usecase.dart';
import 'package:gallery_app/features/login/domain/usecases/save_user_name_usecase.dart';
import 'package:gallery_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

Future<void> setUpLocator() async {
  di.registerLazySingleton(() => Dio());
  di.registerLazySingleton<ApiConsumer>(() => DioConsumer(di()));
  //! login
  di.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(di()));
  di.registerLazySingleton<LoginLocalDataSource>(
      () => LoginLocalDataSourceImpl());
  di.registerLazySingleton<LoginRepo>(() => LoginRepoImpl(di(), di()));
  di.registerLazySingleton(() => LoginUseCase(di()));
  di.registerLazySingleton(() => SaveTokenUseCase(di()));
  di.registerLazySingleton(() => SaveUserNameUseCase(di()));
  di.registerLazySingleton(() => LoginCubit(di(), di(), di()));

  //! home

  di.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(di()));
  di.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(di()));
  di.registerLazySingleton(() => GetImagesUseCase(di()));
  di.registerLazySingleton(() => UploadImageUseCase(di()));
  di.registerLazySingleton(() => HomeCubit(di(), di()));
}
