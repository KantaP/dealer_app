import 'package:aconnec_1109_x/src/model/model.abs.dart';

class BankModel implements Model<BankModel> {
  String _bankName = '';
  String _bankImgUrl = '';
  int _id = 0;

  BankModel(
      {final String bankName = '',
      final String bankImgUrl = '',
      final int id = 0}) {
    _bankName = bankName;
    _bankImgUrl = bankImgUrl;
    _id = id;
  }

  String get bankName => _bankName;
  String get bankImgUrl => _bankImgUrl;
  int get id => _id;

  @override
  BankModel copyWith(Map<String, dynamic> value) {
    return BankModel(
      bankName: value[BankModelFields.bankName] ?? _bankName,
      bankImgUrl: value[BankModelFields.bankImgUrl] ?? _bankImgUrl,
      id: value[BankModelFields.id] ?? _id,
    );
  }
}

class BankModelFields {
  BankModelFields._();

  static const String bankName = 'bankName';
  static const String bankImgUrl = 'bankImgUrl';
  static const String id = 'id';
}
