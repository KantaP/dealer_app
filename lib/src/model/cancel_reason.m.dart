import 'package:aconnec_1109_x/src/model/model.abs.dart';

class CancelReasonModel implements Model<CancelReasonModel> {
  int _id = 0;
  int _reasonValue = 0;
  String _codeValue = '';
  String _transalateText = '';

  CancelReasonModel({
    int id = 0,
    int reasonValue = 0,
    String codeValue = '',
    String transalateText = '',
  }) {
    _id = id;
    _reasonValue = reasonValue;
    _codeValue = codeValue;
    _transalateText = transalateText;
  }

  int get id => _id;
  int get reasonValue => _reasonValue;
  String get codeValue => _codeValue;
  String get transalateText => _transalateText;

  @override
  CancelReasonModel copyWith(Map<String, dynamic> value) {
    return CancelReasonModel(
      id: value[CancelReasonModelFields.id] ?? _id,
      reasonValue: value[CancelReasonModelFields.reasonValue] ?? _reasonValue,
      codeValue: value[CancelReasonModelFields.codeValue] ?? _codeValue,
      transalateText:
          value[CancelReasonModelFields.transalateText] ?? _transalateText,
    );
  }
}

class CancelReasonModelFields {
  CancelReasonModelFields._();

  static const String id = 'id';
  static const String reasonValue = 'reasonValue';
  static const String codeValue = 'codeValue';
  static const String transalateText = 'transalateText';
}
