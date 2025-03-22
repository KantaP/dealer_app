import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class SelectItemPageState implements IPageState<SelectItemPageState> {
  List<SelectItem> _items = [];
  String _searchText = '';
  String _pageTitle = '';
  SelectItem? _selectedItem;
  Function(SelectItem value)? _onSelect;

  SelectItemPageState({
    List<SelectItem> items = const [],
    String searchText = '',
    String pageTitle = '',
    SelectItem? selectedItem,
    Function(SelectItem value)? onSelect,
  }) {
    _items = items;
    _searchText = searchText;
    _pageTitle = pageTitle;
    _selectedItem = selectedItem;
    _onSelect = onSelect;
  }

  List<SelectItem> get items => _items;
  String get searchText => _searchText;
  String get pageTitle => _pageTitle;
  SelectItem? get selectedItem => _selectedItem;
  Function(SelectItem value)? get onSelect => _onSelect;

  @override
  SelectItemPageState copyWith(Map<String, dynamic> value) {
    return SelectItemPageState(
      items: value[SelectItemPageFields.items] ?? _items,
      searchText: value[SelectItemPageFields.searchText] ?? _searchText,
      pageTitle: value[SelectItemPageFields.pageTitle] ?? _pageTitle,
      selectedItem: value[SelectItemPageFields.selectedItem] ?? _selectedItem,
      onSelect: value[SelectItemPageFields.onSelect] ?? _onSelect,
    );
  }
}

class SelectItemPageFields {
  SelectItemPageFields._();

  static const String items = 'items';
  static const String searchText = 'searchText';
  static const String pageTitle = 'pageTitle';
  static const String selectedItem = 'selectedItem';
  static const String onSelect = 'onSelect';
}

class SelectItem {
  final String title;
  final dynamic value;

  SelectItem({required this.title, required this.value});
}
