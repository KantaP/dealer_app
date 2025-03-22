import 'package:aconnec_1109_x/src/model/model.abs.dart';

class OrderCancelReasonRequestModel
    implements Model<OrderCancelReasonRequestModel> {
  String _reason = '';
  String _orderRef = '';
  String _createdAt = '';

  OrderCancelReasonRequestModel({
    String reason = '',
    String orderRef = '',
    String createdAt = '',
  }) {
    _reason = reason;
    _orderRef = orderRef;
    _createdAt = createdAt;
  }

  String get reason => _reason;
  String get orderRef => _orderRef;
  String get createdAt => _createdAt;

  @override
  OrderCancelReasonRequestModel copyWith(Map<String, dynamic> value) {
    return OrderCancelReasonRequestModel(
      reason: value[OrderCancelReasonRequestFields.reason] ?? _reason,
      orderRef: value[OrderCancelReasonRequestFields.orderRef] ?? _orderRef,
      createdAt: value[OrderCancelReasonRequestFields.createdAt] ?? _createdAt,
    );
  }
}

class OrderCancelReasonRequestFields {
  OrderCancelReasonRequestFields._();

  static const String reason = 'reason';
  static const String orderRef = 'orderRef';
  static const String createdAt = 'createdAt';
}
