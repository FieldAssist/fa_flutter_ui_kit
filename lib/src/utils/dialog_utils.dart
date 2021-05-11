import 'package:flutter/material.dart';

class DialogUtils {
  static Future<void> showAlertDialog({
    String? title,
    String? content,
    String actionText = 'CLOSE',
    required GlobalKey<NavigatorState> navKey,
  }) async {
    await Future.delayed(Duration(milliseconds: 500));
    await showDialog(
      useRootNavigator: false,
      context: navKey.currentState!.overlay!.context,
      builder: (context) => AlertDialog(
        title: Text(
          title ?? '-',
        ),
        content: Text(
          content ?? '-',
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              navKey.currentState!.pop();
            },
            child: Text(actionText),
          ),
        ],
      ),
    );
  }
}
