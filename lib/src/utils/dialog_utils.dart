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
          OutlinedButton(
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
    required BuildContext context,

    /// function will return data as startMonth , endMonth
    required Function(DateTime, DateTime) pickedRange,
    int maxSelectableMonth = 6,
    Color selectedColour = Colors.blue,
  }) {
    showDialog(
      barrierColor: Colors.white.withOpacity(0.1),
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          contentPadding: EdgeInsets.only(top: 10.0),
          content: MonthCalendar(
            rangeData: (startMonth, endMonth) {
              pickedRange.call(
                startMonth,
                endMonth,
              );
            },
            selectedColour: selectedColour,
            maxSelectableMonth: maxSelectableMonth,
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
    double? rowCellHeight,
    double? rowCellWidth,
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
              cellWidth: rowCellWidth,
              rowCellHeight: rowCellHeight,
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
    double? rowCellHeight,
    double? rowCellWidth,
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
            cellWidth: rowCellWidth,
            rowCellHeight: rowCellHeight,
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
