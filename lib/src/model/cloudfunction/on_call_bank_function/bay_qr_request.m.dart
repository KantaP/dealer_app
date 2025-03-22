import 'package:freezed_annotation/freezed_annotation.dart';

part 'bay_qr_request.m.freezed.dart';
part 'bay_qr_request.m.g.dart';

@freezed
class BayQrRequestModel with _$BayQrRequestModel {
  const factory BayQrRequestModel({
    @Default('') @JsonKey(name: 'ref1') String ref1,
    @Default('') @JsonKey(name: 'ref2') String ref2,
    @Default('') @JsonKey(name: 'amount') String amount,
    @Default('') @JsonKey(name: 'remark') String remark,
    @Default('') @JsonKey(name: 'type') String type,
    @Default('') @JsonKey(name: 'terminalId') String terminalId,
  }) = _BayQrRequestModel;

  factory BayQrRequestModel.fromJson(Map<String, dynamic> json) =>
      _$BayQrRequestModelFromJson(json);
}

// class BayQrRequestModel implements Model<BayQrRequestModel> {
//   String _ref1 = '';
//   String _ref2 = '';
//   double _amount = 0.0;
//   String _remark = '';

//   BayQrRequestModel({
//     String ref1 = '',
//     String ref2 = '',
//     double amount = 0.0,
//     String remark = '',
//   }) {
//     _ref1 = ref1;
//     _ref2 = ref2;
//     _amount = amount;
//     _remark = remark;
//   }

//   String get ref1 => _ref1;
//   String get ref2 => _ref2;
//   String get remark => _remark;

//   double get amount => _amount;

//   @override
//   BayQrRequestModel copyWith(Map<String, dynamic> value) {
//     return BayQrRequestModel(
//       ref1: value[BayQrRequestModelFields.ref1] ?? _ref1,
//       ref2: value[BayQrRequestModelFields.ref2] ?? _ref2,
//       amount: value[BayQrRequestModelFields.amount] ?? _amount,
//       remark: value[BayQrRequestModelFields.remark] ?? _remark,
//     );
//   }
// }

// class BayQrRequestModelFields {
//   BayQrRequestModelFields._();

//   static const String ref1 = 'ref1';
//   static const String ref2 = 'ref2';
//   static const String amount = 'amount';
//   static const String remark = 'remark';
// }

// class BayQrRequestModelPersistence implements ModelJson<BayQrRequestModel> {
//   @override
//   List<BayQrRequestModel> fromArrayJson(List arrJson) {
//     // TODO: implement fromArrayJson
//     throw UnimplementedError();
//   }

//   @override
//   BayQrRequestModel fromJson(Map<String, dynamic> json) {
//     return BayQrRequestModel(
//       ref1: json[BayQrRequestModelFields.ref1],
//       ref2: json[BayQrRequestModelFields.ref2],
//       amount: json[BayQrRequestModelFields.amount],
//       remark: json[BayQrRequestModelFields.remark],
//     );
//   }

//   @override
//   Map<String, dynamic> toJson(BayQrRequestModel json) {
//     return {
//       BayQrRequestModelFields.ref1: json.ref1,
//       BayQrRequestModelFields.ref2: json.ref2,
//       BayQrRequestModelFields.amount: json.amount.toStringAsFixed(2),
//       BayQrRequestModelFields.remark: json.remark,
//     };
//   }
// }
