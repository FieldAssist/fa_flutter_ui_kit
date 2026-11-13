import 'dart:io';

import 'package:fa_flutter_ui_kit/src/ui_common/image_file_utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('plugins.hunghd.vn/image_cropper');
  final messenger =
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
  late Directory dir;
  late File source;

  // The cropper asserts that its source file exists.
  setUp(() {
    dir = Directory.systemTemp.createTempSync('image_file_utils_test');
    source = File('${dir.path}/source.jpg')..writeAsBytesSync([0]);
  });

  tearDown(() {
    messenger.setMockMethodCallHandler(channel, null);
    dir.deleteSync(recursive: true);
  });

  void nativeCropperFailsWith(String code) {
    messenger.setMockMethodCallHandler(
      channel,
      (_) async => throw PlatformException(
        code: code,
        message: 'x + width must be <= bitmap.width()',
      ),
    );
  }

  test('getCroppedImage: native crop_error → null, like a cancel', () async {
    nativeCropperFailsWith('crop_error');

    final result = await ImageFileUtils.getCroppedImage(source);

    expect(result, isNull);
  });

  test('getCroppedImage: native crop_error → source photo kept', () async {
    nativeCropperFailsWith('crop_error');

    await ImageFileUtils.getCroppedImage(source);

    expect(source.existsSync(), isTrue);
  });

  test('getCroppedImage: other PlatformException code → rethrown', () async {
    nativeCropperFailsWith('some_other_error');

    // only crop_error is read as a cancel
    await expectLater(
      ImageFileUtils.getCroppedImage(source),
      throwsA(
        isA<PlatformException>()
            .having((e) => e.code, 'code', 'some_other_error'),
      ),
    );
  });
}
