import 'package:fa_flutter_ui_kit/src/config/colors.dart';
import 'package:flutter/material.dart';

class OutlinedIconButton extends StatelessWidget {
  const OutlinedIconButton(
      {required this.endAction, required this.endText, required this.endIcon});

  final Function endAction;
  final Text endText;
  final Icon endIcon;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: AppColors.kOutlinedIconButtonBackgroundColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: AppColors.kOutlinedIconButtonBorderColor,
          width: 2,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      onPressed: () => endAction.call(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          endIcon,
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: endText,
          ),
        ],
      ),
    );
  }
}
