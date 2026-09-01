// [REQ-177] IntegratedSearchTextField.trailing: an optional widget rendered beside the
// search field. Null by default, so an existing consumer's widget tree is unchanged.
import 'package:fa_flutter_ui_kit/src/modules/common/search_list/integrated_search_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

  testWidgets('renders no trailing widget when trailing is null',
      (tester) async {
    await tester.pumpWidget(
      wrap(
        IntegratedSearchTextField(
          searchFieldLabel: 'Search',
          queryTextController: TextEditingController(),
        ),
      ),
    );

    expect(find.byKey(const Key('search-trailing')), findsNothing);
    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets(
      'renders the trailing widget beside the search field when supplied',
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
    expect(find.byType(Row), findsWidgets);
  });
}
