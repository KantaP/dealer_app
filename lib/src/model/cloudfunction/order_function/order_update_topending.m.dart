import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_update_topending.m.freezed.dart';
part 'order_update_topending.m.g.dart';

@freezed
class RequestOrderUpdateTopendingModel with _$RequestOrderUpdateTopendingModel {
  const factory RequestOrderUpdateTopendingModel({
    @JsonKey(name: 'id_order') required int idOrder,
  }) = _RequestOrderUpdateTopendingModel;

  factory RequestOrderUpdateTopendingModel.fromJson(
          Map<String, dynamic> json) =>
      _$RequestOrderUpdateTopendingModelFromJson(json);
}

@freezed
class ResponseOrderUpdateTopendingModel
    with _$ResponseOrderUpdateTopendingModel {
  const factory ResponseOrderUpdateTopendingModel({
    @JsonKey(name: 'id_order') required int idOrder,
  }) = _ResponseOrderUpdateTopendingModel;

  factory ResponseOrderUpdateTopendingModel.fromJson(
          Map<String, dynamic> json) =>
      _$ResponseOrderUpdateTopendingModelFromJson(json);
}
