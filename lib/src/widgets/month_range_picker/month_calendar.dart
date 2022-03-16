import 'package:flutter/material.dart';

import 'month_indicator.dart';
import 'month_view.dart';
import 'year_selector.dart';

class MonthCalendar extends StatefulWidget {
  const MonthCalendar({
    required this.rangeData,
    Key? key,
  }) : super(key: key);

  /// This function will return data as startMonthNumber, endMonthNumber, startMonthName, EndMonthName, year format
  final Function(int, int, String, String, int) rangeData;
  @override
  State<MonthCalendar> createState() => _MonthCalendarState();
}

class _MonthCalendarState extends State<MonthCalendar> {
  List<String> selectedMonth = <String>[];
  int? currentYear;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            MonthIndicator(
              selectedMonths: selectedMonth,
              currentYear: currentYear,
            ),
            YearSelector(
              yearCallback: (year) {
                currentYear = year;
                setState(() {});
              },
            ),
            MonthView(
              callback: (startMonth, endMonth, sMonthName, eMonthName) {
                selectedMonth.add(sMonthName);
                selectedMonth.add(eMonthName);
                widget.rangeData.call(startMonth, endMonth, sMonthName,
                    eMonthName, currentYear?.toInt() ?? 0);
                setState(() {});
              },
            ),
          ],
        ));
  }
}
