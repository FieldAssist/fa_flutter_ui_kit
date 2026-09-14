import 'dart:async';

import 'package:flutter/widgets.dart';

/// Drops taps while the previous tap's action is still running, so a double
/// tap can't start the same action twice.
mixin FaTapGuard<T extends StatefulWidget> on State<T> {
  bool _running = false;

  Future<void> guardTap(FutureOr<void> Function() action) async {
    if (_running) {
      return;
    }
    _running = true;
    try {
      await action();
    } finally {
      _running = false;
    }
  }
}
