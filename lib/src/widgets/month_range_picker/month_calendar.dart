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
  List<String?>? selectedMonth = <String?>[];
  int? currentYear;
  int startMonth = 1;
  int endMonth = 3;

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
              selectedMonths: selectedMonth?.cast() ?? [],
              currentYear: currentYear,
            ),
            YearSelector(
              yearCallback: (year) {
                currentYear = year;
                //  widget.rangeData.call(
                //      startMonth,
                //    endMonth,
                //    selectedMonth?[0] ?? '',
                //   selectedMonth?[1] ?? '',
                //     currentYear?.toInt() ?? 0);
                setState(() {});
              },
            ),
            MonthView(
              callback: (startMonth, endMonth, sMonthName, eMonthName) {
                selectedMonth?.add(sMonthName);
                selectedMonth?.add(eMonthName);
                startMonth = startMonth;
                endMonth = endMonth;
                widget.rangeData.call(startMonth, endMonth, sMonthName,
                    eMonthName, currentYear?.toInt() ?? 0);
                setState(() {});
              },
            ),
          ],
        ));
  }
}
