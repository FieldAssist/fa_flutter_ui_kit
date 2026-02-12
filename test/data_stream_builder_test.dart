import 'dart:async';

import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('DataStreamBuilder renders StreamErrorWidget when onErrorRefresh is null and an error occurs', (WidgetTester tester) async {
    final controller = StreamController<String>();
    addTearDown(controller.close);

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
    // Ensure Retry button is NOT shown or at least not the one from StreamErrorWidget logic that requires a callback
    // The exact UI for "no retry" depends on the implementation, but we know it shouldn't crash.
  });

  testWidgets('DataStreamBuilder renders Retry button when onErrorRefresh is provided', (WidgetTester tester) async {
    final controller = StreamController<String>();
    addTearDown(controller.close);
    bool refreshCalled = false;

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: DataStreamBuilder<String>(
          stream: controller.stream,
          onData: (data) => Text(data),
          onErrorRefresh: () {
            refreshCalled = true;
          },
        ),
      ),
    ));

    // Emit error
    controller.addError('Something went wrong');
    await tester.pump();

    // Check if error widget is shown
    expect(find.byType(StreamErrorWidget), findsOneWidget);
    expect(find.text('Something went wrong'), findsOneWidget);

    // Find and tap the Retry button.
    // Note: The text might be 'RETRY' or similar based on the widgets.
    // Based on previous reads: OutlinedIconButton with "RETRY" text.
    final retryButton = find.text('RETRY');
    expect(retryButton, findsOneWidget);

    await tester.tap(retryButton);
    await tester.pump();

    expect(refreshCalled, isTrue);
  });
}
