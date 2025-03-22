import 'package:aconnec_1109_x/src/model/coin_detail.m.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';

class PaymentTransactionTrackingModel
    implements Model<PaymentTransactionTrackingModel> {
  String _ref = '';
  String _status = '';
  String _createdAt = '';

  PaymentTransactionTrackingModel(
      {String ref = '', String status = '', String createdAt = ''}) {
    _ref = ref;
    _status = status;
    _createdAt = createdAt;
  }

  String get ref => _ref;
  String get status => _status;
  String get createdAt => _createdAt;

  @override
  PaymentTransactionTrackingModel copyWith(Map<String, dynamic> value) {
    return PaymentTransactionTrackingModel(
      ref: value[PaymentTransactionTrackingModelFields.ref] ?? _ref,
      status: value[PaymentTransactionTrackingModelFields.status] ?? _status,
      createdAt:
          value[PaymentTransactionTrackingModelFields.createdAt] ?? _createdAt,
    );
  }
}

class PaymentTransactionTrackingModelFields {
  PaymentTransactionTrackingModelFields._();

  static const String ref = 'ref';
  static const String status = 'status';
  static const String createdAt = 'createdAt';
}

class PaymentTransactionModel implements Model<PaymentTransactionModel> {
  String _ref = '';
  String _selectedPayment = '';
  String _selectedBank = '';
  double _transactionFee = 0;
  double _total = 0;
  double _bahtAmount = 0;
  double _gastaAmount = 0;
  List<String> _vouchers = [];
  List<bool> _accepted = [];
  String _note = '';
  String _createdAt = '';
  String _status = '';
  String _updatedAt = '';
  bool _uploadSlip = false;
  String _selectedBankNumber = '';
  String _selectedBankName = '';
  String _transactionType = '';
  ExchangeCoinDetailModel _coinOrigin = ExchangeCoinDetailModel();
  ExchangeCoinDetailModel _coinSwap = ExchangeCoinDetailModel();

  PaymentTransactionModel({
    String ref = '',
    String selectedPayment = '',
    String selectedBank = '',
    double transactionFee = 0,
    double total = 0,
    double bahtAmount = 0,
    double gastaAmount = 0,
    List<String> vouchers = const [],
    List<bool> accepted = const [],
    String note = '',
    String createdAt = '',
    String status = '',
    String updatedAt = '',
    bool uploasdSlip = false,
    String selectedBankNumber = '',
    String selectedBankName = '',
    String transactionType = '',
    ExchangeCoinDetailModel? coinOrigin,
    ExchangeCoinDetailModel? coinSwap,
  }) {
    _ref = ref;
    _selectedPayment = selectedPayment;
    _selectedBank = selectedBank;
    _transactionFee = transactionFee;
    _total = total;
    _bahtAmount = bahtAmount;
    _gastaAmount = gastaAmount;
    _vouchers = vouchers;
    _accepted = accepted;
    _note = note;
    _createdAt = createdAt;
    _status = status;
    _updatedAt = updatedAt;
    _uploadSlip = uploasdSlip;
    _selectedBankNumber = selectedBankNumber;
    _selectedBankName = selectedBankName;
    _transactionType = transactionType;
    _coinOrigin = coinOrigin ?? ExchangeCoinDetailModel();
    _coinSwap = coinSwap ?? ExchangeCoinDetailModel();
  }

  String get ref => _ref;
  String get selectedPayment => _selectedPayment;
  String get selectedBank => _selectedBank;
  double get transactionFee => _transactionFee;
  double get total => _total;
  double get bahtAmount => _bahtAmount;
  double get gastaAmount => _gastaAmount;
  List<String> get vouchers => _vouchers;
  List<bool> get accepted => _accepted;
  String get note => _note;
  String get createdAt => _createdAt;
  String get status => _status;
  String get updatedAt => _updatedAt;
  bool get uploadSlip => _uploadSlip;
  String get selectedBankNumber => _selectedBankNumber;
  String get selectedBankName => _selectedBankName;
  String get transactionType => _transactionType;
  ExchangeCoinDetailModel get coinOrigin => _coinOrigin;
  ExchangeCoinDetailModel get coinSwap => _coinSwap;

  @override
  PaymentTransactionModel copyWith(Map<String, dynamic> value) {
    return PaymentTransactionModel(
      ref: value[PaymentTransactionModelFiedls.ref] ?? _ref,
      selectedPayment: value[PaymentTransactionModelFiedls.selectedPayment] ??
          _selectedPayment,
      selectedBank:
          value[PaymentTransactionModelFiedls.selectedBank] ?? _selectedBank,
      transactionFee: value[PaymentTransactionModelFiedls.transactionFee] ??
          _transactionFee,
      total: value[PaymentTransactionModelFiedls.total] ?? _total,
      bahtAmount:
          value[PaymentTransactionModelFiedls.bahtAmount] ?? _bahtAmount,
      gastaAmount:
          value[PaymentTransactionModelFiedls.gastaAmount] ?? _gastaAmount,
      vouchers: value[PaymentTransactionModelFiedls.vouchers] ?? _vouchers,
      accepted: value[PaymentTransactionModelFiedls.accepted] ?? _accepted,
      note: value[PaymentTransactionModelFiedls.note] ?? _note,
      createdAt: value[PaymentTransactionModelFiedls.createdAt] ?? _createdAt,
      status: value[PaymentTransactionModelFiedls.status] ?? _status,
      updatedAt: value[PaymentTransactionModelFiedls.updatedAt] ?? _updatedAt,
      uploasdSlip:
          value[PaymentTransactionModelFiedls.uploadSlip] ?? _uploadSlip,
      selectedBankNumber:
          value[PaymentTransactionModelFiedls.selectedBankNumber] ??
              _selectedBankNumber,
      selectedBankName: value[PaymentTransactionModelFiedls.selectedBankName] ??
          _selectedBankName,
      transactionType: value[PaymentTransactionModelFiedls.transactionType] ??
          _transactionType,
      coinOrigin:
          value[PaymentTransactionModelFiedls.coinOrigin] ?? _coinOrigin,
      coinSwap: value[PaymentTransactionModelFiedls.coinSwap] ?? _coinSwap,
    );
  }
}

class PaymentTransactionModelFiedls {
  PaymentTransactionModelFiedls._();

  static const String ref = 'ref';
  static const String selectedPayment = 'selectedPayment';
  static const String selectedBank = 'selectedBank';
  static const String transactionFee = 'transactionFee';
  static const String total = 'total';
  static const String bahtAmount = 'bahtAmount';
  static const String gastaAmount = 'gastaAmount';
  static const String vouchers = 'vouchers';
  static const String accepted = 'accepted';
  static const String note = 'note';
  static const String createdAt = 'createdAt';
  static const String status = 'status';
  static const String updatedAt = 'updatedAt';
  static const String uploadSlip = 'uploadSlip';
  static const String selectedBankNumber = 'selectedBankNumber';
  static const String selectedBankName = 'selectedBankName';
  static const String transactionType = 'transactionType';
  static const String coinOrigin = 'coinOrigin';
  static const String coinSwap = 'coinSwap';
}
