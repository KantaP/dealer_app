import 'package:aconnec_1109_x/src/features/utilities/model/add_bank_account.st.dart';
import 'package:aconnec_1109_x/src/model/payment_item.m.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

import '../../../model/request_user_bank_account.m.dart';

class SelectPaymentFormState implements IPageState<SelectPaymentFormState> {
  PaymentItemModel _selectedPayment = PaymentItemModel();
  UserBankAccountModel _selectedBank = UserBankAccountModel();
  int _selectedBankIndex = 0;
  SelectPaymentFormState({
    PaymentItemModel? selectedPayment,
    UserBankAccountModel? selectedBank,
    int selectedBankIndex = 0,
  }) {
    _selectedPayment = selectedPayment ?? PaymentItemModel();
    _selectedBank = selectedBank ?? UserBankAccountModel();
    _selectedBankIndex = selectedBankIndex;
  }

  PaymentItemModel get selectedPayment => _selectedPayment;
  UserBankAccountModel get selectedBank => _selectedBank;
  int get selectedBankIndex => _selectedBankIndex;

  @override
  SelectPaymentFormState copyWith(Map<String, dynamic> value) {
    return SelectPaymentFormState(
      selectedPayment: value[SelectPaymentFormStateFields.selectedPayment] ??
          _selectedPayment,
      selectedBank:
          value[SelectPaymentFormStateFields.selectedBank] ?? _selectedBank,
      selectedBankIndex: value[SelectPaymentFormStateFields.selectBankIndex] ??
          _selectedBankIndex,
    );
  }
}

class SelectPaymentFormStateFields {
  SelectPaymentFormStateFields._();

  static const String selectedBank = 'selectedBank';
  static const String selectedPayment = 'selectedPayment';
  static const String selectBankIndex = 'selectBankIndex';
}

class SelectPaymentPageState implements IPageState<SelectPaymentPageState> {
  List<UserBankAccountModel> _myBanks = [];
  bool _initDone = false;
  bool _isLoading = false;

  Function(
      {PaymentItemModel selectedPayment,
      UserBankAccountModel selectedBank})? _onSelect;

  SelectPaymentPageState({
    List<UserBankAccountModel> myBanks = const [],
    bool initDone = false,
    bool isLoading = false,
    Function(
            {PaymentItemModel selectedPayment,
            UserBankAccountModel selectedBank})?
        onSelect,
  }) {
    _myBanks = myBanks;
    _initDone = initDone;
    _isLoading = isLoading;
    _onSelect = onSelect;
  }

  List<UserBankAccountModel> get myBanks => _myBanks;
  bool get initDone => _initDone;
  bool get isLoading => _isLoading;
  Function(
      {PaymentItemModel selectedPayment,
      UserBankAccountModel selectedBank})? get onSelect => _onSelect;

  @override
  SelectPaymentPageState copyWith(Map<String, dynamic> value) {
    return SelectPaymentPageState(
      myBanks: value[SelectPaymentPageStateFields.myBanks] ?? _myBanks,
      initDone: value[SelectPaymentPageStateFields.initDone] ?? _initDone,
      isLoading: value[SelectPaymentPageStateFields.isLoading] ?? _isLoading,
      onSelect: value[SelectPaymentPageStateFields.onSelect] ?? _onSelect,
    );
  }
}

class SelectPaymentPageStateFields {
  SelectPaymentPageStateFields._();

  static const String onSelect = 'onSelect';
  static const String myBanks = 'myBanks';
  static const String initDone = 'initDone';
  static const String isLoading = 'isLoading';
}
