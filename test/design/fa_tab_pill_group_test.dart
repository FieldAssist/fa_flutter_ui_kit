import 'package:fa_flutter_ui_kit/design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'test_helpers.dart';

final _defaults = FaColors.fromSeed(FaTheme.defaultSeed);

void main() {
  Future<void> pumpGroup(
    WidgetTester tester, {
    required int selectedIndex,
    ValueChanged<int>? onChanged,
  }) =>
      tester.pumpWidget(
        kitHost(
          Center(
            child: FaTabPillGroup(
              labels: const ['Activities', 'Details'],
              selectedIndex: selectedIndex,
              onChanged: onChanged ?? (_) {},
            ),
          ),
        ),
      );

  Container pillOf(WidgetTester tester, String label) => tester.widget(
        find
            .ancestor(of: find.text(label), matching: find.byType(Container))
            .first,
      );

  Color? labelColorOf(WidgetTester tester, String label) =>
      tester.widget<Text>(find.text(label)).style?.color;

  testWidgets('FaTabPillGroup: tap on a pill → reports its index',
      (tester) async {
    final tapped = <int>[];

    await pumpGroup(tester, selectedIndex: 0, onChanged: tapped.add);
    await tester.tap(find.text('Details'));

    expect(tapped, [1]);
  });

  testWidgets('FaTabPillGroup: selected pill → brand fill with onBrand label',
      (tester) async {
    await pumpGroup(tester, selectedIndex: 0);

    final decoration =
        pillOf(tester, 'Activities').decoration! as BoxDecoration;
    expect(
      (decoration.color, labelColorOf(tester, 'Activities')),
      (_defaults.brand, _defaults.onBrand),
    );
  });

  testWidgets('FaTabPillGroup: unselected pill → no fill, tertiary label',
      (tester) async {
    await pumpGroup(tester, selectedIndex: 0);

    final decoration = pillOf(tester, 'Details').decoration! as BoxDecoration;
    expect(
      (decoration.color, decoration.boxShadow, labelColorOf(tester, 'Details')),
      (Colors.transparent, null, _defaults.textTertiary),
    );
  });

  testWidgets('FaTabPillGroup: pill height → at least the 32 Figma minimum',
      (tester) async {
    await pumpGroup(tester, selectedIndex: 0);

    final height = tester.getSize(find.byWidget(pillOf(tester, 'Activities')));
    expect(height.height, greaterThanOrEqualTo(32));
  });

  testWidgets('FaTabPillGroup: heightOf → matches the laid-out height',
      (tester) async {
    late double reserved;
    await tester.pumpWidget(
      kitHost(
        Builder(
          builder: (context) {
            reserved = FaTabPillGroup.heightOf(context);
            return Center(
              child: FaTabPillGroup(
                labels: const ['Activities', 'Details'],
                selectedIndex: 0,
                onChanged: (_) {},
              ),
            );
          },
        ),
      ),
    );

    expect(reserved, tester.getSize(find.byType(FaTabPillGroup)).height);
  });
}
