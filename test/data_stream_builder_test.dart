import 'dart:async';

import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('DataStreamBuilder renders StreamErrorWidget when onErrorRefresh is null and an error occurs', (WidgetTester tester) async {
    final controller = StreamController<String>();

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: DataStreamBuilder<String>(
          stream: controller.stream,
          onData: (data) => Text(data),
          // onErrorRefresh is intentionally omitted (null)
          // onError is also omitted (null)
        ),
      ),
    ));

    // Emit error
    controller.addError('Something went wrong');

    // This should not crash anymore
    await tester.pump();

    // Check if error widget is shown
    expect(find.byType(StreamErrorWidget), findsOneWidget);
    expect(find.text('Something went wrong'), findsOneWidget);
  });
}
