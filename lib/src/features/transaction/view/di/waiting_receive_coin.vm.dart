import 'dart:async';

import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/constants/systems.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/cancel_reason_arguments.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/order_cancel_arguments.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/order_toreceive_arguments.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/waiting_receive_coin.st.dart';
import 'package:aconnec_1109_x/src/features/transaction/service/di/bitgo.service.dart';
import 'package:aconnec_1109_x/src/features/transaction/service/di/order.service.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_bitgo/get_deposit_wallet.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_cancel.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_full.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_get.m.dart';
import 'package:aconnec_1109_x/src/model/network.m.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/utilities/string.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import 'dart:ui' as ui;

import 'package:share_plus/share_plus.dart';

@Injectable()
class WaitingReceiveCoinViewModel extends ViewModel {
  final OrderFunctionService _orderService;
  final BitgoService _bitgoService;
  WaitingReceiveCoinViewModel(this._orderService, this._bitgoService);

  final _formSubject = BehaviorSubject.seeded(WaitingReceiveCoinFormState());
  Stream<WaitingReceiveCoinFormState> get formState => _formSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final GlobalKey<NavigatorState> _navigatorKey =
      NavigationService.navigatorKey;

  final GlobalKey shareKey = GlobalKey();
  final ExpandableController expandableController = ExpandableController();

  late Timer? _countdownTimer;
  final _orderSubject = BehaviorSubject<WaitingReceiveCoinOrderData>.seeded(
      WaitingReceiveCoinOrderData());
  Stream<WaitingReceiveCoinOrderData> get orderState => _orderSubject;

  @override
  void dispose() {
    _formSubject.close();
    _routesSubject.close();
    _countdownTimer?.cancel();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    // TODO: implement updateState
  }

  void updateFormState(Map<String, dynamic> updateValue) {
    final formState = _formSubject.value;
    _formSubject.add(formState.copyWith(updateValue));
  }

  void updateOrderData(ResponseOrderFullModel data) {
    final state = _formSubject.value;
    _formSubject.add(state.copyWith({'orderDetail': data}));
  }

  Future<void> createAddress() async {
    final randomString = StringUtils.generateRandomString(10);
    updateFormState({
      WaitingReceiveCoinFormStateFields.receiveAddress: randomString,
    });
  }

  Future<void> gotoSelectNetwork() async {
    Navigator.of(_navigatorKey.currentContext!)
        .pushNamed(RoutesConstant.selectNetwork)
        .then(
      (value) {
        Map<String, dynamic>? result;
        result = value as Map<String, dynamic>;
        final networkData = NetworkModelPersistence().fromJson(result);
        updateFormState({
          WaitingReceiveCoinFormStateFields.selectedNetwork:
              networkData.networkName,
        });
      },
    );
  }

  Future<void> shareDepositAddress() async {
    // final state = _stateSubject.value;
    final RenderRepaintBoundary boundary =
        shareKey.currentContext!.findRenderObject()! as RenderRepaintBoundary;
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
    const String filename = 'share-deposit-address-test';
    shareResult = await Share.shareXFiles(
      [
        XFile.fromData(
          pngBytes,
          name: '$filename.png',
          mimeType: 'image/png',
        ),
      ],
      subject: filename,
      sharePositionOrigin: boundary.localToGlobal(Offset.zero) & boundary.size,
    );
  }

  Future<ResponseOrderFullModel?> getOrder(int idOrder, String refCode) async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      final result = await _orderService
          .orderFull(RequestOrderFullModel(idOrder: idOrder, ref: refCode));
      updateOrderData(result);
      return result;
    } catch (e) {
      if (_countdownTimer != null) _countdownTimer!.cancel();
      DialogUtils.showToast(msg: S.current.somethingWentWrong, type: 'error');
      throw Exception(e);
    }
  }

  void intervalCheckOrder(int idOrder, String refCode) {
    _countdownTimer = Timer.periodic(
        const Duration(seconds: SystemsSetting.orderCheckTimeSecond), (timer) {
      getOrder(idOrder, refCode).then(
        (value) {
          final order = value?.order ?? const ResponseOrderGetModel();
          if (order.status == OrderStatus.toreceive.name) {
            _countdownTimer!.cancel();
            NavigationService.toReplacementWithNamed(
                RoutesConstant.orderToReceive,
                arguments: OrderToreceiveArgumentsScreen(
                    idOrder: idOrder, refCode: refCode));
          }
          if (order.status == OrderStatus.cancelled.name) {
            _countdownTimer!.cancel();
            NavigationService.toReplacementWithNamed(RoutesConstant.orderCancel,
                arguments: OrderCancelArgumentsScreen(
                    idOrder: idOrder, refCode: refCode));
          }
        },
      ).catchError((e) {
        _countdownTimer!.cancel();
        _countdownTimer = null;
      });
    });
  }

  void backToHome() {
    _routesSubject.add(const AppRouteSpec(
        name: RoutesConstant.home, action: AppRouteAction.replaceAllWith));
  }

  Future<ResponseGetDepositWalletModel> loadDepositAddress({
    required RequestGetDepositWalletModel request,
  }) async {
    try {
      final response = await _bitgoService.getDepositAddress(request);

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> copyAddressToClipboard(String address) async {
    await Clipboard.setData(ClipboardData(text: address));
    DialogUtils.showToast(msg: 'Copied to clipboard');
  }

  void goToCancelOrder(int idOrder, String refCode) {
    _routesSubject.add(
      AppRouteSpec(
        name: RoutesConstant.cancelReason,
        arguments:
            CancelReasonArgumentsScreen(idOrder: idOrder, refCode: refCode),
      ),
    );
  }

  Future<void> autoRecheck(int idOrder, String refCode) async {
    try {
      final order = await _orderService
          .orderGet(RequestOrderGetModel(idOrder: idOrder, ref: refCode));
      if (order.status == OrderStatus.toreceive.name) {
        NavigationService.navigatorKey.currentState!.pushReplacementNamed(
            RoutesConstant.orderToReceive,
            arguments: OrderToreceiveArgumentsScreen(
                idOrder: idOrder, refCode: refCode));
      } else {
        await _orderService.orderCancel(
          RequestOrderCancelModel(
              idOrder: idOrder, cancelReason: 'expired', ref: refCode),
        );
        NavigationService.navigatorKey.currentState!.pushReplacementNamed(
            RoutesConstant.orderCancel,
            arguments:
                OrderCancelArgumentsScreen(idOrder: idOrder, refCode: refCode));
      }
    } catch (e) {
      DialogUtils.showToast(msg: S.current.somethingWentWrong, type: 'error');
    }
  }

  Future<bool> goToHistory() async {
    _countdownTimer!.cancel();
    _routesSubject.add(const AppRouteSpec(
        name: RoutesConstant.orderHistory, action: AppRouteAction.replaceWith));
    return false;
  }

  void cancelCheckOrder() {
    _countdownTimer!.cancel();
  }
}
