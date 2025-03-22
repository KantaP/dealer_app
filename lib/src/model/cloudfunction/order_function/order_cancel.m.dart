import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_cancel.m.freezed.dart';
part 'order_cancel.m.g.dart';

@freezed
class RequestOrderCancelModel with _$RequestOrderCancelModel {
  const factory RequestOrderCancelModel({
    @JsonKey(name: 'id_order') required int idOrder,
    @JsonKey(name: 'cancel_reason') required String cancelReason,
    @JsonKey(name: 'refcode') required String ref,
  }) = _RequestOrderCancelModel;

  factory RequestOrderCancelModel.fromJson(Map<String, dynamic> json) =>
      _$RequestOrderCancelModelFromJson(json);
}

@freezed
class ResponseOrderCancelModel with _$ResponseOrderCancelModel {
  const factory ResponseOrderCancelModel({
    @JsonKey(name: 'id_order') required int idOrder,
  }) = _ResponseOrderCancelModel;

  factory ResponseOrderCancelModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseOrderCancelModelFromJson(json);
}
