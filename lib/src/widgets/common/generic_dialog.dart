import 'package:fa_flutter_ui_kit/src/utils/log_utils.dart';

/// Using [GenericDialog]:

/// showDialog(
///     context: context,
///    builder: (_) => GenericDialog(
///           title: 'Exit',
///           subtitle: 'Are you sure?',
///           rightActionText: 'Yes',
///           rightButtonFunction: () {
///               Right Action Here
///           },
///           leftButtonFunction: () {
///               Left Action Here
///           },
///           leftActionText: 'No',
///         ));

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
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  final String? leftActionText;
  final String? rightActionText;
  final Function? rightButtonFunction;
  final Function? leftButtonFunction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: Text(title!),
      titlePadding: EdgeInsets.only(top: 16, left: 16, right: 16),
      contentPadding: EdgeInsets.all(16),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            subtitle!,
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
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
                    child: Text(leftActionText!,
                        style: TextStyle(color: Colors.blue[600])),
                  ),
                ),
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    rightButtonFunction?.call() ??
                        () {
                          Navigator.pop(context);
                        };
                  },
                  child: Text(rightActionText ?? 'Okay',
                      style: TextStyle(color: Colors.blue[600])),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
