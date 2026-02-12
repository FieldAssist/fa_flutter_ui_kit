import 'package:flutter/material.dart';

import 'multi_select_item.dart';

/// Contains common actions that are used by different multi select classes.
mixin MultiSelectActions<T> {
  List<T> onItemCheckedChange(
      List<T> selectedValues, T itemValue, bool checked) {
    if (checked) {
      selectedValues.add(itemValue);
    } else {
      selectedValues.remove(itemValue);
    }
    return selectedValues;
  }

  List<MultiSelectItem<T>> clearPreviousSelectedItems(
      List<MultiSelectItem<T>> items) {
    List<MultiSelectItem<T>> _clearSelectedItems = [];

    for (int i = 0; i < items.length; i++) {
      items[i].selected = false;
      _clearSelectedItems.add(items[i]);
    }

    return _clearSelectedItems;
  }

  /// Pops the dialog from the navigation stack and returns the initially selected values.
  void onCancelTap(BuildContext ctx, List<T> initiallySelectedValues) {
    Navigator.pop(ctx, initiallySelectedValues);
  }

  /// Pops the dialog from the navigation stack and returns the selected values.
  /// Calls the onConfirm function if one was provided.
  void onConfirmTap(
      BuildContext ctx, List<T> selectedValues, Function(List<T>)? onConfirm) {
    Navigator.pop(ctx, selectedValues);
    if (onConfirm != null) {
      onConfirm(selectedValues);
    }
  }

  /// Accepts the search query, and the original list of items.
  /// If the search query is valid, return a filtered list, otherwise return the original list.
  List<MultiSelectItem<T>> updateSearchQuery(
      String? val, List<MultiSelectItem<T>> allItems) {
    if (val != null && val.trim().isNotEmpty && val.length >= 3) {
      List<MultiSelectItem<T>> filteredItems = [];
      final lowerVal = val.toLowerCase();
      for (var item in allItems) {
        if (item.label.toLowerCase().contains(lowerVal)) {
          filteredItems.add(item);
        }
      }
      return filteredItems;
    } else {
      return allItems;
    }
  }

  /// Toggles the search field.
  bool onSearchTap(bool showSearch) {
    return !showSearch;
  }

  List<MultiSelectItem<T>> separateSelected(List<MultiSelectItem<T>> list) {
    final sortedList = List<MultiSelectItem<T>>.from(list);
    sortedList.sort((a, b) {
      if (a.selected && !b.selected) return -1;
      if (!a.selected && b.selected) return 1;
      return a.label.compareTo(b.label);
    });
    return sortedList;
  }
}
