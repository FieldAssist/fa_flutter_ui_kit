import 'package:fa_flutter_ui_kit/src/modules/order/widgets/qty_input_text_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<TextEditingController> _pump(
  WidgetTester tester, {
  required bool wholeNumbersOnly,
}) async {
  final controller = TextEditingController();
  addTearDown(controller.dispose);
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: QtyInputTextBox(
          textController: controller,
          onInputChange: (_) {},
          wholeNumbersOnly: wholeNumbersOnly,
        ),
      ),
    ),
  );
  return controller;
}

void main() {
  group('wholeNumbersOnly: true', () {
    for (final (typed, kept) in [('-5', '5'), ('1.5', '15'), ('1,2', '12')]) {
      testWidgets('QtyInputTextBox: typing "$typed" → "$kept"', (tester) async {
        final controller = await _pump(tester, wholeNumbersOnly: true);

        await tester.enterText(find.byType(TextFormField), typed);

        expect(controller.text, kept);
      });
    }
  });

  testWidgets('QtyInputTextBox: default → a decimal is kept as typed',
      (tester) async {
    final controller = await _pump(tester, wholeNumbersOnly: false);

    await tester.enterText(find.byType(TextFormField), '1.5');

    expect(controller.text, '1.5');
  });
}
