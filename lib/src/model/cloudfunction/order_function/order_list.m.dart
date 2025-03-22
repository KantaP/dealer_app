import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_get.m.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_list.m.freezed.dart';
part 'order_list.m.g.dart';

@freezed
class RequestOrderListModel with _$RequestOrderListModel {
  const factory RequestOrderListModel({
    @JsonKey(name: 'order_side') @Default(null) String? orderSide,
    @JsonKey(name: 'status') @Default(null) String? status,
    @JsonKey(name: 'digitalasset_type') @Default(null) String? digitalassetType,
    @JsonKey(name: 'limit') @Default(100) int limit,
    @JsonKey(name: 'page') @Default(1) int page,
    @JsonKey(name: 'fields') @Default([]) fields,
  }) = _RequestOrderListModel;

  factory RequestOrderListModel.fromJson(Map<String, dynamic> json) =>
      _$RequestOrderListModelFromJson(json);
}

@freezed
class ResponseOrderListModel with _$ResponseOrderListModel {
  @JsonSerializable(explicitToJson: true)
  const factory ResponseOrderListModel({
    @JsonKey(name: 'rows')
    @Default(<ResponseOrderGetModel>[])
    List<ResponseOrderGetModel> rows,
    @JsonKey(name: 'currentPage') @Default(1) int currentPage,
    @JsonKey(name: 'totalPages') @Default(0) int totalPages,
    @JsonKey(name: 'totalRows') @Default(0) int totalRows,
  }) = _ResponseOrderListModel;

  factory ResponseOrderListModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseOrderListModelFromJson(json);
}
