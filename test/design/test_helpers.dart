import 'dart:io';

import 'package:fa_flutter_ui_kit/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// This package's own tests bundle its assets without the
// `packages/fa_flutter_ui_kit/` prefix that consuming apps see.
class KitAssetBundle extends CachingAssetBundle {
  static const _prefix = 'packages/fa_flutter_ui_kit/';

  @override
  Future<ByteData> load(String key) => rootBundle.load(
        key.startsWith(_prefix) ? key.substring(_prefix.length) : key,
      );
}

/// A tintable icon from the kit's own assets, for component tests.
const kTestIcon = FaIconAsset('add_a_photo', width: 18, height: 16);

Widget kitHost(Widget child, {Color? seed = FaTheme.defaultSeed}) =>
    MaterialApp(
      theme: seed == null
          ? ThemeData(useMaterial3: false)
          : FaTheme.light(seed: seed),
      home: DefaultAssetBundle(bundle: KitAssetBundle(), child: child),
    );

Future<void> loadInter() async {
  const faces = ['Regular', 'Medium', 'SemiBold', 'Bold'];
  for (final face in faces) {
    final loader = FontLoader('packages/fa_flutter_ui_kit/Inter')
      ..addFont(
        File('assets/fonts/Inter-$face.ttf')
            .readAsBytes()
            .then(ByteData.sublistView),
      );
    await loader.load();
  }
}
