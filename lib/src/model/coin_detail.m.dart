import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/utilities/convert.dart';

class ExchangeCoinDetailModel implements Model<ExchangeCoinDetailModel> {
  String _label = '';
  double _exchangeCoinValue = 0;
  double _exchangeAmount = 0;
  String _exchangeDate = '';

  ExchangeCoinDetailModel(
      {String label = '',
      double exchangeCoinValue = 0,
      double exchangeAmount = 0,
      String exchangeDate = ''}) {
    _label = label;
    _exchangeCoinValue = exchangeCoinValue;
    _exchangeAmount = exchangeAmount;
    _exchangeDate = exchangeDate;
  }

  String get label => _label;
  String get exchangeDate => _exchangeDate;
  double get exchangeCoinValue => _exchangeCoinValue;
  double get exchangeAmount => _exchangeAmount;

  @override
  ExchangeCoinDetailModel copyWith(Map<String, dynamic> value) {
    return ExchangeCoinDetailModel(
      label: value[ExchangeCoinDetailModelFields.label] ?? _label,
      exchangeDate:
          value[ExchangeCoinDetailModelFields.exchangeDate] ?? _exchangeDate,
      exchangeAmount: value[ExchangeCoinDetailModelFields.exchangeAmount] ??
          _exchangeAmount,
      exchangeCoinValue:
          value[ExchangeCoinDetailModelFields.exchangeCoinValue] ??
              _exchangeCoinValue,
    );
  }
}

class ExchangeCoinDetailModelFields {
  ExchangeCoinDetailModelFields._();

  static const String label = 'label';
  static const String exchangeDate = 'exchangeDate';
  static const String exchangeCoinValue = 'exchangeCoinValue';
  static const String exchangeAmount = 'exchangeAmount';
}

class ExchangeCoinDetailModelPersistence
    implements ModelJson<ExchangeCoinDetailModel> {
  @override
  List<ExchangeCoinDetailModel> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  ExchangeCoinDetailModel fromJson(Map<String, dynamic> json) {
    return ExchangeCoinDetailModel(
      label: json[ExchangeCoinDetailModelFields.label] ?? '',
      exchangeDate: json[ExchangeCoinDetailModelFields.exchangeDate] ?? '',
      exchangeCoinValue: ConvertUtils.convertToDouble(
          json[ExchangeCoinDetailModelFields.exchangeCoinValue]),
      exchangeAmount: ConvertUtils.convertToDouble(
          json[ExchangeCoinDetailModelFields.exchangeAmount]),
    );
  }

  @override
  Map<String, dynamic> toJson(ExchangeCoinDetailModel json) {
    return {
      ExchangeCoinDetailModelFields.label: json.label,
      ExchangeCoinDetailModelFields.exchangeDate: json.exchangeDate,
      ExchangeCoinDetailModelFields.exchangeAmount: json.exchangeAmount,
      ExchangeCoinDetailModelFields.exchangeCoinValue: json.exchangeCoinValue,
    };
  }
}
