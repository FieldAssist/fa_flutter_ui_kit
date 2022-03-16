import 'package:flutter/material.dart';

import 'selected_month_indicator.dart';

class MonthIdicator extends StatelessWidget {
  const MonthIdicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, cons) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SelectedMonthIndicator(
            width: cons.maxWidth * 0.42,
            month: 'Jan-2021',
            label: 'Start Month',
          ),
          SelectedMonthIndicator(
            width: cons.maxWidth * 0.42,
            month: 'Jan-2021',
            label: 'End Month',
          ),
        ],
      );
    });
  }
}