import 'dart:async';

import 'package:flutter/material.dart';

abstract class FaState<T extends StatefulWidget> extends State<T> {
  bool _isAlreadyClicked = false;
  static const kDebounceTimeInMilliseconds = 700;

  /// When set, [asyncDebounce] runs only while this returns true instead of
  /// while this state is mounted. The host installs it once at startup.
  static bool Function()? canRunAsync;

  //TODO: need to revist on this
  void debounce(
    VoidCallback callback, {
    Duration delay = const Duration(milliseconds: kDebounceTimeInMilliseconds),
  }) {
    if (_isAlreadyClicked || !mounted) {
      return;
    }
    _isAlreadyClicked = true;
    callback();
    Timer(delay, () => _isAlreadyClicked = false);
  }

  Future<void> asyncDebounce(Future<void> Function() callback) async {
    if (_isAlreadyClicked || !(canRunAsync?.call() ?? mounted)) {
      return;
    }
    _isAlreadyClicked = true;
    await callback();
    _isAlreadyClicked = false;
  }
}
