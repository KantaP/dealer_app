import 'package:aconnec_1109_x/src/features/utilities/model/add_bank_account.st.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

import '../../../model/request_user_bank_account.m.dart';

class SelectBankReceivedPageState
    implements IPageState<SelectBankReceivedPageState> {
  List<UserBankAccountModel> _myBanks = [];
  bool _initDone = false;
  bool _isLoading = false;
  UserBankAccountModel _selectedBank = UserBankAccountModel();

  Function({UserBankAccountModel selectedBank})? _onSelect;

  SelectBankReceivedPageState({
    List<UserBankAccountModel> myBanks = const [],
    bool initDone = false,
    bool isLoading = false,
    UserBankAccountModel? selectedBank,
    Function({UserBankAccountModel selectedBank})? onSelect,
  }) {
    _myBanks = myBanks;
    _initDone = initDone;
    _isLoading = isLoading;
    _onSelect = onSelect;
    _selectedBank = selectedBank ?? UserBankAccountModel();
  }

  List<UserBankAccountModel> get myBanks => _myBanks;
  bool get initDone => _initDone;
  bool get isLoading => _isLoading;
  Function({UserBankAccountModel selectedBank})? get onSelect => _onSelect;
  UserBankAccountModel get selectedBank => _selectedBank;

  @override
  SelectBankReceivedPageState copyWith(Map<String, dynamic> value) {
    return SelectBankReceivedPageState(
      myBanks: value[SelectBankReceivedPageStateFields.myBanks] ?? _myBanks,
      initDone: value[SelectBankReceivedPageStateFields.initDone] ?? _initDone,
      isLoading:
          value[SelectBankReceivedPageStateFields.isLoading] ?? _isLoading,
      onSelect: value[SelectBankReceivedPageStateFields.onSelect] ?? _onSelect,
      selectedBank: value[SelectBankReceivedPageStateFields.selectedBank] ??
          _selectedBank,
    );
  }
}

class SelectBankReceivedPageStateFields {
  SelectBankReceivedPageStateFields._();

  static const String onSelect = 'onSelect';
  static const String myBanks = 'myBanks';
  static const String initDone = 'initDone';
  static const String isLoading = 'isLoading';
  static const String selectedBank = 'selectedBank';
}
