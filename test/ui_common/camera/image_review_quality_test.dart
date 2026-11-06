import 'dart:async';
import 'dart:io';

import 'package:fa_flutter_ui_kit/src/ui_common/camera/camera_capture_action.dart';
import 'package:fa_flutter_ui_kit/src/ui_common/camera/camera_host.dart';
import 'package:fa_flutter_ui_kit/src/ui_common/camera/image_review_page.dart';
import 'package:fa_flutter_ui_kit/src/ui_common/config/ui_common_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class _Host implements CameraHost {
  @override
  Color get primaryColor => Colors.blue;

  @override
  LinearGradient? get primaryGradient => null;

  @override
  Future<File> stampGeoImage(File image, String? text) async => image;
}

void main() {
  final texts = UiCommonTexts();
  final photo = File('shelf.jpg');

  setUp(() => cameraHost = _Host());

  Future<void> pump(WidgetTester tester, ImageQualityCheck? check) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ImageReviewPage(
          file: photo,
          isMultiShotMode: false,
          runQualityCheck: check,
        ),
      ),
    );
    // The check starts after the first frame.
    await tester.pump();
  }

  group('ImageReviewPage quality check', () {
    testWidgets('check running → "Analysing image quality…" over the photo',
        (tester) async {
      final result = Completer<List<String>?>();
      await pump(tester, (_) => result.future);

      expect(find.text(texts.kAnalysingImageQuality), findsOneWidget);
      expect(find.text(texts.kQualityCheck), findsNothing);
    });

    testWidgets('problems found → "Quality check" with each problem',
        (tester) async {
      await pump(
        tester,
        (_) async => ['The image looks blurry.', 'A hand covers the shelf.'],
      );
      await tester.pump();

      expect(find.text(texts.kAnalysingImageQuality), findsNothing);
      expect(find.text(texts.kQualityCheck), findsOneWidget);
      expect(find.text('•  The image looks blurry.'), findsOneWidget);
      expect(find.text('•  A hand covers the shelf.'), findsOneWidget);
      expect(find.text(texts.kQualityRetakeHint), findsOneWidget);
    });

    testWidgets('photo looks fine → no banner', (tester) async {
      await pump(tester, (_) async => const []);
      await tester.pump();

      expect(find.text(texts.kAnalysingImageQuality), findsNothing);
      expect(find.text(texts.kQualityCheck), findsNothing);
    });

    testWidgets('check did not run (null) → no banner', (tester) async {
      await pump(tester, (_) async => null);
      await tester.pump();

      expect(find.text(texts.kAnalysingImageQuality), findsNothing);
      expect(find.text(texts.kQualityCheck), findsNothing);
    });

    testWidgets('check throws → no banner, Keep still shown', (tester) async {
      await pump(tester, (_) async => throw Exception('offline'));
      await tester.pump();

      expect(find.text(texts.kAnalysingImageQuality), findsNothing);
      expect(find.text(texts.kQualityCheck), findsNothing);
      expect(find.text(texts.kKeep), findsOneWidget);
    });

    testWidgets('check gets the opened photo', (tester) async {
      File? checked;
      await pump(tester, (f) async {
        checked = f;
        return const [];
      });

      expect(checked, photo);
    });

    testWidgets('no check → no banner', (tester) async {
      await pump(tester, null);

      expect(find.text(texts.kAnalysingImageQuality), findsNothing);
      expect(find.text(texts.kQualityCheck), findsNothing);
    });

    testWidgets('page closed before the result → no error', (tester) async {
      final result = Completer<List<String>?>();
      await pump(tester, (_) => result.future);

      await tester.pumpWidget(const MaterialApp(home: SizedBox()));
      result.complete(['late']);
      await tester.pump();

      expect(tester.takeException(), isNull);
    });
  });

  group('CameraCaptureActionButton', () {
    final action = CameraCaptureAction(
      label: 'AR',
      icon: Icons.view_in_ar_outlined,
      capture: (_) async => null,
    );

    Widget appBar({VoidCallback? onPressed, double textScale = 1}) =>
        MaterialApp(
          home: MediaQuery(
            data: MediaQueryData(
              size: const Size(320, 640),
              textScaler: TextScaler.linear(textScale),
            ),
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Take Picture'),
                actions: [
                  CameraCaptureActionButton(
                    action: action,
                    onPressed: onPressed,
                  ),
                  const IconButton(
                    onPressed: null,
                    icon: Icon(Icons.document_scanner),
                  ),
                ],
              ),
            ),
          ),
        );

    testWidgets('CameraCaptureActionButton: shows its label and icon',
        (tester) async {
      await tester.pumpWidget(appBar(onPressed: () {}));

      expect(find.text('AR'), findsOneWidget);
      expect(find.byIcon(Icons.view_in_ar_outlined), findsOneWidget);
    });

    testWidgets('CameraCaptureActionButton: tap → onPressed once',
        (tester) async {
      var taps = 0;
      await tester.pumpWidget(appBar(onPressed: () => taps++));

      await tester.tap(find.text('AR'));

      expect(taps, 1);
    });

    testWidgets(
        'CameraCaptureActionButton: 2x text scale in an app bar → no overflow',
        (tester) async {
      await tester.pumpWidget(appBar(onPressed: () {}, textScale: 2));

      expect(tester.takeException(), isNull);
    });
  });
}
