import 'dart:io';

import 'package:gallery_app/core/helpers/permissions/permissions.dart';
import 'package:image_picker/image_picker.dart';

abstract class ImagePickerHelper {
  static Future<bool> getPermission() async {
    final cameraStatus = await PermissionsHelper.getCameraPermission();
    return cameraStatus ;
  }

  static Future<File?> cameraPick() async {
    final permission = await getPermission();
    if (permission) {
      final file = await ImagePicker().pickImage(source: ImageSource.camera);
      if (file != null) {
        return File(file.path);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<File?> galleryPick() async {
    final permission = await getPermission();
    if (permission) {
      final file = await ImagePicker().pickImage(source: ImageSource.camera);
      if (file != null) {
        return File(file.path);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
