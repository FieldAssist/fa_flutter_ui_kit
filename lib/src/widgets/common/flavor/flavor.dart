import 'package:flutter/material.dart';

enum Flavor {
  PROD,
  DEV,
  DEBUG1,
  DEBUG2,
  DEBUG3,
  DEBUGA,
}

extension FlavorX on Flavor {
  // ignore: missing_return
  String get name {
    switch (this) {
      case Flavor.PROD:
        return 'Prod';
      case Flavor.DEV:
        return 'Dev';
      case Flavor.DEBUG1:
        return "Debug 1";
      case Flavor.DEBUG2:
        return "Debug 2";
      case Flavor.DEBUG3:
        return "Debug 3";
      case Flavor.DEBUGA:
        return "Debug A";
    }
  }

  // ignore: missing_return
  Color get color {
    switch (this) {
      case Flavor.PROD:
        return Colors.blue;
      case Flavor.DEV:
      case Flavor.DEBUG1:
      case Flavor.DEBUG2:
      case Flavor.DEBUG3:
      case Flavor.DEBUGA:
        return Colors.red;
    }
  }
}
