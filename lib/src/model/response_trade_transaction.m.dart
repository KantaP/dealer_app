import 'package:aconnec_1109_x/src/model/model.abs.dart';

class ResponseTradeTransactionModel
    implements Model<ResponseTradeTransactionModel> {
  int _idTrade = 0;
  int _idUser = 0;
  int _idPrice = 0;
  int _initTimeStamp = 0;
  int _closeTimeStamp = 0;
  String _paymentSide = '';
  String _paymentType = '';
  String _paymentChannel = '';
  int _paymentAssetId = 0;
  double _paymentValue = 0;
  String _statusPayment = '';
  String _statusTrade = '';
  String _network = '';
  String _ref = '';
  String _walletAddress = '';
  String _bankUser = '';
  double _quantity = 0;
  String _paymentSlipPath = '';
  String _uom = '';
  String _note = '';
  String _paymentCancelReason = '';
  String _paymentValueUom = '';

  ResponseTradeTransactionModel({
    int idTrade = 0,
    int idUser = 0,
    int idPrice = 0,
    int initTimeStamp = 0,
    int closeTimeStamp = 0,
    String paymentSide = '',
    String paymentType = '',
    String paymentChannel = '',
    int paymentAssetId = 0,
    double paymentValue = 0,
    String statusPayment = '',
    String statusTrade = '',
    String network = '',
    String ref = '',
    String walletAddress = '',
    String bankUser = '',
    double quantity = 0,
    String paymentSlipPath = '',
    String uom = '',
    String note = '',
    String paymentCancelReason = '',
    String paymentValueUom = '',
  }) {
    _idTrade = idTrade;
    _idUser = idUser;
    _idPrice = idPrice;
    _initTimeStamp = initTimeStamp;
    _closeTimeStamp = closeTimeStamp;
    _paymentSide = paymentSide;
    _paymentType = paymentType;
    _paymentChannel = paymentChannel;
    _paymentAssetId = paymentAssetId;
    _paymentValue = paymentValue;
    _statusPayment = statusPayment;
    _statusTrade = statusTrade;
    _network = network;
    _ref = ref;
    _walletAddress = walletAddress;
    _bankUser = bankUser;
    _quantity = quantity;
    _paymentSlipPath = paymentSlipPath;
    _uom = uom;
    _note = note;
    _paymentCancelReason = paymentCancelReason;
    _paymentValueUom = paymentValueUom;
  }

  int get idTrade => _idTrade;
  int get idUser => _idUser;
  int get idPrice => _idPrice;
  int get initTimeStamp => _initTimeStamp;
  int get closeTimeStamp => _closeTimeStamp;
  String get paymentSide => _paymentSide;
  String get paymentType => _paymentType;
  String get paymentChannel => _paymentChannel;
  int get paymentAssetId => _paymentAssetId;
  double get paymentValue => _paymentValue;
  String get statusPayment => _statusPayment;
  String get statusTrade => _statusTrade;
  String get network => _network;
  String get ref => _ref;
  String get walletAddres => _walletAddress;
  String get bankUser => _bankUser;
  double get quantity => _quantity;
  String get paymentSlipPath => _paymentSlipPath;
  String get uom => _uom;
  String get note => _note;
  String get paymentCancelReason => _paymentCancelReason;
  String get paymentValueUom => _paymentValueUom;

  @override
  ResponseTradeTransactionModel copyWith(Map<String, dynamic> value) {
    return ResponseTradeTransactionModel(
      idTrade: value[ResponseTradeTransactionModelFields.idTrade] ?? _idTrade,
      idUser: value[ResponseTradeTransactionModelFields.idUser] ?? _idUser,
      idPrice: value[ResponseTradeTransactionModelFields.idPrice] ?? _idPrice,
      initTimeStamp: value[ResponseTradeTransactionModelFields.initTimeStamp] ??
          _initTimeStamp,
      closeTimeStamp:
          value[ResponseTradeTransactionModelFields.closeTimeStamp] ??
              _closeTimeStamp,
      paymentSide: value[ResponseTradeTransactionModelFields.paymentSide] ??
          _paymentSide,
      paymentType: value[ResponseTradeTransactionModelFields.paymentType] ??
          _paymentType,
      paymentChannel:
          value[ResponseTradeTransactionModelFields.paymentChannel] ??
              _paymentChannel,
      paymentAssetId:
          value[ResponseTradeTransactionModelFields.paymentAssetId] ??
              _paymentAssetId,
      paymentValue: value[ResponseTradeTransactionModelFields.paymentValue] ??
          _paymentValue,
      statusPayment: value[ResponseTradeTransactionModelFields.statusPayment] ??
          _statusPayment,
      statusTrade: value[ResponseTradeTransactionModelFields.statusTrade] ??
          _statusTrade,
      network: value[ResponseTradeTransactionModelFields.network] ?? _network,
      ref: value[ResponseTradeTransactionModelFields.ref] ?? _ref,
      walletAddress: value[ResponseTradeTransactionModelFields.walletAddress] ??
          _walletAddress,
      bankUser:
          value[ResponseTradeTransactionModelFields.bankUser] ?? _bankUser,
      quantity:
          value[ResponseTradeTransactionModelFields.quantity] ?? _quantity,
      paymentSlipPath:
          value[ResponseTradeTransactionModelFields.paymentSlipPath] ??
              _paymentSlipPath,
      uom: value[ResponseTradeTransactionModelFields.uom] ?? _uom,
      note: value[ResponseTradeTransactionModelFields.note] ?? _note,
      paymentCancelReason:
          value[ResponseTradeTransactionModelFields.paymentCancelReason] ??
              _paymentCancelReason,
      paymentValueUom:
          value[ResponseTradeTransactionModelFields.paymentValueUom] ??
              _paymentValueUom,
    );
  }
}

