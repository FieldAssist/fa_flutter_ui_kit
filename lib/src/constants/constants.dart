class Constants {
  Constants._();

  static const String errorSomethingWentWrong = "Oops! Something went wrong.";

  static const String locationNotAvailable =
      "Location not available!\n\nPlease try following things:\n\n-"
      " Check location is on"
      " and is set to High Accuracy\n- Check if location permission"
      " to the app is enabled\n- Close the App and open Google Maps. "
      "If location gets available to Maps then reopen FA MT App."
      " It will detect location.";

  static const String errorInternetError =
      "Internet not available\nPlease check your wifi or mobile data";

  static const String underConstruction = "Under Construction";

  static const String done = "Done";

  static const List<String> monthList = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  static const text_calendar = 'Calendar';

  static const text_yesterday = 'Yesterday';

  static const text_today = 'Today';

  static const text_mtd = 'MTD';

  static const text_last_three_month = 'Last 3 Months';

  static const text_done = 'Done';

  static const errorSomethingWrong500 = "Something went wrong! ErrorCode: 500";

  //KEYS:
  static const String kLastReatailingDoneKey = "LAST_DATE_FOR_RETAILING";

  static const dialogHeight = 450.0;
  static const dialogWidth = 450.0;
}
