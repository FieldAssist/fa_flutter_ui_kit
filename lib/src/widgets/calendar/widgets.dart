import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:flutter/material.dart';

import '../../config/typedef.dart';
import 'models.dart';

var weekRowHeight = 32.0;
var dayCellWidth = 28.0;
const overheadSpace = 80.0;

class DateChip extends StatelessWidget {
  final DateTime date;
  final String text;

  const DateChip({Key? key, required this.date, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.caption,
              textScaleFactor: 1.0,
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              DateTimeUtils.formatDateTime(
                  dateTime: date,
                  outputFormat: DateTimeFormat.FORMAT_1_dd_MMM_yyyy),
              style: Theme.of(context).textTheme.bodyText2,
              textScaleFactor: 1.0,
            )
          ],
        ),
      ),
    );
  }
}

class DateChip1 extends StatelessWidget {
  final String text;

  const DateChip1({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}

class Year extends StatefulWidget {
  final ModelYear? year;
  final DateTime? selectedDate;
  final DateTime? startDate;
  final DateSelected? onDateSelected;

  Year({
    Key? key,
    this.year,
    this.onDateSelected,
    this.selectedDate,
    this.startDate,
  }) : super(key: key);

  factory Year.fromRange(
    DateTime startDate,
    int dayDiff,
    DateSelected dateSelected,
    DateTime? selectedDate,
  ) {
    return Year(
      onDateSelected: dateSelected,
      selectedDate: selectedDate,
      startDate: startDate,
      year: ModelYear.DayDiff(startDate, dayDiff, selectedDate),
    );
  }

  factory Year.forRange(
    DateTime currentDate,
    DateTime? startDate,
    DateTime? endDate,
    int dayDiff,
    DateSelected dateSelected,
  ) {
    return Year(
      onDateSelected: dateSelected,
      selectedDate: startDate,
      startDate: startDate,
      year: ModelYear.forRange(currentDate, startDate, endDate, dayDiff),
    );
  }

  @override
  State<Year> createState() => _YearState();
}

class _YearState extends State<Year> {
  final ScrollController _controller = ScrollController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.selectedDate!.month == widget.startDate!.month) {
        _controller.jumpTo(_controller.position.maxScrollExtent);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _controller,
      physics: BouncingScrollPhysics(),
      itemCount: widget.year!.months.length,
      itemBuilder: (context, index) {
        return Month(
          onDateSelected: widget.onDateSelected,
          month: widget.year!.months[index],
        );
      },
    );
  }
}

class DayCell extends StatelessWidget {
  final Widget? child;
  final bool selected;
  final bool lightSelected;

  const DayCell({
    Key? key,
    this.child,
    this.selected = false,
    this.lightSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dayCellWidth,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected
            ? Theme.of(context).primaryColorLight
            : lightSelected
                ? Theme.of(context).primaryColorLight
                : Colors.transparent,
      ),
      child: Center(child: child),
    );
  }
}

class CalendarRow extends StatelessWidget {
  final List<Widget>? children;

  const CalendarRow({Key? key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: children!,
    );
  }
}

class WeekName extends StatelessWidget {
  final String? name;

  const WeekName({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DayCell(
      child: Text(
        name!,
        style: Theme.of(context)
            .textTheme
            .bodyText2!
            .copyWith(color: Theme.of(context).colorScheme.secondary),
        textScaleFactor: 1.0,
      ),
    );
  }
}

class MonthName extends StatelessWidget {
  final String? name;

  const MonthName({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        name!,
        textScaleFactor: 1.0,
      ),
    );
  }
}

class Day extends StatefulWidget {
  final ModelDay? day;
  final DateSelected? onDateSelected;

  const Day({Key? key, this.day, required this.onDateSelected})
      : super(key: key);

  @override
  _DayState createState() => _DayState();
}

class _DayState extends State<Day> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.day!.number == 0
          ? null
          : () => widget.onDateSelected!(widget.day!.dateTime),
      child: DayCell(
        selected: widget.day!.selected,
        lightSelected: widget.day!.lightSelected,
        child: Text(
          widget.day!.number == 0 ? ' ' : widget.day!.number.toString(),
          style: Theme.of(context).textTheme.bodyText2,
          textScaleFactor: 1.0,
        ),
      ),
    );
  }
}

class WeekNameRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CalendarRow(
      children: [
        WeekName(
          name: dayName[2],
        ),
        WeekName(
          name: dayName[3],
        ),
        WeekName(
          name: dayName[4],
        ),
        WeekName(
          name: dayName[5],
        ),
        WeekName(
          name: dayName[6],
        ),
        WeekName(
          name: dayName[0],
        ),
        WeekName(
          name: dayName[1],
        ),
      ],
    );
  }
}

class Week extends StatelessWidget {
  final ModelWeek? week;
  final DateSelected? onDateSelected;

  const Week({Key? key, this.week, required this.onDateSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: weekRowHeight,
      child: CalendarRow(
        children: [
          Day(
            onDateSelected: onDateSelected,
            day: week!.days.isNotEmpty
                ? week!.days[0]
                : ModelDay(0, false, false, DateTime.now()),
          ),
          Day(
            onDateSelected: onDateSelected,
            day: week!.days.length > 1
                ? week!.days[1]
                : ModelDay(0, false, false, DateTime.now()),
          ),
          Day(
            onDateSelected: onDateSelected,
            day: week!.days.length > 2
                ? week!.days[2]
                : ModelDay(0, false, false, DateTime.now()),
          ),
          Day(
            onDateSelected: onDateSelected,
            day: week!.days.length > 3
                ? week!.days[3]
                : ModelDay(0, false, false, DateTime.now()),
          ),
          Day(
            onDateSelected: onDateSelected,
            day: week!.days.length > 4
                ? week!.days[4]
                : ModelDay(0, false, false, DateTime.now()),
          ),
          Day(
            onDateSelected: onDateSelected,
            day: week!.days.length > 5
                ? week!.days[5]
                : ModelDay(0, false, false, DateTime.now()),
          ),
          Day(
            onDateSelected: onDateSelected,
            day: week!.days.length > 6
                ? week!.days[6]
                : ModelDay(0, false, false, DateTime.now()),
          ),
        ],
      ),
    );
  }
}

class Month extends StatelessWidget {
  final ModelMonth? month;
  final DateSelected? onDateSelected;

  const Month({Key? key, this.month, required this.onDateSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (month!.weeks.length * weekRowHeight) + overheadSpace,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: MonthName(
              name: month!.name,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: WeekNameRow(),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: month!.weeks.length,
                itemBuilder: (context, index) {
                  return Week(
                    onDateSelected: onDateSelected,
                    week: month!.weeks[index],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

void displaySnackbar(
    {required String message,
    required Color color,
    required BuildContext context}) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(
    SnackBar(
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            message.toString(),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            icon: Icon(
              Icons.close,
              color: Colors.white,
            ),
          )
        ],
      ),
      duration: Duration(seconds: 2),
    ),
  );
}
