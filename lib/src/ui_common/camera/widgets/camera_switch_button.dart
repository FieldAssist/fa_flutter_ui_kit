import 'package:flutter/material.dart';

import '../../config/ui_common_colors.dart';
import '../../config/ui_common_texts.dart';

class CameraSwitchButton extends StatelessWidget {
  const CameraSwitchButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Column(
        children: <Widget>[
          FloatingActionButton(
            backgroundColor: UiCommonColors.kWhite,
            onPressed: onPressed,
            child: Icon(
              Icons.cameraswitch_rounded,
              size: 36,
              color: UiCommonColors.kBlack54,
            ),
          ),
          SizedBox(height: 10),
          Text(UiCommonTexts().kSwitchCamera),
        ],
      ),
    );
  }
}
