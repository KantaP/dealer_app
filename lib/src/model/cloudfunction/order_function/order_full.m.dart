import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_get.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/trxdigitalasset_function/trxdigitalasset_get.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/trxfiat_function/trxfiat_get.m.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_full.m.freezed.dart';
part 'order_full.m.g.dart';

@freezed
class RequestOrderFullModel with _$RequestOrderFullModel {
  const factory RequestOrderFullModel({
    @JsonKey(name: 'id_order') required int idOrder,
    @JsonKey(name: 'refcode') required String ref,
  }) = _RequestOrderFullModel;

  factory RequestOrderFullModel.fromJson(Map<String, dynamic> json) =>
      _$RequestOrderFullModelFromJson(json);
}

@freezed
class ResponseOrderFullModel with _$ResponseOrderFullModel {
  @JsonSerializable(explicitToJson: true)
  factory ResponseOrderFullModel({
    @JsonKey(name: 'order') @Default(null) ResponseOrderGetModel? order,
    @JsonKey(name: 'trxfiat') @Default(null) ResponseTrxFiatGetModel? trxfiat,
    @JsonKey(name: 'trxdigitalasset')
    @Default(null)
    ResponseTrxDigitalAssetGetModel? trxdigitalasset,
  }) = _ResponseOrderFullModel;

  factory ResponseOrderFullModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseOrderFullModelFromJson(json);
}
