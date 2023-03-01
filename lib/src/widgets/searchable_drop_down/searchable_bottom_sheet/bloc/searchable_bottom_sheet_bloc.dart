import 'package:fa_flutter_core/fa_flutter_core.dart';

class SearchableBottomSheetBloc<T> {
  SearchableBottomSheetBloc({required this.items, required this.onSearch});
  final bool Function(T item, String query) onSearch;

  final _searchSubject = BehaviorSubject<String>.seeded("");
  final _searchedItemsSubject = BehaviorSubject<List<T>?>();
  Stream<List<T>?> get _stream => _searchedItemsSubject.stream;

  ValueStream<String> get _searchStream => _searchSubject.stream
      .debounceTime(Duration(milliseconds: 100))
      .shareValue();

  ValueStream<List<T>?> get filteredStream {
    return Rx.combineLatest2<String, List<T>?, List<T>>(_searchStream, _stream,
        (query, b) {
      if (query.isEmpty) {
        return items;
      }
      return items.where((item) => onSearch(item, query)).toList();
    }).shareValue();
  }

  final List<T> items;

  void init() {
    _searchedItemsSubject.addDataSafely(items);
  }

  void searchList(String query) {
    _searchSubject.addDataSafely(query);
  }

  void dispose() {
    _searchSubject.close();
    _searchedItemsSubject.close();
  }
}
