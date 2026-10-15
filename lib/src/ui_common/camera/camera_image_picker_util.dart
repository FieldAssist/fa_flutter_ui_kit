import 'dart:io';

import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:flutter/material.dart';

import 'camera_image_page.dart';

/// Get the image from camera directly, without native handling of the camera ;)
class CameraImagePickerUtil {
  static final _imgPicker = ImagePicker();

  Future<File?> getImgFileFromCamera({
    BuildContext? context,
    bool useInAppCamera = false,
    bool showZoomControls = true,
    bool useCunningScanner = true,
  }) async {
    if (useInAppCamera) {
      return Navigator.of(context!).push<File>(
        MaterialPageRoute(
          builder: (context) => CameraImagePage(
            needImageCompressed: false,
            showZoomControls: showZoomControls,
            useCunningScanner: useCunningScanner,
          ),
        ),
      );
    }
    return _pick(ImageSource.camera);
  }

  Future<File?> getImgFileFromGallery() => _pick(ImageSource.gallery);

  /// Records a clip with the phone's camera app, at most [maxDuration] long.
  Future<File?> getVideoFileFromCamera({required Duration maxDuration}) async {
    final xFile = await _imgPicker.pickVideo(
      source: ImageSource.camera,
      maxDuration: maxDuration,
    );
    return xFile == null ? null : File(xFile.path);
  }

  Future<File?> _pick(ImageSource source) async {
    final xFile = await _imgPicker.pickImage(source: source);
    return xFile == null ? null : File(xFile.path);
  }
}
