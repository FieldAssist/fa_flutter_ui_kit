import 'package:flutter/material.dart';

import 'month_view.dart';

class MonthCalendar extends StatefulWidget {
  const MonthCalendar(
      {required this.rangeData,
      Key? key,
      required this.selectedColour,
      required this.maxSelectableMonth,
      required})
      : super(key: key);

  /// This function will return data as startMonth , endMonth
  final Function(DateTime, DateTime) rangeData;
  final Color selectedColour;
  final int maxSelectableMonth;
  @override
  State<MonthCalendar> createState() => _MonthCalendarState();
}

class _MonthCalendarState extends State<MonthCalendar> {
  List<String?>? selectedMonth = <String?>[];
  int? currentYear;
  int startMonth = 1;
  int endMonth = 3;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 320,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            MonthView(
              currentYear: currentYear,
              maxMonthSelectable: widget.maxSelectableMonth,
              callback: (
                startMonth,
                endMonth,
              ) {
                startMonth = startMonth;
                endMonth = endMonth;

                widget.rangeData.call(startMonth, endMonth);
                setState(() {});
              },
              selectedColour: widget.selectedColour,
            ),
          ],
        ));
  }
}
