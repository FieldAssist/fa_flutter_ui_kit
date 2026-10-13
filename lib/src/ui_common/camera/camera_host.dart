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
