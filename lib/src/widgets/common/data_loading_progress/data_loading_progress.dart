import 'package:flutter/material.dart';

@immutable
class DataLoadingProgress {
  const DataLoadingProgress._({
    required this.progress,
  });

  factory DataLoadingProgress.dynamic(int value) {
    return DataLoadingProgress._(
      progress: value,
    );
  }
  factory DataLoadingProgress.initial() {
    return DataLoadingProgress._(
      progress: 0,
    );
  }
  factory DataLoadingProgress.started() {
    return DataLoadingProgress._(
      progress: 25,
    );
  }

  factory DataLoadingProgress.half() {
    return DataLoadingProgress._(
      progress: 50,
    );
  }

  factory DataLoadingProgress.almostDone() {
    return DataLoadingProgress._(
      progress: 85,
    );
  }

  factory DataLoadingProgress.done() {
    return DataLoadingProgress._(
      progress: 100,
    );
  }

  factory DataLoadingProgress.error([String? reason]) {
    return DataLoadingProgress._(
      progress: 0,
    );
  }

  factory DataLoadingProgress.debugError(String message) {
    return DataLoadingProgress._(
      progress: 0,
    );
  }
  final int progress;
}
