import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_update_toreceive.m.freezed.dart';
part 'order_update_toreceive.m.g.dart';

@freezed
class RequestOrderUpdateToreceiveModel with _$RequestOrderUpdateToreceiveModel {
  const factory RequestOrderUpdateToreceiveModel({
    @JsonKey(name: 'id_order') required int idOrder,
  }) = _RequestOrderUpdateToreceiveModel;

  factory RequestOrderUpdateToreceiveModel.fromJson(
          Map<String, dynamic> json) =>
      _$RequestOrderUpdateToreceiveModelFromJson(json);
}

@freezed
class ResponseOrderUpdateToreceiveModel
    with _$ResponseOrderUpdateToreceiveModel {
  const factory ResponseOrderUpdateToreceiveModel({
    @JsonKey(name: 'id_order') required int idOrder,
  }) = _ResponseOrderUpdateToreceiveModel;

  factory ResponseOrderUpdateToreceiveModel.fromJson(
          Map<String, dynamic> json) =>
      _$ResponseOrderUpdateToreceiveModelFromJson(json);
}
