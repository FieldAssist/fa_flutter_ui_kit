// [REQ-177] IntegratedSearchTextField.trailing: an optional widget rendered beside the
// search field. Null by default, so an existing consumer's widget tree is unchanged.
import 'package:fa_flutter_ui_kit/src/modules/common/search_list/integrated_search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

  testWidgets(
      'renders the Card directly (no wrapping Row) when trailing is null',
      (tester) async {
    await tester.pumpWidget(
      wrap(
        IntegratedSearchTextField(
          searchFieldLabel: 'Search',
          queryTextController: TextEditingController(),
        ),
      ),
    );

    // [REQ-177 rework, Vipin] find.byKey('search-trailing') can never fail here since that
    // key is only ever attached by a caller-supplied trailing widget — assert the actual
    // structural invariant instead: the outer Padding's child is the Card itself, not a Row.
    final padding = tester.widget<Padding>(
        find.byKey(const Key('integrated-search-textfield-padding')));
    expect(padding.child, isA<Card>());
    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets(
      'renders the trailing widget beside the search field, inside a Row, when supplied',
      (tester) async {
    await tester.pumpWidget(
      wrap(
        IntegratedSearchTextField(
          searchFieldLabel: 'Search',
          queryTextController: TextEditingController(),
          trailing: const Icon(Icons.filter_list, key: Key('search-trailing')),
        ),
      ),
    );

    expect(find.byKey(const Key('search-trailing')), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);

    // [REQ-177 rework, Vipin] find.byType(Row) alone also matches the suffixIcon Row inside
    // the TextField's decoration, so it passes even if `trailing` were placed elsewhere.
    // Assert the actual wiring: the outer Padding's child is a Row whose children are
    // Expanded(searchCard) followed by the trailing widget itself.
    final padding = tester.widget<Padding>(
        find.byKey(const Key('integrated-search-textfield-padding')));
    expect(padding.child, isA<Row>());
    final row = padding.child! as Row;
    expect(row.children.first, isA<Expanded>());
    expect((row.children.first as Expanded).child, isA<Card>());
    expect(row.children.last.key, const Key('search-trailing'));
  });
}
