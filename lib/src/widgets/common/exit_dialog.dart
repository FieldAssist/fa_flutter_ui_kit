import 'package:fa_flutter_ui_kit/src/config/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExitDialog extends StatelessWidget {
  ExitDialog({
    required this.rightButtonFunction,
    this.title,
    this.subtitle,
    this.rightActionButtonText,
    this.leftActionButtonText,
    this.leftButtonFunction,
    this.leftButtonColor,
    this.rightButtonColor,
    this.dialogIdentifier,
    this.leftActionIdentifier,
    this.rightActionIdentifier,
  });

  final VoidCallback rightButtonFunction;
  final String? title;
  final String? subtitle;
  final String? rightActionButtonText;
  final String? leftActionButtonText;
  final VoidCallback? leftButtonFunction;
  final Color? rightButtonColor;
  final Color? leftButtonColor;

  /// Optional `Semantics(identifier:)` values for E2E tests.
  ///
  /// The default labels are 'NO' / 'YES' and callers override them freely
  /// ('Cancel' / 'Keep' on the keep-in-van confirm), so text cannot identify
  /// these buttons. Key by POSITION-ROLE — left is the dismiss action, right is
  /// the commit action — which holds whatever the labels say.
  final String? dialogIdentifier;
  final String? leftActionIdentifier;
  final String? rightActionIdentifier;

  final _btnTextStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.normal,
    fontSize: 14,
  );

  @override
  Widget build(BuildContext context) {
    return Semantics(
      identifier: dialogIdentifier ?? '',
      // Without this the dialog's own id swallows both action buttons.
      explicitChildNodes: true,
      child: AlertDialog(
      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      insetPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      content: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title ?? 'FieldAssist',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              subtitle ?? 'Do you want to exit ?',
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: Semantics(
                    identifier: leftActionIdentifier ?? '',
                    child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                      leftButtonFunction?.call();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    color: leftButtonColor ?? AppColors.kAllProductAppBar,
                    height: 40,
                    child: Text(
                      leftActionButtonText ?? 'NO',
                      style: _btnTextStyle,
                    ),
                  ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Semantics(
                    identifier: rightActionIdentifier ?? '',
                    child: MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                      rightButtonFunction.call();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    color: rightButtonColor ?? AppColors.kAllProductAppBar,
                    height: 40,
                    child: Text(
                      rightActionButtonText ?? 'YES',
                      style: _btnTextStyle,
                    ),
                  ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      ),
    );
  }
}
