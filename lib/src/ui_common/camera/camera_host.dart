import 'dart:io';

import 'package:flutter/material.dart';

/// What the camera screens need from the app they run in. The host sets
/// [cameraHost] once at startup.
abstract interface class CameraHost {
  /// Tenant brand colour and gradient for the review page's actions.
  Color get primaryColor;

  LinearGradient? get primaryGradient;

  /// Watermarks a geo-tagged capture with [text], or with the signed-in user
  /// and current location when [text] is null.
  Future<File> stampGeoImage(File image, String? text);
}

late CameraHost cameraHost;

/// Optional `Semantics(identifier:)` values for E2E tests on the camera and
/// image-review pages. Those pages are also opened from inside this package
/// (`CameraImagePickerUtil`, the review page's Retake), where no caller can
/// pass ids, so the host sets them once, beside [cameraHost]. Null adds no id.
class CameraSemanticIds {
  const CameraSemanticIds({
    this.shutterButton,
    this.reviewScreen,
    this.reviewKeepButton,
    this.reviewRetakeButton,
  });

  final String? shutterButton;
  final String? reviewScreen;
  final String? reviewKeepButton;
  final String? reviewRetakeButton;
}

CameraSemanticIds cameraSemanticIds = const CameraSemanticIds();
