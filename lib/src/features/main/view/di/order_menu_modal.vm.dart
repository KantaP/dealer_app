import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/features/transaction/service/di/order.service.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_get.m.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model_new.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@singleton
@Injectable()
class OrderMenuModalViewModel extends CustomViewModel {
  final OrderFunctionService _orderService;
  OrderMenuModalViewModel(this._orderService);

  final _routesSubject = PublishSubject<AppRouteSpec>();

  Stream<AppRouteSpec> get routes => _routesSubject;

  @override
  void dispose() {
    _routesSubject.close();
  }

  @override
  void updateState(updateValue) {
    // TODO: implement updateState
  }

  void goToExchange() {
    NavigationService.toNamed(RoutesConstant.coinList);
  }

  void goToHistory() {
    NavigationService.toNamed(RoutesConstant.orderHistory);
  }

  Future<ResponseOrderGetModel?> orderCheck() async {
    try {
      await Future.delayed(const Duration(milliseconds: 1000));
      final checkResult = await _orderService.orderOpenCheck();
      if (checkResult.orderStatus == OrderStatus.cancelled.name ||
          checkResult.idOrder == 0) {
        return null;
      }
      final order = await orderGet(checkResult.idOrder, checkResult.refcode);
      return order;
    } catch (e) {
      // print('order check error');
      // DialogUtils.showToast(msg: S.current.somethingWentWrong, type: 'error');
      throw Exception(e);
    }
  }

  Future<ResponseOrderGetModel> orderGet(int idOrder, String refCode) async {
    try {
      final result = await _orderService
          .orderGet(RequestOrderGetModel(idOrder: idOrder, ref: refCode));
      return result;
    } catch (e) {
      // print(e);
      // DialogUtils.showToast(msg: S.current.somethingWentWrong, type: 'error');
      throw Exception(e);
    }
  }
}
