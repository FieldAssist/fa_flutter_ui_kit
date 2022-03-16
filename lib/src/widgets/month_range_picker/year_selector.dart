import 'package:flutter/material.dart';

import 'month_calendar.dart';

class YearSelector extends StatefulWidget {
  const YearSelector({
    Key? key,
  }) : super(key: key);

  @override
  State<YearSelector> createState() => _YearSelectorState();
}

class _YearSelectorState extends State<YearSelector> {
  @override
  void initState() {
    super.initState();
    currentYear = DateTime.now().year;
  }

  void valueCounter(YearCounter counterType) {
    if (counterType == YearCounter.increment) {
      if (currentYear != DateTime.now().year) {
        currentYear++;
      }
    } else {
      currentYear--;
    }
    setState(() {});
  }

  static const double iconSize = 12;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            splashRadius: 12,
            onPressed: () {
              valueCounter(YearCounter.decrement);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: iconSize,
            )),
        Text(
          '$currentYear',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
              fontSize: 21, fontWeight: FontWeight.w400, color: Colors.black),
        ),
        (currentYear != DateTime.now().year)
            ? IconButton(
                splashRadius: 12,
                onPressed: () {
                  valueCounter(YearCounter.increment);
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: iconSize,
                ))
            : const Padding(
                padding: EdgeInsets.all(15),
              ),
      ],
    );
  }
}

enum YearCounter { increment, decrement }
