import 'package:flutter/material.dart';

enum Flavor {
  PROD,
  DEV,
  COLPAL,
}

extension FlavorX on Flavor {
  // ignore: missing_return
  String get name {
    switch (this) {
      case Flavor.PROD:
        return 'Prod';
      case Flavor.DEV:
        return 'Dev';
      case Flavor.COLPAL:
        return "COLPAL";
    }
  }

  // ignore: missing_return
  Color get color {
    switch (this) {
      case Flavor.PROD:
        return Colors.blue;
      case Flavor.COLPAL:
      case Flavor.DEV:
        return Colors.red;
    }
  }
}
