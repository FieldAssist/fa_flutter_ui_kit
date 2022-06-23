import 'package:fa_flutter_ui_kit/src/widgets/calendar/range_calendar.dart';
import 'package:flutter/material.dart';

import '../../fa_flutter_ui_kit.dart';
import '../config/colors.dart';
import '../config/typedef.dart';
import '../widgets/calendar/calendar.dart';
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

  static void showMonthRangePicker(
      {required BuildContext context,

      ///This function will return data as startMonthNumber, endMonthNumber, startMonthName, EndMonthName, year format
      required Function(int, int, String, String, int) pickedRange,
      Color selectedColour = Colors.blue}) {
    showDialog(
      barrierColor: Colors.white.withOpacity(0.1),
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: MonthCalendar(
            rangeData: (
              startMonth,
              endMonth,
              sMonthName,
              eMonthName,
              year,
            ) {
              pickedRange.call(
                  startMonth, endMonth, sMonthName, eMonthName, year);
            },
            selectedColour: selectedColour,
          ),
        );
      },
    );
  }

  static void showCalendarDatePicker({
    required BuildContext context,
    required DateSelected onDateSelected,
    required DateTime startDate,
    required DateTime selectedDate,
    required int dayDiff,
  }) {
    showDialog(
        barrierColor: Colors.white.withOpacity(0.1),
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            title: Row(
              children: [
                Icon(Icons.calendar_today, color: AppColors.colorGreenLight),
                Container(width: 16),
                Text(
                  Constants.text_calendar,
                  textScaleFactor: 1.0,
                ),
              ],
            ),
            content: Calendar(
              onDateSelected: onDateSelected,
              dayDiff: dayDiff,
              startDate: startDate,
              selectedDate: selectedDate,
            ),
          );
        });
  }

  static void showRangeCalendarDatePicker({
    required BuildContext context,
    required DateTime startDate,
    required DateTime endDate,
    required int dayDiff,
    required DateRangeSelected dateRangeSelected,
    bool showMtdL3m = false,
    int shiftEndDate = 0,
  }) {
    showDialog(
      barrierColor: Colors.white.withOpacity(0.1),
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          title: Row(
            children: [
              Icon(
                Icons.calendar_today,
              ),
              Container(
                width: 16,
              ),
              Text(
                Constants.text_calendar,
              )
            ],
          ),
          content: RangeCalendar(
            startDate: startDate,
            endDate: endDate,
            dayDiff: dayDiff,
            dateRangeSelected: dateRangeSelected,
            showMtdL3m: showMtdL3m,
            shiftEndDate: shiftEndDate,
          ),
        );
      },
    );
  }
}
