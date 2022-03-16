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

  //KEYS:
  static const String kLastReatailingDoneKey = "LAST_DATE_FOR_RETAILING";
}
