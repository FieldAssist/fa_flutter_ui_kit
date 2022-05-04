import 'package:flutter/material.dart';

import 'month_view.dart';

class MonthCalendar extends StatefulWidget {
  const MonthCalendar({
    required this.rangeData,
    Key? key,
    required this.selectedColour,
  }) : super(key: key);

  /// This function will return data as startMonthNumber, endMonthNumber, startMonthName, EndMonthName, year format
  final Function(int, int, String, String, int) rangeData;
  final Color selectedColour;
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
              callback: (startMonth, endMonth, sMonthName, eMonthName,
                  currentYearMonth) {
                selectedMonth?.add(sMonthName);
                selectedMonth?.add(eMonthName);
                startMonth = startMonth;
                endMonth = endMonth;
                currentYear = currentYearMonth;
                widget.rangeData.call(startMonth, endMonth, sMonthName,
                    eMonthName, currentYear?.toInt() ?? 0);
                setState(() {});
              },
              selectedColour: widget.selectedColour,
            ),
          ],
        ));
  }
}
