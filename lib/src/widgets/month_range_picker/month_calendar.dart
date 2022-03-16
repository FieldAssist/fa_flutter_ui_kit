import 'package:flutter/material.dart';

import 'month_indicator.dart';
import 'month_view.dart';
import 'year_selector.dart';


class MonthCalendar extends StatelessWidget {
  const MonthCalendar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 250,
        width: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[
            MonthIdicator(),
            YearSelector(),
            MonthView(),
          ],
        ));
  }
}
