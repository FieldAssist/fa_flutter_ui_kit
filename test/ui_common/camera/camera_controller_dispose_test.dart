import 'package:camera_platform_interface/camera_platform_interface.dart';
import 'package:fa_flutter_core/fa_flutter_core.dart' show CameraController;
import 'package:fa_flutter_ui_kit/src/ui_common/camera/camera_controller_dispose.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

const _camera = CameraDescription(
  name: '0',
  lensDirection: CameraLensDirection.back,
  sensorOrientation: 90,
);

/// Fails every create, as a denied camera permission does, and throws
/// [disposeError] from dispose.
class _FakeCameraPlatform extends CameraPlatform {
  _FakeCameraPlatform(this.disposeError);

  final PlatformException disposeError;

  @override
  Stream<DeviceOrientationChangedEvent> onDeviceOrientationChanged() =>
      const Stream.empty();

  @override
  Future<int> createCameraWithSettings(
    CameraDescription cameraDescription,
    MediaSettings mediaSettings,
  ) async =>
      throw CameraException('CameraAccessDenied', 'denied');

  @override
  Future<void> dispose(int cameraId) async => throw disposeError;
}

/// A controller whose initialize() failed, so its dispose reaches the
/// platform.
Future<CameraController> _failedController() async {
  final controller = CameraController(_camera, ResolutionPreset.low);
  await expectLater(controller.initialize(), throwsA(isA<CameraException>()));
  return controller;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late CameraPlatform originalPlatform;

  setUp(() => originalPlatform = CameraPlatform.instance);

  tearDown(() => CameraPlatform.instance = originalPlatform);

  test(
      'disposeCameraController: platform dispose throws the released-preview '
      'error → completes', () async {
    CameraPlatform.instance = _FakeCameraPlatform(
      PlatformException(
        code: 'IllegalStateException',
        message: 'java.lang.IllegalStateException: '
            'releaseFlutterSurfaceTexture() cannot be called if the '
            'flutterSurfaceProducer for the camera preview has not yet been '
            'initialized.',
      ),
    );
    final controller = await _failedController();

    await expectLater(disposeCameraController(controller), completes);
  });

  test(
      'disposeCameraController: platform dispose throws any other '
      'PlatformException → rethrows it', () async {
    final error = PlatformException(code: 'IllegalStateException');
    CameraPlatform.instance = _FakeCameraPlatform(error);
    final controller = await _failedController();

    await expectLater(disposeCameraController(controller), throwsA(error));
  });
}
