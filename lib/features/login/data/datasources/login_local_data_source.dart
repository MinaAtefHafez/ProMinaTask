import 'package:gallery_app/core/helpers/shared_preference/local_storage_keys.dart';
import 'package:gallery_app/core/helpers/shared_preference/shared_preference.dart';

abstract class LoginLocalDataSource {
  Future<void> saveToken(String token);
  Future<void> saveUserName(String userName);
}

class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  @override
  Future<void> saveToken(String token) async {
    SharedPref.setValue(LocalStorageKeys.token, value: token);
  }

  @override
  Future<void> saveUserName(String userName) async {
    SharedPref.setValue(LocalStorageKeys.userName, value: userName);
  }
}
