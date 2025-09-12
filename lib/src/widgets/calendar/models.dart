import '../../utils/log_utils.dart';
import 'date_util.dart';

const dayName = [
  'Sat',
  'Sun',
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
];

var dateUtility = DateUtil();

class ModelDay {
  final int number;
  final bool selected;
  final bool lightSelected;
  final DateTime dateTime;

  const ModelDay(this.number, this.selected, this.lightSelected, this.dateTime);
}

class ModelWeek {
  final List<ModelDay> days;

  const ModelWeek(this.days);
}

class ModelMonth {
  final String? name;
  final int numberOfDays;
  final List<ModelWeek> weeks;

  const ModelMonth(this.weeks, this.name, this.numberOfDays);

  /*Logic credit for this function: [lib]package:date_util/date_util.dart => [func]printMonthCalendar()*/
  factory ModelMonth.fromDay(
    DateTime day,
    numberOfDays,
    DateTime? selectedDate,
  ) {
    //this function changes dateUtility.dayOfWeek value, dateUtility.dayOfWeek is a global variable in the class
//    dateUtility.day(dateUtility.daysPastInYear(day.month, 1, day.year) +
//        dateUtility.yearLength(day.year));

    dateUtility.day(day.day, day.month, day.year);

    final weeks = <ModelWeek>[];
    var days = <ModelDay>[];
    var dayNum = 0;
    var dayDays = day.day;
    for (var i = 1; i <= 6; i++) {
      days = [];
      for (var j = 1; j <= 7; j++) {
        if (dayNum >= dateUtility.dayOfWeek) {
          if (dayDays <= numberOfDays) {
            final selected = selectedDate!.day == dayDays &&
                selectedDate.month == day.month &&
                selectedDate.year == day.year;
            days.add(
              ModelDay(
                dayDays,
                selected,
                false,
                DateTime(
                  day.year,
                  day.month,
                  dayDays,
                ),
              ),
            );
          }
          ++dayDays;
        } else if (dayNum < dateUtility.dayOfWeek) {
          days.add(ModelDay(0, false, false, DateTime(day.year, 1, 1)));
        }

        dayNum++;
      }
      if (days.isNotEmpty) {
        weeks.add(ModelWeek(days));
      }
    }
    return ModelMonth(
      weeks,
      dateUtility.month(day.month) + ' ' + day.year.toString(),
      numberOfDays,
    );
  }

  factory ModelMonth.forDay(
    DateTime day,
    numberOfDays,
    DateTime? startDate,
    DateTime? endDate,
  ) {
    dateUtility.day(day.day, day.month, day.year);
    final weeks = <ModelWeek>[];
    var days = <ModelDay>[];
    var dayNum = 0;
    var dayDays = day.day;

    for (var i = 1; i <= 6; i++) {
      days = [];
      for (var j = 1; j <= 7; j++) {
        if (dayNum >= dateUtility.dayOfWeek) {
          if (dayDays <= numberOfDays) {
            final selected = _kuchFunc1(
              endDate,
              startDate!,
              DateTime(
                day.year,
                day.month,
                dayDays,
              ),
            );
            final lightSelected = _kuchFunc(
              endDate,
              startDate,
              DateTime(
                day.year,
                day.month,
                dayDays,
              ),
            );
            days.add(
              ModelDay(
                dayDays,
                selected,
                lightSelected,
                DateTime(
                  day.year,
                  day.month,
                  dayDays,
                ),
              ),
            );
          }
          ++dayDays;
        } else if (dayNum < dateUtility.dayOfWeek) {
          days.add(ModelDay(0, false, false, DateTime(day.year, 1, 1)));
        }
        dayNum++;
      }
      if (days.isNotEmpty) {
        weeks.add(ModelWeek(days));
      }
    }
    return ModelMonth(
      weeks,
      dateUtility.month(day.month) + ' ' + day.year.toString(),
      numberOfDays,
    );
  }

  static bool _kuchFunc(DateTime? endDate, DateTime startDate, DateTime date) {
    return dateCompare(date, startDate) == -1 &&
        dateCompare(date, endDate!) == 1;
  }

  static bool _kuchFunc1(DateTime? endDate, DateTime startDate, DateTime date) {
    return dateCompare(date, startDate) == 0 ||
        dateCompare(date, endDate!) == 0;
  }

  static int dateCompare(DateTime date1, DateTime date2) {
    if (date1.year == date2.year) {
      if (date1.month == date2.month) {
        if (date1.day == date2.day) {
          return 0;
        } else if (date1.day > date2.day) {
          return -1;
        } else {
          return 1;
        }
      } else if (date1.month > date2.month) {
        return -1;
      } else {
        return 1;
      }
    } else if (date1.year > date2.year) {
      return -1;
    } else {
      return 1;
    }
  }
}

class ModelYear {
  final List<ModelMonth> months;

  const ModelYear(this.months);

