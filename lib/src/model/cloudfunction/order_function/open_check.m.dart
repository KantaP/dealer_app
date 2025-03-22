import 'package:freezed_annotation/freezed_annotation.dart';

part 'open_check.m.freezed.dart';
part 'open_check.m.g.dart';

@freezed
class RequestOpenCheckModel with _$RequestOpenCheckModel {
  const factory RequestOpenCheckModel({
    @JsonKey(name: 'id_user') required String idUser,
  }) = _RequestOpenCheckModel;

  factory RequestOpenCheckModel.fromJson(Map<String, dynamic> json) =>
      _$RequestOpenCheckModelFromJson(json);
}

@freezed
class ResponseOpenCheckModel with _$ResponseOpenCheckModel {
  const factory ResponseOpenCheckModel({
    @JsonKey(name: 'id_order') @Default(0) int idOrder,
    @JsonKey(name: 'order_status') @Default('') String orderStatus,
    @JsonKey(name: 'order_side') @Default('') String orderSide,
    @JsonKey(name: 'refcode') @Default('') String refcode,
  }) = _ResponseOpenCheckModel;

  factory ResponseOpenCheckModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseOpenCheckModelFromJson(json);
}
