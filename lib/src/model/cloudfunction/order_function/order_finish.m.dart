import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_finish.m.freezed.dart';
part 'order_finish.m.g.dart';

@freezed
class RequestOrderFinishModel with _$RequestOrderFinishModel {
  const factory RequestOrderFinishModel({
    @JsonKey(name: 'id_order') required int idOrder,
  }) = _RequestOrderFinishModel;

  factory RequestOrderFinishModel.fromJson(Map<String, dynamic> json) =>
      _$RequestOrderFinishModelFromJson(json);
}

@freezed
class ResponseOrderFinishModel with _$ResponseOrderFinishModel {
  const factory ResponseOrderFinishModel({
    @JsonKey(name: 'id_order') required int idOrder,
  }) = _ResponseOrderFinishModel;

  factory ResponseOrderFinishModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseOrderFinishModelFromJson(json);
}
