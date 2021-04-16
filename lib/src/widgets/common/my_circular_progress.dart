import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCircularProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).accentColor),
      strokeWidth: 1,
    );
  }
}
