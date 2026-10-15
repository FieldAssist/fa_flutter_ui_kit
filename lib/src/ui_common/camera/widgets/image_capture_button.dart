import 'package:flutter/material.dart';

import '../../config/ui_common_colors.dart';
import '../../config/ui_common_texts.dart';

class ImageCaptureButton extends StatelessWidget {
  const ImageCaptureButton({
    required this.onTakePhoto,
    this.buttonText,
    this.enabled = true,
    this.identifier,
  });

  final String? buttonText;
  final VoidCallback onTakePhoto;
  final bool enabled;

  /// Optional `Semantics(identifier:)` on the shutter, for E2E tests. Null
  /// adds no id, so callers are unaffected.
  final String? identifier;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Column(
        children: <Widget>[
          Semantics(
            identifier: identifier,
            child: FloatingActionButton(
              heroTag: null,
              backgroundColor: UiCommonColors.kWhite,
              //Image.asset('assets/icons/photo-camera.svg', width: 46, height: 46,),
              // Provide an onPressed callback.
              onPressed: enabled ? onTakePhoto : null,
              child: Icon(
                Icons.camera_alt_rounded,
                color: !enabled
                    ? UiCommonColors.kGrey500
                    : UiCommonColors.kBlack54,
                size: 36,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            buttonText ?? UiCommonTexts().kTakePhoto,
            style: TextStyle(
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