class ResponseTradeTransactionModelFields {
  ResponseTradeTransactionModelFields._();

  static const String idTrade = 'id_trade';
  static const String idUser = 'id_user';
  static const String idPrice = 'id_price';
  static const String initTimeStamp = 'init_timestamp';
  static const String closeTimeStamp = 'closed_timestamp';
  static const String paymentSide = 'payment_side';
  static const String paymentType = 'payment_type';
  static const String paymentChannel = 'payment_channel';
  static const String paymentAssetId = 'payment_assetid';
  static const String paymentValue = 'payment_value';
  static const String statusPayment = 'status_payment';
  static const String statusTrade = 'status_trade';
  static const String network = 'network';
  static const String ref = 'ref';
  static const String walletAddress = 'wallet_address';
  static const String bankUser = 'bank_user';
  static const String quantity = 'payment_receive_amount';
  static const String paymentSlipPath = 'payment_slip_path';
  static const String uom = 'payment_receive_uom';
  static const String note = 'note';
  static const String paymentCancelReason = 'payment_cancel_reason';
  static const String paymentValueUom = 'payment_value_uom';
}

class ResponseTradeTransactionModelPersistence
    implements ModelJson<ResponseTradeTransactionModel> {
  @override
  List<ResponseTradeTransactionModel> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  ResponseTradeTransactionModel fromJson(Map<String, dynamic> json) {
    return ResponseTradeTransactionModel(
      idTrade: json[ResponseTradeTransactionModelFields.idTrade],
      idUser: json[ResponseTradeTransactionModelFields.idUser],
      idPrice: json[ResponseTradeTransactionModelFields.idPrice],
      initTimeStamp: json[ResponseTradeTransactionModelFields.initTimeStamp],
      closeTimeStamp: json[ResponseTradeTransactionModelFields.closeTimeStamp],
      paymentSide: json[ResponseTradeTransactionModelFields.paymentSide],
      paymentType: json[ResponseTradeTransactionModelFields.paymentType],
      paymentChannel: json[ResponseTradeTransactionModelFields.paymentChannel],
      paymentAssetId: json[ResponseTradeTransactionModelFields.paymentAssetId],
      paymentValue: double.parse(
          json[ResponseTradeTransactionModelFields.paymentValue].toString()),
      statusPayment: json[ResponseTradeTransactionModelFields.statusPayment],
      statusTrade: json[ResponseTradeTransactionModelFields.statusTrade],
      network: json[ResponseTradeTransactionModelFields.network],
      ref: json[ResponseTradeTransactionModelFields.ref],
      walletAddress: json[ResponseTradeTransactionModelFields.walletAddress],
      bankUser: json[ResponseTradeTransactionModelFields.bankUser],
      quantity: double.parse(
          json[ResponseTradeTransactionModelFields.quantity].toString()),
      paymentSlipPath:
          json[ResponseTradeTransactionModelFields.paymentSlipPath],
      uom: json[ResponseTradeTransactionModelFields.uom],
      note: json[ResponseTradeTransactionModelFields.note],
      paymentCancelReason:
          json[ResponseTradeTransactionModelFields.paymentCancelReason],
      paymentValueUom:
          json[ResponseTradeTransactionModelFields.paymentValueUom],
    );
  }

  @override
  Map<String, dynamic> toJson(ResponseTradeTransactionModel json) {
    return {
      ResponseTradeTransactionModelFields.idTrade: json.idTrade,
      ResponseTradeTransactionModelFields.idUser: json.idUser,
      ResponseTradeTransactionModelFields.idPrice: json.idPrice,
      ResponseTradeTransactionModelFields.initTimeStamp: json.initTimeStamp,
      ResponseTradeTransactionModelFields.closeTimeStamp: json.closeTimeStamp,
      ResponseTradeTransactionModelFields.paymentSide: json.paymentSide,
      ResponseTradeTransactionModelFields.paymentType: json.paymentType,
      ResponseTradeTransactionModelFields.paymentChannel: json.paymentChannel,
      ResponseTradeTransactionModelFields.paymentAssetId: json.paymentAssetId,
      ResponseTradeTransactionModelFields.paymentValue: json.paymentValue,
      ResponseTradeTransactionModelFields.statusPayment: json.statusPayment,
      ResponseTradeTransactionModelFields.statusTrade: json.statusTrade,
      ResponseTradeTransactionModelFields.network: json.network,
      ResponseTradeTransactionModelFields.ref: json.ref,
      ResponseTradeTransactionModelFields.walletAddress: json.walletAddres,
      ResponseTradeTransactionModelFields.bankUser: json.bankUser,
      ResponseTradeTransactionModelFields.quantity: json.quantity,
      ResponseTradeTransactionModelFields.paymentSlipPath: json.paymentSlipPath,
      ResponseTradeTransactionModelFields.uom: json.uom,
      ResponseTradeTransactionModelFields.note: json.note,
      ResponseTradeTransactionModelFields.paymentCancelReason:
          json.paymentCancelReason,
      ResponseTradeTransactionModelFields.paymentValueUom: json.paymentValueUom,
    };
  }
}
