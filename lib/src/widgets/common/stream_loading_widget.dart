import 'package:fa_flutter_ui_kit/src/widgets/common/my_circular_progress.dart';
import 'package:flutter/material.dart';

class StreamLoadingWidget extends StatelessWidget {
  const StreamLoadingWidget({this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          MyCircularProgress(),
          if (message != null && message!.isNotEmpty)
            Container(
              margin: EdgeInsets.only(top: 24),
              child: Text(message!),
            )
        ],
      ),
    );
  }
}
