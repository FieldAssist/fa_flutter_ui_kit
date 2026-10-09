// SearchList.searchBarTrailing is plumbed to IntegratedSearchTextField
// on both the SearchBarInBody and SearchWithAppBar code paths, but neither was pumped by a
// widget test. Covers both here.
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

  group('data updates', () {
    Widget buildWithData(
      List<String> data, {
      TextEditingController? controller,
    }) {
      return MaterialApp(
        home: SearchList<String>(
          data: data,
          selectedItem: (_) {},
          itemBuilder: (item, isSelected) => Text(item),
          type: SearchListType.SearchBarInBody,
          textEditingController: controller,
          onSearch: (item, query) => item.startsWith(query),
        ),
      );
    }

    testWidgets('new data after first build → list shows the new items',
        (tester) async {
      await tester.pumpWidget(buildWithData(['Alpha', 'Beta']));
      await tester.pump(const Duration(milliseconds: 300));

      await tester.pumpWidget(buildWithData(['Beta']));
      await tester.pump(const Duration(milliseconds: 300));

      expect(find.text('Alpha'), findsNothing);
      expect(find.text('Beta'), findsOneWidget);
    });

    testWidgets('new data while searching → active query still applies',
        (tester) async {
      final controller = TextEditingController();
      addTearDown(controller.dispose);
      await tester.pumpWidget(
        buildWithData(['Apple', 'Avocado', 'Banana'], controller: controller),
      );
      controller.text = 'A';
      await tester.pump(const Duration(milliseconds: 300));

      await tester.pumpWidget(
        buildWithData(['Avocado', 'Banana'], controller: controller),
      );
      await tester.pump(const Duration(milliseconds: 300));

      // only the remaining item matching 'A' is listed
      expect(find.text('Apple'), findsNothing);
      expect(find.text('Avocado'), findsOneWidget);
      expect(find.text('Banana'), findsNothing);
    });
  });
}
