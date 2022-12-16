import 'package:flutter/material.dart';

class GenericDialog extends StatelessWidget {
  const GenericDialog({
    Key? key,
    this.title,
    this.subtitle,
    this.leftActionText,
    this.rightActionText,
    this.leftButtonFunction,
    this.rightButtonFunction,
    this.subDescription,
    this.buttonBgColor = Colors.transparent,
    this.buttonTextBgColor,
    this.rightTextColor,
    this.rightButtonBgColor,
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  final String? leftActionText;
  final String? rightActionText;
  final Function? rightButtonFunction;
  final Function? leftButtonFunction;
  final String? subDescription;
  final Color buttonBgColor;
  final Color? buttonTextBgColor;
  final Color? rightTextColor;
  final Color? rightButtonBgColor;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: Text(title ?? ''),
      titlePadding: EdgeInsets.only(top: 16, left: 16, right: 16),
      contentPadding: EdgeInsets.all(16),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            subtitle ?? '',
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            subDescription ?? "",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          if (subDescription?.isNotEmpty ?? false)
            SizedBox(
              height: 20,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              if (leftButtonFunction != null && leftActionText != null)
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => leftButtonFunction?.call(),
                    child: Text(
                      leftActionText!,
                      style: TextStyle(
                        color: buttonTextBgColor ?? Colors.blue[600],
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (states) => buttonBgColor,
                      ),
                    ),
                  ),
                ),
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    if (rightButtonFunction != null) {
                      rightButtonFunction?.call();
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    rightActionText ?? 'Okay',
                    style: TextStyle(
                      color: rightTextColor ??
                          buttonTextBgColor ??
                          Colors.blue[600],
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (states) => rightButtonBgColor ?? buttonBgColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
