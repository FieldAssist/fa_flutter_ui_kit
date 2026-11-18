import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:flutter/services.dart';

import '../logger.dart';

/// Disposes [controller]. On Android, the camera plugin's dispose releases
/// the last preview the plugin created, not necessarily this controller's,
/// and throws when that preview's surface is already released.
/// A controller whose initialize() failed before it got a preview of its own
/// hits this. The controller is already disposed on the Dart side by then.
/// The message match holds for camera_android_camerax 0.6.30 to 0.7.6+1;
/// re-check it when upgrading.
Future<void> disposeCameraController(CameraController controller) async {
  try {
    await controller.dispose();
  } on PlatformException catch (e, s) {
    if (!(e.message?.contains('releaseFlutterSurfaceTexture') ?? false)) {
      rethrow;
    }
    // A warning, not `e`: hosts send `e` to crash reporting as a fatal.
    faUiCommonLogger.w('Camera preview was already released: $e\n$s');
  }
}
