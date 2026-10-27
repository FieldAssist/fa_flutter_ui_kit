import 'package:flutter/material.dart';

import '../../config/ui_common_colors.dart';
import '../../config/ui_common_texts.dart';

class ImageCaptureButton extends StatelessWidget {
  const ImageCaptureButton({
    required this.onTakePhoto,
    this.buttonText,
    this.enabled = true,
    this.identifier,
    this.emphasizeState = false,
  });

  final String? buttonText;
  final VoidCallback onTakePhoto;
  final bool enabled;

  /// Optional `Semantics(identifier:)` on the shutter, for E2E tests. Null
  /// adds no id, so callers are unaffected.
  final String? identifier;

  /// Primary when enabled, grey when disabled, so a blocked shutter reads as
  /// off at a glance. False keeps the plain white shutter.
  final bool emphasizeState;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final background = !emphasizeState
        ? UiCommonColors.kWhite
        : enabled
            ? primary
            : UiCommonColors.kGreyM;
    final foreground = !enabled
        ? UiCommonColors.kGrey500
        : emphasizeState
            ? UiCommonColors.kWhite
            : UiCommonColors.kBlack54;
    return Container(
      height: 100,
      child: Column(
        children: <Widget>[
          Semantics(
            identifier: identifier,
            child: FloatingActionButton(
              heroTag: null,
              backgroundColor: background,
              //Image.asset('assets/icons/photo-camera.svg', width: 46, height: 46,),
              // Provide an onPressed callback.
              onPressed: enabled ? onTakePhoto : null,
              child: Icon(
                Icons.camera_alt_rounded,
                color: foreground,
                size: 36,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            buttonText ?? UiCommonTexts().kTakePhoto,
            style: TextStyle(
              letterSpacing: 1,
              color:
                  emphasizeState && !enabled ? UiCommonColors.kGrey500 : null,
            ),
          ),
        ],
      ),
    );
  }
}
