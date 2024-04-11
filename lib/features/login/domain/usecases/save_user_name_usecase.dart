import 'package:gallery_app/features/login/domain/repositories/login_repo.dart';

class SaveUserNameUseCase {
  final LoginRepo _homeRepo;

  SaveUserNameUseCase(this._homeRepo);

  Future<void> call(String userName) async {
    await _homeRepo.saveUserName(userName);
  }
}
