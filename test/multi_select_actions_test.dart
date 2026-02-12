import 'package:flutter_test/flutter_test.dart';
import 'package:fa_flutter_ui_kit/src/widgets/common/multi_select_items/util/multi_select_actions.dart';
import 'package:fa_flutter_ui_kit/src/widgets/common/multi_select_items/util/multi_select_item.dart';

class TestActions with MultiSelectActions<int> {}

void main() {
  test('separateSelected separates selected and non-selected items and sorts them', () {
    final actions = TestActions();

    final item1 = MultiSelectItem(1, 'Apple');
    final item2 = MultiSelectItem(2, 'Banana');
    final item3 = MultiSelectItem(3, 'Cherry');
    final item4 = MultiSelectItem(4, 'Date');

    item1.selected = true; // Selected
    item2.selected = false;
    item3.selected = true; // Selected
    item4.selected = false;

    // Unsorted list
    final list = [item4, item3, item2, item1];

    final result = actions.separateSelected(list);

    // Expected order:
    // Selected items (sorted by label): Apple, Cherry
    // Non-selected items (sorted by label): Banana, Date

    expect(result.length, 4);
    expect(result[0].label, 'Apple');
    expect(result[1].label, 'Cherry');
    expect(result[2].label, 'Banana');
    expect(result[3].label, 'Date');

    expect(result[0].selected, true);
    expect(result[1].selected, true);
    expect(result[2].selected, false);
    expect(result[3].selected, false);
  });

  test('separateSelected handles empty list', () {
    final actions = TestActions();
    final result = actions.separateSelected([]);
    expect(result, isEmpty);
  });

  test('separateSelected handles all selected', () {
    final actions = TestActions();
    final item1 = MultiSelectItem(1, 'Apple')..selected = true;
    final item2 = MultiSelectItem(2, 'Banana')..selected = true;

    final result = actions.separateSelected([item2, item1]);

    expect(result[0].label, 'Apple');
    expect(result[1].label, 'Banana');
  });

  test('separateSelected handles all non-selected', () {
    final actions = TestActions();
    final item1 = MultiSelectItem(1, 'Apple')..selected = false;
    final item2 = MultiSelectItem(2, 'Banana')..selected = false;

    final result = actions.separateSelected([item2, item1]);

    expect(result[0].label, 'Apple');
    expect(result[1].label, 'Banana');
  });

  test('updateSearchQuery returns all items if search query is invalid', () {
    final actions = TestActions();
    final items = [
      MultiSelectItem(1, 'Apple'),
      MultiSelectItem(2, 'Banana'),
    ];

    expect(actions.updateSearchQuery(null, items), items);
    expect(actions.updateSearchQuery('', items), items);
    expect(actions.updateSearchQuery('  ', items), items);
    expect(actions.updateSearchQuery('Ap', items), items); // Length < 3
  });

  test('updateSearchQuery filters items correctly (case insensitive)', () {
    final actions = TestActions();
    final item1 = MultiSelectItem(1, 'Apple');
    final item2 = MultiSelectItem(2, 'Banana');
    final item3 = MultiSelectItem(3, 'Pineapple');
    final items = [item1, item2, item3];

    final result = actions.updateSearchQuery('apple', items);

    expect(result.length, 2);
    expect(result, contains(item1));
    expect(result, contains(item3));
    expect(result, isNot(contains(item2)));
  });

  test('updateSearchQuery returns empty list if no match found', () {
    final actions = TestActions();
    final items = [
      MultiSelectItem(1, 'Apple'),
      MultiSelectItem(2, 'Banana'),
    ];

    final result = actions.updateSearchQuery('Cherry', items);
    expect(result, isEmpty);
  });
}
