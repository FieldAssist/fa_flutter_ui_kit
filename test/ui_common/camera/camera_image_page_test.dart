import 'dart:async';

import 'package:camera_platform_interface/camera_platform_interface.dart';
import 'package:fa_flutter_ui_kit/src/ui_common/camera/camera_image_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// Models camera_android_camerax: `dispose(cameraId)` releases the last
/// preview the plugin created, whichever controller it belonged to, and throws
/// when that preview's surface is already released.
class _FakeCameraPlatform extends CameraPlatform {
  _FakeCameraPlatform({required this.failingCreate, this.initializeError});

  /// This create call fails before the plugin makes a preview, as a denied
  /// camera permission does.
  final int failingCreate;

  /// Thrown by every initializeCamera call.
  final Object? initializeError;
  int createCalls = 0;
  bool _hasPreview = false;
  bool _surfaceReleased = false;

  @override
  Future<List<CameraDescription>> availableCameras() async => const [
        CameraDescription(
          name: '0',
          lensDirection: CameraLensDirection.back,
          sensorOrientation: 90,
        ),
      ];

  @override
  Future<int> createCameraWithSettings(
    CameraDescription cameraDescription,
    MediaSettings mediaSettings,
  ) async {
    createCalls++;
    if (createCalls == failingCreate) {
      throw CameraException('CameraAccessDenied', 'denied');
    }
    _hasPreview = true;
    _surfaceReleased = false;
    return createCalls;
  }

  @override
  Future<void> initializeCamera(
    int cameraId, {
    ImageFormatGroup imageFormatGroup = ImageFormatGroup.unknown,
  }) async {
    if (initializeError != null) {
      throw initializeError!;
    }
  }

  @override
  Stream<CameraInitializedEvent> onCameraInitialized(int cameraId) =>
      Stream.value(
        CameraInitializedEvent(
          cameraId,
          1920,
          1080,
          ExposureMode.auto,
          true,
          FocusMode.auto,
          true,
        ),
      );

  @override
  Stream<CameraErrorEvent> onCameraError(int cameraId) =>
      StreamController<CameraErrorEvent>().stream;

  @override
  Stream<DeviceOrientationChangedEvent> onDeviceOrientationChanged() =>
      const Stream.empty();

  @override
  Widget buildPreview(int cameraId) => const SizedBox();

  @override
  Future<void> dispose(int cameraId) async {
    if (!_hasPreview) {
      return;
    }
    if (_surfaceReleased) {
      throw PlatformException(
        code: 'IllegalStateException',
        message: 'releaseFlutterSurfaceTexture() cannot be called if the '
            'flutterSurfaceProducer for the camera preview has not yet been '
            'initialized.',
      );
    }
    _surfaceReleased = true;
  }
}

/// init() attaches a stock image instead on desktop hosts, where tests run, so
/// it does nothing here and each test drives the camera steps itself.
class _TestCameraImagePage extends CameraImagePage {
  const _TestCameraImagePage({super.key});

  @override
  CameraImagePageState createState() => _TestCameraImagePageState();
}

class _TestCameraImagePageState extends CameraImagePageState {
  @override
  Future<void> init() async {}
}

void main() {
  late CameraPlatform originalPlatform;

  setUp(() => originalPlatform = CameraPlatform.instance);

  tearDown(() => CameraPlatform.instance = originalPlatform);

  testWidgets(
      'initController: previous controller failed to initialize after an '
      'earlier session, its dispose throws → builds a new controller',
      (tester) async {
    final platform = _FakeCameraPlatform(failingCreate: 2);
    CameraPlatform.instance = platform;
    final key = GlobalKey<CameraImagePageState>();
    await tester.pumpWidget(MaterialApp(home: _TestCameraImagePage(key: key)));
    final state = key.currentState!;
    await state.initCameras();
    await state.initCamera();
    await state.initController();
    await state.initController();

    await state.initController();

    // a new camera was created after disposing the failed one
    expect(platform.createCalls, 3);
  });

  testWidgets(
      'initController: camera permission denied → completes and shows the '
      'error state with RETRY', (tester) async {
    CameraPlatform.instance = _FakeCameraPlatform(failingCreate: 1);
    final key = GlobalKey<CameraImagePageState>();
    await tester.pumpWidget(MaterialApp(home: _TestCameraImagePage(key: key)));
    final state = key.currentState!;
    await state.initCameras();
    await state.initCamera();

    await state.initController();
    await tester.pumpAndSettle();

    // the page's error state, from the failed controller future
    expect(find.text('RETRY'), findsOneWidget);
  });

  testWidgets(
      'initController: the plugin throws a null check while initializing → '
      'completes and shows the error state with RETRY', (tester) async {
    // camera_android_camerax 0.6.30 null-checks getResolutionInfo() when
    // another controller's create has replaced its preview mid-initialize.
    CameraPlatform.instance =
        _FakeCameraPlatform(failingCreate: 0, initializeError: TypeError());
    // A phone screen: on the default 800x600 surface the error image, once an
    // earlier test has decoded it, overflows UnknownErrorWidget's Column.
    tester.view.physicalSize = const Size(1080, 2340);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);
    final key = GlobalKey<CameraImagePageState>();
    await tester.pumpWidget(MaterialApp(home: _TestCameraImagePage(key: key)));
    final state = key.currentState!;
    await state.initCameras();
    await state.initCamera();

    await state.initController();
    await tester.pumpAndSettle();

    // the page's error state, from the failed controller future
    expect(find.text('RETRY'), findsOneWidget);
  });
}
