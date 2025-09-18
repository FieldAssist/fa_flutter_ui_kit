import 'dart:io';

import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:image_cropper/image_cropper.dart';

class ImageUtilsIr extends ImageUtils {
  static Future<CroppedFile?> getCroppedImage(File file) async {
    final cropped = await ImageCropper().cropImage(
      sourcePath: file.path,
      compressQuality: 100,
      maxWidth: 1080,
      maxHeight: 1920,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          lockAspectRatio: false,
          hideBottomControls: false,
          initAspectRatio: CropAspectRatioPreset.original,
        ),
        IOSUiSettings(
          title: 'Crop Image',
          doneButtonTitle: 'Save',
          cancelButtonTitle: 'Cancel',
          hidesNavigationBar: false,
        ),
      ],
    );

    return cropped;
  }
}