  factory ModelYear.DayDiff(
    DateTime endDate,
    int dayDiff,
    DateTime? selectedDate,
  ) {
    final months = <ModelMonth>[];
    /*int numberOfDays = dateUtility.daysInMonth(day.month, day.year);
    numberOfDays = remaining > numberOfDays;*/
    final startDate = endDate.subtract(Duration(days: dayDiff - 1));
    logger.d(startDate.toString());
    logger.d(endDate.toString());
    final start = startDate.month;
    final end = endDate.month;
    var startDay = startDate.day;
    if (start < end) {
      for (var i = start; i <= end; i++) {
        final _dateTime = DateTime(startDate.year, i, startDay);
        var numberOfDays = dateUtility.daysInMonth(i, startDate.year);
        final tempDays1 = numberOfDays - startDay + 1;
        final tempDays2 = dayDiff > numberOfDays ? tempDays1 : dayDiff;
        numberOfDays = startDay > 1 ? numberOfDays : tempDays2;
        dayDiff = dayDiff - tempDays1 as int;
        startDay = 1;
        months.add(ModelMonth.fromDay(_dateTime, numberOfDays, selectedDate));
      }
    } else {
      for (var i = start; i <= 12; i++) {
        final _dateTime = DateTime(startDate.year, i, startDay);
        var numberOfDays = dateUtility.daysInMonth(i, startDate.year);
        final tempDays1 = numberOfDays - startDay + 1;
        final tempDays2 = dayDiff > numberOfDays ? tempDays1 : dayDiff;
        numberOfDays = startDay > 1 ? numberOfDays : tempDays2;
        dayDiff = dayDiff - tempDays1 as int;
        startDay = 1;
        months.add(ModelMonth.fromDay(_dateTime, numberOfDays, selectedDate));
      }
      for (var i = 1; i <= end; i++) {
        final _dateTime = DateTime(endDate.year, i, startDay);
        var numberOfDays = dateUtility.daysInMonth(i, endDate.year);
        final tempDays1 = numberOfDays - startDay + 1;
        final tempDays2 = dayDiff > numberOfDays ? tempDays1 : dayDiff;
        numberOfDays = startDay > 1 ? numberOfDays : tempDays2;
        dayDiff = dayDiff - tempDays1 as int;
        startDay = 1;
        months.add(ModelMonth.fromDay(_dateTime, numberOfDays, selectedDate));
      }
    }
    return ModelYear(months);
  }

  factory ModelYear.forRange(
    DateTime? rangeStartDate,
    DateTime? rangeEndDate,
  ) {
    final months = <ModelMonth>[];

    // If dates are null, fallback to last 90 days
    final effectiveEndDate = rangeEndDate ?? DateTime.now();
    final effectiveStartDate =
        rangeStartDate ?? effectiveEndDate.subtract(const Duration(days: 90));

    final totalDays =
        effectiveEndDate.difference(effectiveStartDate).inDays + 1;

    logger.d("StartDate: $effectiveStartDate");
    logger.d("EndDate:   $effectiveEndDate");
    logger.d("Total Days: $totalDays");

    final startMonth = effectiveStartDate.month;
    final endMonth = effectiveEndDate.month;
    var startDay = effectiveStartDate.day;

    if (effectiveStartDate.year == effectiveEndDate.year) {
      // Same year
      for (var i = startMonth; i <= endMonth; i++) {
        final _dateTime = DateTime(effectiveStartDate.year, i, startDay);
        var numberOfDays = dateUtility.daysInMonth(i, effectiveStartDate.year);

        final remainingDays = effectiveEndDate.difference(_dateTime).inDays + 1;
        numberOfDays =
            remainingDays < numberOfDays ? remainingDays : numberOfDays;

        months.add(
          ModelMonth.forDay(
            _dateTime,
            numberOfDays,
            effectiveStartDate,
            effectiveEndDate,
          ),
        );

        startDay = 1; // reset for next month
      }
    } else {
      // First year (from startMonth → Dec)
      for (var i = startMonth; i <= 12; i++) {
        final _dateTime = DateTime(effectiveStartDate.year, i, startDay);
        var numberOfDays = dateUtility.daysInMonth(i, effectiveStartDate.year);

        months.add(
          ModelMonth.forDay(
            _dateTime,
            numberOfDays,
            effectiveStartDate,
            effectiveEndDate,
          ),
        );

        startDay = 1;
      }

      // Middle full years (if any)
      for (var y = effectiveStartDate.year + 1;
          y < effectiveEndDate.year;
          y++) {
        for (var i = 1; i <= 12; i++) {
          final _dateTime = DateTime(y, i, 1);
          final numberOfDays = dateUtility.daysInMonth(i, y);

          months.add(
            ModelMonth.forDay(
              _dateTime,
              numberOfDays,
              effectiveStartDate,
              effectiveEndDate,
            ),
          );
        }
      }

      // Last year (Jan → endMonth)
      for (var i = 1; i <= endMonth; i++) {
        final _dateTime = DateTime(effectiveEndDate.year, i, 1);
        var numberOfDays = dateUtility.daysInMonth(i, effectiveEndDate.year);

        // Trim last month to endDate
        if (i == endMonth) {
          numberOfDays = effectiveEndDate.day;
        }

        months.add(
          ModelMonth.forDay(
            _dateTime,
            numberOfDays,
            effectiveStartDate,
            effectiveEndDate,
          ),
        );
      }
    }

    return ModelYear(months);
  }
}
