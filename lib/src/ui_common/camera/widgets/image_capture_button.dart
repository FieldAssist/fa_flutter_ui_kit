import 'package:flutter/material.dart';

import '../../config/ui_common_colors.dart';
import '../../config/ui_common_texts.dart';

class ImageCaptureButton extends StatelessWidget {
  const ImageCaptureButton({
    required this.onTakePhoto,
    this.buttonText,
    this.enabled = true,
  });

  final String? buttonText;
  final VoidCallback onTakePhoto;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Column(
        children: <Widget>[
          FloatingActionButton(
            heroTag: null,
            backgroundColor: UiCommonColors.kWhite,
            //Image.asset('assets/icons/photo-camera.svg', width: 46, height: 46,),
            // Provide an onPressed callback.
            onPressed: enabled ? onTakePhoto : null,
            child: Icon(
              Icons.camera_alt_rounded,
              color:
                  !enabled ? UiCommonColors.kGrey500 : UiCommonColors.kBlack54,
              size: 36,
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
