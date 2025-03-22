import 'package:aconnec_1109_x/src/model/request_order_cancel_reason.m.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';

class OrderCancelReasonRequestModelPersistence
    implements ModelJson<OrderCancelReasonRequestModel> {
  @override
  List<OrderCancelReasonRequestModel> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  OrderCancelReasonRequestModel fromJson(Map<String, dynamic> json) {
    return OrderCancelReasonRequestModel(
      reason: json[OrderCancelReasonRequestFields.reason] ?? '',
      createdAt: json[OrderCancelReasonRequestFields.createdAt] ?? '',
      orderRef: json[OrderCancelReasonRequestFields.orderRef] ?? '',
    );
  }

  @override
  Map<String, dynamic> toJson(OrderCancelReasonRequestModel json) {
    return {
      OrderCancelReasonRequestFields.reason: json.reason,
      OrderCancelReasonRequestFields.createdAt: json.createdAt,
      OrderCancelReasonRequestFields.orderRef: json.orderRef,
    };
  }
}
