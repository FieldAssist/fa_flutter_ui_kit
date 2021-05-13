import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:meta/meta.dart';

import 'log_utils.dart';

class DateTimeUtils {
  DateTimeUtils._();

  static final format_Iso8601 = DateFormat("yyyy-MM-ddThh:mmZ");
  static int FORMAT_ISO_8601 = 1;
  static const String FORMAT_dd_MMMM_yyyy = "dd MMMM yyyy";
  static const String FORMAT_dd_MMM_yyyy = "dd MMM yyyy";
  static const String FORMAT_dd_MMM_yy = "dd MMM yyyy";
  static String FORMAT_dd_MMM = "dd MMM";
  static String FORMAT_dd_MM_yyyy = "dd/MM/yyyy";
  static String FORMAT_dd_MM_yyyy_HH_MM_AM_PM = "dd/MM/yyyy hh:mm a";
  static String FORMAT_dd_MMMM_yyyy_HH_MM_AM_PM = "dd MMMM yyyy hh:mm a";
  static String FORMAT_dd_MMM_yyyy_HH_MM_AM_PM = "dd MMM yyyy hh:mm a";
  static String FORMAT_dd_MMM_yy_HH_MM_AM_PM = "dd MMM yy hh:mm a";
  static String FORMAT_dd_MMMM_HH_MM_AM_PM = "dd MMMM hh:mm a";
  static String FORMAT_HH_MM_AM_PM = "hh:mm a";
  static String FORMAT_HH_MM = "hh:mm";
  static String FORMAT_plan_dd_MM_yyyy = "dd/MM/yyyy";
  static String FORMAT_new_plan_dd_MM_yyyy = "yyyy-MM-dd";
  static String FORMAT_route_yyyyMMdd = "yyyyMMdd";
  static String FORMAT_day = "EEEE";
  static String FORMAT_day_short = "EEE";

  static String fromIso8601Format(String date) =>
      DateFormat("dd/MM/yyyy hh:mm a").format(format_Iso8601.parse(date));

  static DateTime parseDatefromIso8601Format(String date) =>
      (format_Iso8601.parse(date));

  static String format(
      {required String date, required int inputFormat, String? outputFormat}) {
    if (inputFormat == FORMAT_ISO_8601) {
      if (outputFormat != null)
        return DateFormat(outputFormat).format(format_Iso8601.parse(date));
      else
        return DateFormat("dd MMMM hh:mm a").format(format_Iso8601.parse(date));
    } else
      return "DateFormat not supported";
  }

  static String getFormattedDateTime(String date) {
    var datetime = DateTime.parse(date).toLocal();
    return DateFormat(FORMAT_dd_MMMM_HH_MM_AM_PM).format(datetime);
  }

  static String getTime(String date) {
    var datetime = DateTime.parse(date).toLocal();
    return DateFormat(FORMAT_HH_MM_AM_PM).format(datetime);
  }

  static String formatDate(DateTime date) {
    return DateFormat(FORMAT_dd_MM_yyyy).format(date);
  }

  static String formatDate4(DateTime date) {
    return DateFormat(FORMAT_dd_MMM_yy).format(date);
  }

  static String formatDate2(DateTime date) {
    return DateFormat(FORMAT_dd_MMMM_yyyy).format(date);
  }

  static String formatDate3(DateTime date) {
    return DateFormat(FORMAT_dd_MMM_yyyy).format(date);
  }

  static String formatDateddmmm(DateTime date) {
    return DateFormat(FORMAT_dd_MMM).format(date);
  }

  static String formatDateTime(DateTime date) {
    return DateFormat(FORMAT_dd_MM_yyyy_HH_MM_AM_PM).format(date);
  }

  static String formatDateTime1(DateTime date) {
    return DateFormat(FORMAT_dd_MMMM_yyyy_HH_MM_AM_PM).format(date);
  }

  static String formatDateTime4(DateTime date) {
    return DateFormat(FORMAT_dd_MMM_yyyy_HH_MM_AM_PM).format(date);
  }

  static String formatDateTime3(DateTime date) {
    return DateFormat(FORMAT_dd_MMM_yy_HH_MM_AM_PM).format(date);
  }

  static String formatDateTime2(DateTime date) {
    return DateFormat("dd MMM yy - EEEE").format(date);
  }

  static String formatDSRDate(String date) {
    return DateFormat("dd MMM yy - EEEE")
        .format(DateFormat(FORMAT_dd_MM_yyyy).parse(date));
  }

  static DateTime parseDate1(String time) {
    return format_Iso8601.parse(time);
  }

  static String formatTime(DateTime date) {
    return DateFormat(FORMAT_HH_MM_AM_PM).format(date);
  }

  static String parseDate(String date, String format) {
    return DateFormat(FORMAT_dd_MM_yyyy).format(DateTime.now());
  }

  static DateTime parsePlaningDate(String date) {
    return DateFormat(FORMAT_plan_dd_MM_yyyy).parse(date);
  }

  static String formatPlaningDate(DateTime date) {
    return DateFormat(FORMAT_plan_dd_MM_yyyy).format(date);
  }

  static DateTime parseNewPlaningDate(String date) {
    return DateFormat(FORMAT_new_plan_dd_MM_yyyy).parse(date);
  }

  static String formatNewPlaningDate(DateTime date) {
    return DateFormat(FORMAT_new_plan_dd_MM_yyyy).format(date);
  }

  static String formatRoutePlaningDate(DateTime date) {
    return DateFormat(FORMAT_route_yyyyMMdd).format(date);
  }

  static DateTime parseRoutePlaningDate(String date) {
    return DateFormat(FORMAT_route_yyyyMMdd).parse(date);
  }

  static int? convertAnyDateToyyyyMMdd(String date) {
    try {
      return int.tryParse(
        DateFormat(FORMAT_route_yyyyMMdd).format(
          parsePlaningDate(date),
        ),
      );
    } catch (e, s) {
      logger.e(e, s);
      return int.tryParse(
        DateFormat(FORMAT_route_yyyyMMdd).format(
          parseIsoDate(date),
        ),
      );
    }
  }

  static String getDay(DateTime date) {
    return DateFormat(FORMAT_day).format(date);
  }

  static String getDayShort(DateTime date) {
    return DateFormat(FORMAT_day_short).format(date);
  }

  static String getCurrentISOTimeString({DateTime? dateTime}) {
    var date = dateTime ?? DateTime.now();
    //Time zone may be null in dateTime hence get timezone by  datetime
    var duration = DateTime.now().timeZoneOffset;
    if (duration.isNegative)
      //TODO: convert duration to abs value instead of below params
      return (date.toIso8601String() +
          "-${duration.inHours.abs().toString().padLeft(2, '0')}:${(duration.inMinutes.abs() - (duration.inHours.abs() * 60)).toString().padLeft(2, '0')}");
    else
      return (date.toIso8601String() +
          "+${duration.inHours.toString().padLeft(2, '0')}:${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}");
  }

  static DateTime parseIsoDate(String startTime) {
    return Jiffy(startTime).dateTime;
  }

  static DateTime getAbsoluteDate() {
    final now = DateTime.now();
    return DateTime(
      now.year,
      now.month,
      now.day,
    );
  }
}
