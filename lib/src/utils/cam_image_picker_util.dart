import 'dart:io';

import 'package:fa_flutter_core/fa_flutter_core.dart';

class CameraImagePickerUtil {
  factory CameraImagePickerUtil() {
    return _;
  }
  CameraImagePickerUtil._internal();
  static final CameraImagePickerUtil _ = CameraImagePickerUtil._internal();
  final _imgPicker = ImagePicker();
  Future<XFile?> getImgXFileFromCamera() => _imgPicker.pickImage(
        source: ImageSource.camera,
      );
  Future<File?> getImgFileFromCamera() async {
    final _xFile = await getImgXFileFromCamera();
    if (_xFile != null) {
      return File(
        _xFile.path,
      );
    }
    return null;
  }
}
