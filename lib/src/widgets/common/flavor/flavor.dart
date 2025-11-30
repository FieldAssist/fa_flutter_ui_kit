import 'package:flutter/material.dart';

enum Flavor {
  PROD,
  DEV,
  DEBUG1,
  DEBUG2,
  DEBUG3,
  DEBUGA,
  UAT,
  HOTFIX,
  COLPAL,
  GULF,
  SLMG,
  DeliveryApp,
  HCCB,
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
      case Flavor.HOTFIX:
        return "HOTFIX";
      case Flavor.COLPAL:
        return "COLPAL";
      case Flavor.GULF:
        return "GULF";
      case Flavor.SLMG:
        return "SLMG";
      case Flavor.HCCB:
        return "HCCB";
      case Flavor.DeliveryApp:
        return "Delivery App";
    }
  }

  /// brand/company color for each flavor
  Color get color {
    switch (this) {
      case Flavor.PROD:
      case Flavor.UAT:
      case Flavor.HOTFIX:
      case Flavor.GULF:
      case Flavor.DeliveryApp:
        return Colors.blue;
      case Flavor.DEV:
      case Flavor.DEBUG1:
      case Flavor.DEBUG2:
      case Flavor.DEBUG3:
      case Flavor.DEBUGA:
      case Flavor.COLPAL:
      case Flavor.HCCB:
        return Colors.red;
      case Flavor.SLMG:
        return Color(0xff94080c);
    }
  }
}
