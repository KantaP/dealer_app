import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/order_completed.st.dart';
import 'package:aconnec_1109_x/src/features/transaction/service/di/order.service.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_full.m.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:ui' as ui;

@Injectable()
class OrderCompletedViewModel extends ViewModel {
  final OrderFunctionService _orderService;
  final _stateSubject = BehaviorSubject.seeded(OrderCompletedPageState());

  OrderCompletedViewModel(this._orderService);
  Stream<OrderCompletedPageState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final GlobalKey slipForSaveKey = GlobalKey();

  final emailController = TextEditingController();

  @override
  void dispose() {
    _stateSubject.close();
    _routesSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(state.copyWith(updateValue));
  }

  void goHome() {
    _routesSubject.add(const AppRouteSpec(
        name: RoutesConstant.home, action: AppRouteAction.replaceAllWith));
  }

  Future<void> shareSlipPayment(String refCode) async {
    final state = _stateSubject.value;
    final RenderRepaintBoundary boundary = slipForSaveKey.currentContext!
        .findRenderObject()! as RenderRepaintBoundary;
    final ui.Image image = await boundary.toImage();
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List pngBytes = byteData!.buffer.asUint8List();
    // String slipFileName = 'slip-payment-order-${state.transaction!.ref}.png';
    // final path = join((await getTemporaryDirectory()).path, slipFileName);
    // File imgFile = File(path);
    // await imgFile.writeAsBytes(pngBytes);
    // await ImageGallerySaver.saveFile(path);
    // print(result);
    ShareResult shareResult;
    shareResult = await Share.shareXFiles(
      [
        XFile.fromData(
          pngBytes,
          name: 'slip-payment-order-$refCode.png',
          mimeType: 'image/png',
        ),
      ],
      subject: 'slip_payment_order_$refCode',
      sharePositionOrigin: boundary.localToGlobal(Offset.zero) & boundary.size,
    );
  }

  Future<ResponseOrderFullModel?> getOrder(int idOrder, String refCode) async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      final result = await _orderService
          .orderFull(RequestOrderFullModel(idOrder: idOrder, ref: refCode));

      return result;
    } catch (e) {
      print(e);
      DialogUtils.showToast(msg: S.current.somethingWentWrong, type: 'error');
      throw Exception(e);
    }
  }

  void backToHome() {
    _routesSubject.add(const AppRouteSpec(
        name: RoutesConstant.home, action: AppRouteAction.replaceAllWith));
  }

  Future<bool> goToHistory() async {
    _routesSubject.add(const AppRouteSpec(
        name: RoutesConstant.orderHistory, action: AppRouteAction.replaceWith));
    return false;
  }
}
