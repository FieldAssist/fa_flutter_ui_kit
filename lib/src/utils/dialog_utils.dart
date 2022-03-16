import 'package:flutter/material.dart';

import '../widgets/month_range_picker/month_calendar.dart';

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

  static void showMonthRangePicker({
    // required GlobalKey<NavigatorState> navKey,
    required BuildContext context,
  }) {
    showDialog(
      barrierColor: Colors.white.withOpacity(0.1),
      // context: navKey.currentState!.overlay!.context,
      context: context,
      builder: (context) {
        return const AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: MonthCalendar(),
        );
      },
    );
  }
}
