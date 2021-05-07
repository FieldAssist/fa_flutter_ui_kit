import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:flutter/material.dart';

import 'stream_error_widget.dart';

typedef OnData<T> = Widget Function(T data);
typedef OnError = Widget Function(dynamic e);
typedef OnLoading = Widget Function();

class DataStreamBuilder<T> extends StatelessWidget {
  const DataStreamBuilder({
    required this.stream,
    required this.onData,
    this.onErrorRefresh,
    this.onError,
    this.onLoading,
  });

  final Stream<T> stream;
  final VoidCallback? onErrorRefresh;
  final OnData<T> onData;
  final OnError? onError;
  final OnLoading? onLoading;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return onData(snapshot.data!);
        } else if (snapshot.hasError) {
          return onError != null
              ? onError!(snapshot.error)
              : StreamErrorWidget(snapshot.error, onErrorRefresh!);
        } else {
          return onLoading != null ? onLoading!() : StreamLoadingWidget();
        }
      },
      stream: stream,
    );
  }
}
