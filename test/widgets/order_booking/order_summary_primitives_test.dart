import 'package:fa_flutter_ui_kit/fa_flutter_ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

const _longTitle = 'Tổng số lượng tồn kho của nhà phân phối';
const _longValue = '1,234 CS 5,678 EA 90 PC 12 BOX 345 KG';

Widget _host(Widget child, {double width = 360, double textScale = 1}) {
  return MaterialApp(
    home: MediaQuery(
      data: MediaQueryData(
        size: Size(width, 800),
        textScaler: TextScaler.linear(textScale),
      ),
      child: Scaffold(
        body: Center(
          child: SizedBox(
            width: width,
            child: SingleChildScrollView(
                child: OrderSummaryFrame(children: [child])),
          ),
        ),
      ),
    ),
  );
}

OrderSummarySection _section({
  List<Widget> children = const [],
  bool initiallyExpanded = true,
  String title = 'Total quantity',
  String value = '8 CS 73 EA',
}) {
  return OrderSummarySection(
    leading: const SizedBox.square(dimension: OrderSummaryIconTile.size),
    title: title,
    value: value,
    initiallyExpanded: initiallyExpanded,
    children: children,
  );
}

void main() {
  group('OrderSummarySection', () {
    testWidgets('no children → no chevron', (tester) async {
      await tester.pumpWidget(_host(_section()));

      expect(find.byIcon(Icons.keyboard_arrow_up_rounded), findsNothing);
    });

    testWidgets('initially expanded → rows visible', (tester) async {
      await tester.pumpWidget(
        _host(_section(children: [const Text('Ordered qty')])),
      );

      expect(find.text('Ordered qty'), findsOneWidget);
    });

    testWidgets('tap on header while expanded → rows collapse', (tester) async {
      await tester.pumpWidget(
        _host(_section(children: [const Text('Ordered qty')])),
      );

      await tester.tap(find.text('Total quantity'));
      await tester.pumpAndSettle();

      expect(find.text('Ordered qty'), findsNothing);
    });

    testWidgets('initially collapsed → rows hidden until tapped',
        (tester) async {
      await tester.pumpWidget(
        _host(
          _section(
            initiallyExpanded: false,
            children: [const Text('Ordered qty')],
          ),
        ),
      );

      expect(find.text('Ordered qty'), findsNothing);
    });

    for (final (width, scale) in [(320.0, 1.0), (320.0, 2.0), (360.0, 1.3)]) {
      testWidgets('long title and value at ${width}dp × $scale → no overflow',
          (tester) async {
        await tester.pumpWidget(
          _host(
            _section(
              title: _longTitle,
              value: _longValue,
              children: [
                const OrderSummaryRow(label: _longTitle, value: _longValue),
              ],
            ),
            width: width,
            textScale: scale,
          ),
        );

        expect(tester.takeException(), isNull);
      });
    }
  });

  group('OrderSummarySection header layout', () {
    testWidgets('title and value fit → value on the title line',
        (tester) async {
      await tester.pumpWidget(_host(_section(title: 'Qty', value: '8 EA')));

      final title = tester.getRect(find.text('Qty'));
      final value = tester.getRect(find.text('8 EA'));

      expect(value.top, lessThan(title.bottom));
    });

    testWidgets('value too wide beside the title → value drops below it',
        (tester) async {
      await tester.pumpWidget(
        _host(
          _section(title: 'Discount', value: '₫ 20,045,359,000'),
          width: 320,
          textScale: 1.3,
        ),
      );

      final title = tester.getRect(find.text('Discount'));
      final value = tester.getRect(find.text('₫ 20,045,359,000'));

      expect(value.top, greaterThanOrEqualTo(title.bottom));
    });

    testWidgets('value dropped below → title stays on one line',
        (tester) async {
      await tester.pumpWidget(
        _host(
          _section(title: 'Discount', value: '₫ 20,045,359,000'),
          width: 320,
          textScale: 1.3,
        ),
      );

      final paragraph = tester.renderObject<RenderParagraph>(
        find.text('Discount'),
      );

      // a mid-word break would lay the word out over several lines
      expect(
          paragraph
              .getBoxesForSelection(
                const TextSelection(baseOffset: 0, extentOffset: 8),
              )
              .map((box) => box.top)
              .toSet(),
          hasLength(1));
    });

    testWidgets('title would need 3+ lines beside value → value drops below',
        (tester) async {
      await tester.pumpWidget(
        _host(_section(title: 'Số Tiền Phải Trả', value: '20,045,359')),
      );

      final title = tester.getRect(find.text('Số Tiền Phải Trả'));
      final value = tester.getRect(find.text('20,045,359'));

      expect(value.top, greaterThanOrEqualTo(title.bottom));
    });

    testWidgets('secondary value → shown under the main value', (tester) async {
      await tester.pumpWidget(
        _host(
          const OrderSummarySection(
            leading: SizedBox.square(dimension: OrderSummaryIconTile.size),
            title: 'Payable',
            value: '₹ 950',
            secondaryValue: r'($ 11.4)',
          ),
        ),
      );

      final value = tester.getRect(find.text('₹ 950'));
      final secondary = tester.getRect(find.text(r'($ 11.4)'));

      expect(secondary.top, greaterThanOrEqualTo(value.bottom));
    });
  });

  group('OrderSummaryRow', () {
    testWidgets('identifier given → row carries it for E2E lookup',
        (tester) async {
      await tester.pumpWidget(
        _host(
          const OrderSummaryRow(
            label: 'FOC',
            value: '0 CS 51 EA',
            identifier: 'summary_qty_foc',
          ),
        ),
      );

      expect(
        find.bySemanticsIdentifier('summary_qty_foc'),
        findsOneWidget,
      );
    });
  });

  group('OrderSummarySelectBox', () {
    testWidgets('tap → calls onTap', (tester) async {
      var taps = 0;
      await tester.pumpWidget(
        _host(OrderSummarySelectBox(value: '100,000', onTap: () => taps++)),
      );

      await tester.tap(find.text('100,000'));

      expect(taps, 1);
    });

    testWidgets('no onTap → no chevron', (tester) async {
      await tester.pumpWidget(_host(const OrderSummarySelectBox(value: '0')));

      expect(find.byIcon(Icons.keyboard_arrow_down_rounded), findsNothing);
    });
  });
}
