// [REQ-177 rework, Vipin] SearchList.searchBarTrailing is plumbed to IntegratedSearchTextField
// on both the SearchBarInBody and SearchWithAppBar code paths, but neither was pumped by a
// widget test — untested since #209 was opened. Covers both here.
import 'package:fa_flutter_ui_kit/src/modules/common/search_list/search_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildSearchList(SearchListType type) {
    return MaterialApp(
      home: SearchList<String>(
        data: const ['Alpha', 'Beta'],
        selectedItem: (_) {},
        itemBuilder: (item, isSelected) => Text(item),
        type: type,
        searchBarTrailing:
            const Icon(Icons.filter_list, key: Key('search-trailing')),
      ),
    );
  }

  testWidgets(
      'SearchBarInBody renders searchBarTrailing beside the search field',
      (tester) async {
    await tester.pumpWidget(buildSearchList(SearchListType.SearchBarInBody));
    await tester.pump();

    expect(find.byKey(const Key('search-trailing')), findsOneWidget);
  });

  testWidgets(
      'SearchWithAppBar renders searchBarTrailing beside the search field',
      (tester) async {
    await tester.pumpWidget(buildSearchList(SearchListType.SearchWithAppBar));
    await tester.pump();

    expect(find.byKey(const Key('search-trailing')), findsOneWidget);
  });
}
