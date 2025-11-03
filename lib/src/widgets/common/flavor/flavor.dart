import 'package:flutter/material.dart';

enum Flavor {
  PROD,
  DEV,
  DEBUG1,
  DEBUG2,
  DEBUG3,
  DEBUGA,
  UAT,
  COLPAL,
  GULF,
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
      case Flavor.UAT:
        return "UAT";
      case Flavor.COLPAL:
        return "COLPAL";
      case Flavor.GULF:
        return "GULF";
    }
  }

  // ignore: missing_return
  Color get color {
    switch (this) {
      case Flavor.PROD:
      case Flavor.UAT:
      case Flavor.GULF:
        return Colors.blue;
      case Flavor.DEV:
      case Flavor.DEBUG1:
      case Flavor.DEBUG2:
      case Flavor.DEBUG3:
      case Flavor.DEBUGA:
      case Flavor.COLPAL:
        return Colors.red;
    }
  }
}
