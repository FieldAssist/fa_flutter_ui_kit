import 'dart:async';
import 'dart:io';

import 'package:fa_flutter_ui_kit/src/ui_common/camera/camera_host.dart';
import 'package:fa_flutter_ui_kit/src/ui_common/camera/image_review_page.dart';
import 'package:fa_flutter_ui_kit/src/ui_common/config/ui_common_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_test/flutter_test.dart';

class _Host implements CameraHost {
  @override
  Color get primaryColor => Colors.blue;

  @override
  LinearGradient? get primaryGradient => null;

  @override
  Future<File> stampGeoImage(File image, String? text) async => image;
}

/// Compression succeeds without touching the photo.
class _Compress extends Fake implements FlutterImageCompressPlatform {
  @override
  Future<XFile?> compressAndGetFile(
    String path,
    String targetPath, {
    int minWidth = 1920,
    int minHeight = 1080,
    int inSampleSize = 1,
    int quality = 95,
    int rotate = 0,
    bool autoCorrectionAngle = true,
    CompressFormat format = CompressFormat.jpeg,
    bool keepExif = false,
    int numberOfRetries = 5,
  }) async =>
      XFile(targetPath);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const pathProvider = MethodChannel('plugins.flutter.io/path_provider');
  final messenger =
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
  late Directory dir;
  late FlutterImageCompressPlatform realCompress;

  setUp(() {
    cameraHost = _Host();
    realCompress = FlutterImageCompressPlatform.instance;
    FlutterImageCompressPlatform.instance = _Compress();
    dir = Directory.systemTemp.createTempSync('image_review_keep_test');
  });

  tearDown(() {
    messenger.setMockMethodCallHandler(pathProvider, null);
    FlutterImageCompressPlatform.instance = realCompress;
    dir.deleteSync(recursive: true);
  });

  final keep = find.text(UiCommonTexts().kKeep);

  /// Opens the review page over a 'caller' page. Keep stays in flight until
  /// the returned completer completes. Call from the test body: a completer
  /// made in setUp lives outside the fake-async zone and pumping never
  /// completes it.
  Future<Completer<String>> openReview(WidgetTester tester) async {
    final documentsDir = Completer<String>();
    messenger.setMockMethodCallHandler(
      pathProvider,
      (_) => documentsDir.future,
    );
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => TextButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute<File?>(
                builder: (_) => ImageReviewPage(
                  file: File('${dir.path}/shelf.jpg'),
                  isMultiShotMode: false,
                ),
              ),
            ),
            child: const Text('caller'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('caller'));
    await tester.pumpAndSettle();
    return documentsDir;
  }

  testWidgets(
      'ImageReviewPage: Keep tapped 3 times while compressing → '
      'only the review page pops', (tester) async {
    final documentsDir = await openReview(tester);

    await tester.tap(keep);
    await tester.tap(keep);
    await tester.tap(keep);
    documentsDir.complete(dir.path);
    await tester.pumpAndSettle();

    // the caller under the review page is still there
    expect(find.text('caller'), findsOneWidget);
  });

  testWidgets(
      'ImageReviewPage: back pressed while Keep compresses → '
      'the caller stays', (tester) async {
    final documentsDir = await openReview(tester);

    await tester.tap(keep);
    await tester.binding.handlePopRoute();
    documentsDir.complete(dir.path);
    await tester.pumpAndSettle();

    expect(find.text('caller'), findsOneWidget);
  });
}
