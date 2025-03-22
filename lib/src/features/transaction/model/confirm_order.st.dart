import 'package:aconnec_1109_x/src/features/utilities/model/add_bank_account.st.dart';
import 'package:aconnec_1109_x/src/model/payment_item.m.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';
import 'package:aconnec_1109_x/src/widgets/custom_checkbox_field.dart';

import '../../../model/request_user_bank_account.m.dart';

class ConfirmOrderArgumentState
    implements IPageState<ConfirmOrderArgumentState> {
  double _bahtAmount = 0;
  double _coinAmount = 0;

  ConfirmOrderArgumentState({double bahtAmount = 0, double coinAmount = 0}) {
    _bahtAmount = bahtAmount;
    _coinAmount = coinAmount;
  }

  double get bahtAmount => _bahtAmount;
  double get coinAmount => _coinAmount;

  @override
  ConfirmOrderArgumentState copyWith(Map<String, dynamic> value) {
    return ConfirmOrderArgumentState(
      bahtAmount:
          value[ConfirmOrderArgumentStateFields.bahtAmount] ?? _bahtAmount,
      coinAmount:
          value[ConfirmOrderArgumentStateFields.coinAmount] ?? _coinAmount,
    );
  }
}

class ConfirmOrderArgumentStateFields {
  ConfirmOrderArgumentStateFields._();

  static const String bahtAmount = 'bahtAmount';
  static const String coinAmount = 'coinAmount';
  static const String mode = 'mode';
  static const String uom = 'uom';
}

class ConfirmOrderFormState implements IPageState<ConfirmOrderFormState> {
  double _bahtAmount = 0;
  double _coinAmount = 0;
  PaymentItemModel _selectedPayment = PaymentItemModel();
  UserBankAccountModel _selectedBank = UserBankAccountModel();
  String _note = '';
  bool _accept1 = false;
  bool _accept2 = false;
  bool _accept3 = false;
  double _totalAmout = 0;
  List<CheckboxValue> _conditionSelected = [];
  String _mode = '';
  String _networkCode = '';
  String _walletAddress = '';
  String _uom = '';

  int _selectedBankIndex = 0;

  ConfirmOrderFormState(
      {double bahtAmount = 0,
      double coinAmount = 0,
      PaymentItemModel? selectedPayment,
      UserBankAccountModel? selectedBank,
      String note = '',
      bool accept1 = false,
      bool accept2 = false,
      bool accept3 = false,
      double totalAmount = 0,
      List<CheckboxValue> conditionSelected = const [],
      String mode = '',
      String networkCode = '',
      String walletAddress = '',
      String uom = '',
      int selectedBankIndex = 0}) {
    _bahtAmount = bahtAmount;
    _coinAmount = coinAmount;
    _selectedPayment = selectedPayment ?? PaymentItemModel();
    _selectedBank = selectedBank ?? UserBankAccountModel();
    _note = note;
    _accept1 = accept1;
    _accept2 = accept2;
    _accept3 = accept3;
    _totalAmout = totalAmount;
    _conditionSelected = conditionSelected;
    _mode = mode;
    _networkCode = networkCode;
    _walletAddress = walletAddress;
    _uom = uom;
    _selectedBankIndex = selectedBankIndex;
  }

  double get bahtAmount => _bahtAmount;
  double get coinAmount => _coinAmount;
  PaymentItemModel get selectedPayment => _selectedPayment;
  UserBankAccountModel get selectedBank => _selectedBank;
  String get note => _note;
  bool get accept1 => _accept1;
  bool get accept2 => _accept2;
  bool get accept3 => _accept3;
  double get totalAmount => _totalAmout;
  List<CheckboxValue> get conditionSelected => _conditionSelected;
  String get mode => _mode;
  String get networkCode => _networkCode;
  String get walletAddress => _walletAddress;
  String get uom => _uom;
  int get selectedBankIndex => _selectedBankIndex;

  @override
  ConfirmOrderFormState copyWith(Map<String, dynamic> value) {
    return ConfirmOrderFormState(
      bahtAmount: value[ConfirmOrderFormStateFields.bahtAmount] ?? _bahtAmount,
      coinAmount: value[ConfirmOrderFormStateFields.coinAmount] ?? _coinAmount,
      selectedPayment: value[ConfirmOrderFormStateFields.selectedPayment] ??
          _selectedPayment,
      selectedBank:
          value[ConfirmOrderFormStateFields.selectedBank] ?? _selectedBank,
      note: value[ConfirmOrderFormStateFields.note] ?? _note,
      accept1: value[ConfirmOrderFormStateFields.accept1] ?? _accept1,
      accept2: value[ConfirmOrderFormStateFields.accept2] ?? _accept2,
      accept3: value[ConfirmOrderFormStateFields.accept3] ?? _accept3,
      totalAmount:
          value[ConfirmOrderFormStateFields.totalAmount] ?? _totalAmout,
      conditionSelected: value[ConfirmOrderFormStateFields.conditionSelected] ??
          _conditionSelected,
      mode: value[ConfirmOrderFormStateFields.mode] ?? _mode,
      networkCode:
          value[ConfirmOrderFormStateFields.networkCode] ?? _networkCode,
      walletAddress:
          value[ConfirmOrderFormStateFields.walletAddress] ?? _walletAddress,
      uom: value[ConfirmOrderFormStateFields.uom] ?? _uom,
      selectedBankIndex: value[ConfirmOrderFormStateFields.selectedBankIndex] ??
          _selectedBankIndex,
    );
  }
}

class ConfirmOrderFormStateFields {
  ConfirmOrderFormStateFields._();

  static const String bahtAmount = 'bahtAmount';
  static const String coinAmount = 'coinAmount';
  static const String selectedPayment = 'selectedPayment';
  static const String selectedBank = 'selectedBank';
  static const String note = 'note';
  static const String accept1 = 'accept1';
  static const String accept2 = 'accept2';
  static const String accept3 = 'accept3';
  static const String totalAmount = 'totalAmount';
  static const String conditionSelected = 'conditionSelected';
  static const String mode = 'mode';
  static const String networkCode = 'network_code';
  static const String walletAddress = 'wallet_address';
  static const String uom = 'uom';

  static const String selectedBankIndex = 'selectedBankIndex';
}

class ConfirmOrderPageState implements IPageState<ConfirmOrderPageState> {
  bool _isLoading = false;

  String _walletAddress = '';

  ConfirmOrderPageState({bool isLoading = false, String walletAddress = ''}) {
    _isLoading = isLoading;
    _walletAddress = walletAddress;
  }

  bool get isLoading => _isLoading;
  String get walletAddress => _walletAddress;

  @override
  ConfirmOrderPageState copyWith(Map<String, dynamic> value) {
    return ConfirmOrderPageState(
      isLoading: value['isLoading'] ?? _isLoading,
      walletAddress:
          value[ConfirmOrderFormStateFields.walletAddress] ?? _walletAddress,
    );
  }
}
