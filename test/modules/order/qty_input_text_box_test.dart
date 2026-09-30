import 'package:fa_flutter_ui_kit/src/modules/order/widgets/qty_input_text_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  for (final (typed, kept) in [('-5', '5'), ('1.5', '15'), ('1,2', '12')]) {
    testWidgets('QtyInputTextBox: typing "$typed" → "$kept"', (tester) async {
      final controller = TextEditingController();
      addTearDown(controller.dispose);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: QtyInputTextBox(
              textController: controller,
              onInputChange: (_) {},
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), typed);

      expect(controller.text, kept);
    });
  }
}
