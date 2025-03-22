import 'dart:async';

import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/constants/systems.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/order_cancel_arguments.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/order_completed_arguments.dart';
import 'package:aconnec_1109_x/src/features/transaction/service/di/order.service.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_full.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_get.m.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class OrderToReceiveViewModel extends ViewModel {
  final OrderFunctionService _orderService;

  OrderToReceiveViewModel(this._orderService);

  final _routesSubject = PublishSubject<AppRouteSpec>();

  Stream<AppRouteSpec> get routes => _routesSubject;

  late Timer? _countdownTimer;
  @override
  void dispose() {
    _routesSubject.close();
    _countdownTimer?.cancel();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    // TODO: implement updateState
  }

  void goToHome() {
    _routesSubject.add(const AppRouteSpec(
        name: RoutesConstant.home, action: AppRouteAction.replaceAllWith));
  }

  Future<ResponseOrderFullModel?> getOrder(int idOrder, String refCode) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      print('rer');
      final result = await _orderService
          .orderFull(RequestOrderFullModel(idOrder: idOrder, ref: refCode));
      print(result);
      return result;
    } catch (e) {
      // print(e);
      DialogUtils.showToast(msg: S.current.somethingWentWrong, type: 'error');
      throw Exception(e);
    }
  }

  Future<bool> goToHistory() async {
    _routesSubject.add(const AppRouteSpec(
        name: RoutesConstant.orderHistory, action: AppRouteAction.replaceWith));
    return false;
  }

  void intervalCheckOrder(int idOrder, String refCode) {
    _countdownTimer = Timer.periodic(
        const Duration(seconds: SystemsSetting.orderCheckTimeSecond), (timer) {
      getOrder(idOrder, refCode).then(
        (value) {
          final order = value?.order ?? const ResponseOrderGetModel();
          if (order.status == OrderStatus.completed.name) {
            _countdownTimer?.cancel();
            NavigationService.navigatorKey.currentState!.pushReplacementNamed(
                RoutesConstant.orderCompleted,
                arguments: OrderCompletedArgumentsScreen(
                    idOrder: idOrder, refCode: refCode));
          }
          if (order.status == OrderStatus.cancelled.name) {
            _countdownTimer?.cancel();
            NavigationService.navigatorKey.currentState!.pushReplacementNamed(
                RoutesConstant.orderCancel,
                arguments: OrderCancelArgumentsScreen(
                    idOrder: idOrder, refCode: refCode));
          }
        },
      );
    });
  }
}
