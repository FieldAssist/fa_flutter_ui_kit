import 'package:flutter/material.dart';

import 'index_screen.dart';

class WidgetPreview extends StatelessWidget {
  WidgetPreview({required this.wid});

  final WidgetData wid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(wid.name),
      ),
      body: Center(
        child: (wid.position == Position.center ? wid.widget : null),
      ),
      bottomNavigationBar:
          (wid.position == Position.bottom ? wid.widget : null),
    );
  }
}
