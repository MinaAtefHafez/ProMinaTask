import 'package:permission_handler/permission_handler.dart';

abstract class PermissionsHelper {
  static Future<bool> getPermission(Permission permission) async {
    PermissionStatus status = await permission.status;
    if (status == PermissionStatus.granted) return true;
    if (status == PermissionStatus.denied) {
      status = await permission.request();
      return status == PermissionStatus.granted;
    } else {
      return false;
    }
  }

  static Future<bool> getCameraPermission() async {
    final status = await getPermission(Permission.camera);
    return status;
  }

}
