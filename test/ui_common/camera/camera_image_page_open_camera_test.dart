import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_ui_kit/src/ui_common/camera/camera_image_page.dart';
import 'package:fa_flutter_ui_kit/src/ui_common/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

/// The camera plugin's default (method channel) implementation, which tests
/// get because no platform plugin registers itself on the host.
const _cameraChannel = MethodChannel('plugins.flutter.io/camera');

/// init() attaches a stock image instead on desktop hosts, where tests run, so
/// it does nothing here and the test calls openCamera() itself.
class _TestCameraImagePage extends CameraImagePage {
  const _TestCameraImagePage({super.key});

  @override
  CameraImagePageState createState() => _TestCameraImagePageState();
}

class _TestCameraImagePageState extends CameraImagePageState {
  @override
  Future<void> init() async {}
}

/// Records `e` calls, which hosts report to crash reporting as fatals.
class _RecordingLog implements AppLog {
  final errors = <Object?>[];

  @override
  void e(dynamic object, StackTrace s) => errors.add(object);

  @override
  void v(dynamic object) {}

  @override
  void d(dynamic object) {}

  @override
  void i(dynamic object) {}

  @override
  void w(dynamic object) {}

  @override
  void wtf(dynamic object) {}
}

/// Pumps the page and opens the camera while the camera list fails to load,
/// as CameraX does when it finds no cameras.
Future<void> _openWithCameraListFailing(WidgetTester tester) async {
  tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(_cameraChannel,
      (_) async {
    throw PlatformException(
      code: 'ExecutionException',
      message: 'CameraUnavailableException: Device reporting less cameras '
          'than anticipated.',
    );
  });
  final key = GlobalKey<CameraImagePageState>();
  await tester.pumpWidget(MaterialApp(home: _TestCameraImagePage(key: key)));
  await key.currentState!.openCamera();
  await tester.pumpAndSettle();
}

void main() {
  late AppLog originalLog;
  late _RecordingLog log;

  setUp(() {
    originalLog = faUiCommonLogger;
    log = _RecordingLog();
    faUiCommonLogger = log;
  });

  tearDown(() {
    faUiCommonLogger = originalLog;
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(_cameraChannel, null);
  });

  testWidgets(
      'openCamera: camera list fails to load → shows the error state with '
      'RETRY', (tester) async {
    await _openWithCameraListFailing(tester);

    // the page's error state, not the endless loading spinner
    expect(find.text('RETRY'), findsOneWidget);
  });

  testWidgets(
      'shutter: tapped while the camera failed to open → reports no error',
      (tester) async {
    await _openWithCameraListFailing(tester);

    await tester.tap(find.byIcon(Icons.camera_alt_rounded));
    await tester.pumpAndSettle();

    // the failure is already on screen; a second report would be a fatal
    expect(log.errors, isEmpty);
  });
}
