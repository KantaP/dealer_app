import 'dart:async';

import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/features/transaction/service/di/order.service.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/constants/cancel_reason.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/order_cancel.st.dart';
import 'package:aconnec_1109_x/src/features/transaction/service/di/transaction.firebase.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../model/cloudfunction/order_function/order_full.m.dart';

@Injectable()
class OrderCancelViewModel extends ViewModel {
  final TransactionFirebaseService _firebaseService;
  final OrderFunctionService _orderService;
  OrderCancelViewModel(this._firebaseService, this._orderService);

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final _stateSubject =
      BehaviorSubject<OrderCancelPageState>.seeded(OrderCancelPageState());
  Stream<OrderCancelPageState> get state => _stateSubject;

  @override
  void dispose() {
    _routesSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(state.copyWith(updateValue));
  }

  void goBack() {
    _routesSubject.add(const AppRouteSpec(
        name: RoutesConstant.home, action: AppRouteAction.replaceAllWith));
  }

  void goToBuyGasth() {
    _routesSubject.add(const AppRouteSpec(
        name: RoutesConstant.buyGToken, action: AppRouteAction.replaceWith));
  }

  String getReasonText() {
    final state = _stateSubject.value;
    final reasons = CancelReasonStaticValue.reasons;
    final reason = reasons.where((e) {
      return e.codeValue.trim() == state.cancelDetail.reason.trim();
    }).toList();
    return (reason.isEmpty) ? '' : reasons[0].transalateText;
  }

  Future<ResponseOrderFullModel?> getOrder(int idOrder, String refCode) async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      final result = await _orderService
          .orderFull(RequestOrderFullModel(idOrder: idOrder, ref: refCode));

      return result;
    } catch (e) {
      // print(e);
      DialogUtils.showToast(msg: S.current.somethingWentWrong, type: 'error');
      throw Exception(e);
    }
  }

  // void goToHistory() {
  //   _routesSubject.add(const AppRouteSpec(
  //       name: RoutesConstant.orderHistory, action: AppRouteAction.replaceWith));
  // }
  Future<bool> goToHistory() async {
    _routesSubject.add(const AppRouteSpec(
        name: RoutesConstant.orderHistory, action: AppRouteAction.replaceWith));
    return false;
  }
}
