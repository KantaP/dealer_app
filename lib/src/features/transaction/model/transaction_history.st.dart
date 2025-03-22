import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class TransactionHistoryLoadingState
    implements IPageState<TransactionHistoryLoadingState> {
  bool _isLoading = false;
  TransactionHistoryLoadingState({bool isLoading = false}) {
    _isLoading = isLoading;
  }

  bool get isLoading => _isLoading;

  @override
  TransactionHistoryLoadingState copyWith(Map<String, dynamic> value) {
    return TransactionHistoryLoadingState(
      isLoading: value['isLoading'] ?? _isLoading,
    );
  }
}

class TransactionHistoryPageState
    implements IPageState<TransactionHistoryPageState> {
  int _selectedMenuIndex = 1;
  int _selectedFilterIndex = 1;
  String _getHistoryError = '';

  TransactionHistoryPageState(
      {int selectedMenuIndex = 1,
      int selectedFilterIndex = 1,
      String getHistoryError = ''}) {
    _selectedMenuIndex = selectedMenuIndex;
    _selectedFilterIndex = selectedFilterIndex;
    _getHistoryError = getHistoryError;
  }

  int get selectedMenuIndex => _selectedMenuIndex;
  int get selectedFilterIndex => _selectedFilterIndex;
  String get getHistoryError => _getHistoryError;

  @override
  TransactionHistoryPageState copyWith(Map<String, dynamic> value) {
    return TransactionHistoryPageState(
      selectedMenuIndex:
          value[TransactionHistoryPageStateFields.selectedMenuIndex] ??
              _selectedMenuIndex,
      selectedFilterIndex:
          value[TransactionHistoryPageStateFields.selectedFilterIndex] ??
              _selectedFilterIndex,
      getHistoryError:
          value[TransactionHistoryPageStateFields.getHistoryError] ??
              _getHistoryError,
    );
  }
}

class TransactionHistoryPageStateFields {
  TransactionHistoryPageStateFields._();

  static const String selectedMenuIndex = 'selectedMenuIndex';
  static const String selectedFilterIndex = 'selectedFilterIndex';
  static const String getHistoryError = 'getHistoryError';
}
