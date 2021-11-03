import 'package:flutter/material.dart';

import 'index_screen.dart';

class WidgetPreview extends StatelessWidget {
  const WidgetPreview({required this.widgetData});

  final WidgetData widgetData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widgetData.name),
      ),
      body: Center(
        child:
            (widgetData.position == Position.center ? widgetData.widget : null),
      ),
      bottomNavigationBar:
          (widgetData.position == Position.bottom ? widgetData.widget : null),
    );
  }
}
