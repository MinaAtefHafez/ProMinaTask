import 'package:gallery_app/features/login/domain/repositories/login_repo.dart';

class SaveTokenUseCase {
  final LoginRepo _loginRepo;

  SaveTokenUseCase(this._loginRepo);

  Future<void> call(String token) async {
    await _loginRepo.saveToken(token);
  }
}
