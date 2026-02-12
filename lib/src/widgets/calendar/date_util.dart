import 'dart:core';

class DateUtil {
  var dayOfWeek = 0;

  yearLength(int year) {
    if (year <= 0) return 0;

    // Calculates the total number of days from year 1 up to (but not including) the given year.
    // (year - 1) * 365: Days if all years were non-leap years.
    // + (year - 1) ~/ 4: Add a leap day for every 4 years.
    // - (year - 1) ~/ 100: Subtract a leap day for every 100 years (century rule).
    // + (year - 1) ~/ 400: Add a leap day back for every 400 years (400-year rule).
    int y = year - 1;
    return y * 365 + (y ~/ 4 - y ~/ 100 + y ~/ 400);
  }

  //Ref:
  // 1. https://www.geeksforgeeks.org/find-day-of-the-week-for-a-given-date/
  // 2. https://en.wikipedia.org/wiki/Determination_of_the_day_of_the_week#Sakamoto's_methods
  // Explanation:
  // Although there are a plenty of methods to solve this question but one of the least known and most powerful method is **Tomohiko Sakamoto’s** Algorithm.
  // Jan 1st 1 AD is a Monday in Gregorian calendar.
  //Let us consider the first case in which we do not have leap years, hence total number of days in each year is 365.
  // January has 31 days i.e 7*4+3 days so the day on 1st feb will always be 3 days ahead of the day on 1st January.
  // Now february has 28 days(excluding leap years) which is exact multiple of 7 (7*4=28)
  // Hence there will be no change in the month of march and it will also be 3 days ahead of the day on 1st January of that respective year.
  // Considering this pattern, if we create an array of the leading number of days for each month then it will be given as t[] = {0, 3, 3, 6, 1, 4, 6, 2, 5, 0, 3, 5}.
  //Now let us look at the real case when there are leap years. Every 4 years, our calculation will gain one extra day.
  // Except every 100 years when it doesn’t. Except every 400 years when it does.
  // How do we put in these additional days? Well, just add y/4 – y/100 + y/400. Note that all division is integer division.
  // This adds exactly the required number of leap days.But here is a problem, the leap day is 29 Feb and not 0 January.
  // This means that the current year should not be counted for the leap day calculation for the first two months.
  // Suppose that if the month were January or February, we subtracted 1 from the year.
  // This means that during these months, the y/4 value would be that of the previous year and would not be counted.
  // If we subtract 1 from the t[] values of every month after February? That would fill the gap, and the leap year problem is solved.
  // hat is, we need to make the following changes:
  //    1.t[] now becomes {0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4}.
  //    2.if m corresponds to Jan/Feb (that is, month<3) we decrement y by 1.
  //    3.the annual increment inside the modulus is now y + y/4 – y/100 + y/400 in place of y.
  int dayofweek(int d, int m, int y) {
    final t = [0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4];
    y -= (m < 3) ? 1 : 0;
    return ((y + y ~/ 4 - y ~/ 100 + y ~/ 400 + t[m - 1] + d) % 7).toInt();
    //returns index of day wherein the week starts from Sunday, being 0.
  }

  day(int d, int m, int y) {
    //[0,1,2,3,4,5,6]
    //[Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday]
    //[6,0,1,2,3,4,5]
    //[Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday]
    dayOfWeek = dayofweek(d, m, y) - 1 >= 0 ? dayofweek(d, m, y) - 1 : 6;
  }

//  day(int length)
//  {
//    List<String> day = [ "Saturday", "Sunday","Monday", "Tuesday", "Wednesday","Thursday", "Friday", ];
//    print(length);
//
//    int count = (length - 1)%7;
//    String resultDay;
//
//    for (int counter = 1; counter <= length ; counter++)
//    {
//
//      bool check = ((counter > 639798) && (counter < 639811));
//      if (check == true)
//      {}
//      else
//      {
//        if (count >= 7)
//        {
//          if (count % 7 == 0)
//            count = 0;
//        }
//
//
//        resultDay = day[count];
//        count++;
//      }
//    }
//
//    if (count == 1)
//      dayOfWeek = 7;
//    else
//      dayOfWeek = (count - 1);
//
//
//    return resultDay;
//  }

  month(int monthNum) {
    var month = <String>[
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    return month[monthNum - 1];
  }

  daysInMonth(int monthNum, int year) {
    final List<int?> monthLength = List.filled(12, 0);

    monthLength[0] = 31;
    monthLength[2] = 31;
    monthLength[4] = 31;
    monthLength[6] = 31;
    monthLength[7] = 31;
    monthLength[9] = 31;
    monthLength[11] = 31;
    monthLength[3] = 30;
    monthLength[8] = 30;
    monthLength[5] = 30;
    monthLength[10] = 30;

    if (leapYear(year) == true) {
      monthLength[1] = 29;
    } else {
      monthLength[1] = 28;
    }

    return monthLength[monthNum - 1];
  }

  daysPastInYear(int monthNum, int dayNum, int year) {
    var totalMonthLength = 0;

    for (var count = 1; count < monthNum; count++) {
      totalMonthLength += int.parse(daysInMonth(count, year));
    }

    final monthLengthTotal = totalMonthLength + dayNum;

    return monthLengthTotal;
  }

  totalLengthOfDays(int monthNum, int dayNum, int year) {
    return daysPastInYear(monthNum, dayNum, year) + yearLength(year);
  }

  getWeek(int monthNum, int dayNum, int year) {
    final int a = (daysPastInYear(monthNum, dayNum, year) / 7) + 1;
    return a.toInt();
  }

  leapYear(int year) {
    var leapYear = false;

    final leap = (year % 100 == 0) && (year % 400 != 0);
    if (leap == true) {
      leapYear = false;
    } else if (year % 4 == 0) {
      leapYear = true;
    }

    return leapYear;
  }

  int daysBetween(DateTime from, DateTime to) {
    int days = to.difference(from).inDays;
    if (days < 0) {
      days *= -1;
    }
    return days;
  }
}
