import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:aconnec_1109_x/src/constants/banks.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/systems.dart';
import 'package:aconnec_1109_x/src/features/authenticate/bindings/authenticate.binding.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/cancel_reason_arguments.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/order_cancel_arguments.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/order_toreceive_arguments.dart';
import 'package:aconnec_1109_x/src/features/transaction/service/di/order.service.dart';
import 'package:aconnec_1109_x/src/features/transaction/service/di/trxfiat.service.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_pure_fiat_function/pure_fiat_cancel.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_cancel.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_full.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_get.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/trxfiat_function/trxfiat_proof_manual.m.dart';
import 'package:aconnec_1109_x/src/model/response_trade_transaction.m.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:clipboard/clipboard.dart';
import 'package:expandable/expandable.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/company_data.dart';
import 'package:aconnec_1109_x/src/constants/firebase_storage.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/waiting_payment.st.dart';
import 'package:aconnec_1109_x/src/features/transaction/service/di/transaction.firebase.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:aconnec_1109_x/src/widgets/custom_dialog_box.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:ui' as ui;

import 'package:share_plus/share_plus.dart';

import '../../../../model/cloudfunction/on_call_pure_fiat_function/pure_fiat_open_check.m.dart';
import '../../../bank/bindings/bank.binding.dart';

@Injectable()
class WaitingPaymentViewModel extends ViewModel {
  final TransactionFirebaseService _firebaseService;
  final OrderFunctionService _orderService;
  final TrxFiatService _trxFiatService;
  WaitingPaymentViewModel(
    this._firebaseService,
    this._orderService,
    this._trxFiatService,
  );

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final _stateSubject = BehaviorSubject<WaitingPaymentPageState>.seeded(
      WaitingPaymentPageState());
  Stream<WaitingPaymentPageState> get state => _stateSubject;

  final _formSubject =
      BehaviorSubject<WaitingPaymentUploadSlipFormState>.seeded(
          WaitingPaymentUploadSlipFormState());
  Stream<WaitingPaymentUploadSlipFormState> get formState => _formSubject;

  late StreamSubscription<DatabaseEvent>? _transactionPaymentTracking;

  // final _timerSubject = BehaviorSubject<WaitingPaymentTimerState>.seeded(
  //     WaitingPaymentTimerState());
  // Stream<WaitingPaymentTimerState> get timerState => _timerSubject;

  late Timer? _countdownTimer;

  final ExpandableController expandableController = ExpandableController();

  final _orderSubject = BehaviorSubject<WaitingPaymentOrderData>.seeded(
      WaitingPaymentOrderData());
  Stream<WaitingPaymentOrderData> get orderState => _orderSubject;

  final GlobalKey qrSaveKey = GlobalKey();

  final _authenticationFirebaseService =
      AuthenticateBinding.authenticationFirebaseService;

  final _bankFirebaseService = BankBinding.bankFirebaseService;

  @override
  void dispose() {
    _routesSubject.close();
    _formSubject.close();
    _stateSubject.close();
    _orderSubject.close();
    _countdownTimer?.cancel();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(state.copyWith(updateValue));
  }

  void updateFormState(Map<String, dynamic> updateValue) {
    final state = _formSubject.value;
    _formSubject.add(state.copyWith(updateValue));
  }

  void updateOrderData(ResponseOrderFullModel data) {
    final state = _orderSubject.value;
    _orderSubject.add(state.copyWith({'orderFull': data}));
  }

  void goBack() {
    _countdownTimer!.cancel();
    _routesSubject.add(
      const AppRouteSpec(
        name: RoutesConstant.home,
        action: AppRouteAction.replaceAllWith,
      ),
    );
  }

  String getMyBankCaution() {
    final state = _stateSubject.value;
    String text = S.current.waitingPaymentCriticalHint2;
    if (state.transactionDetail.bankUser.isNotEmpty) {
      final splitTextBankUser = state.transactionDetail.bankUser.split('_');
      if (splitTextBankUser.isNotEmpty) {
        final bank = BankData.findBank(splitTextBankUser[0]);
        text =
            text.replaceAll('%bankName%', (bank != null) ? bank.label : 'N/A');
        text = text.replaceAll('%bankNumber%', splitTextBankUser[1]);
      }

      return text;
    }
    return '';
  }

  Future<void> getTransactionPayment(String ref) async {
    final data = await _firebaseService.getTradeTransaction(ref);
    updateState({WaitingPaymentPageStateFields.transactionDetail: data});
    return;
  }

  Future<void> cancelOrder() async {
    final state = _stateSubject.value;
    _routesSubject.add(
      AppRouteSpec(
        name: RoutesConstant.cancelReason,
        arguments: {'transaction_detail': state.transactionDetail},
        action: AppRouteAction.replaceWith,
      ),
    );
  }

  void cancelOrderAlert(BuildContext context) {
    DialogUtils.customShowDialog(
      context: context,
      dialog: (BuildContext _) => CustomDialogAlert(
        title: Text(
          S.current.orderCancelDialogTitle,
          style: titleStyle,
        ),
        submitButton: ElevatedButton(
          style: elevatedButton,
          onPressed: () {
            Navigator.of(context).pop();
            cancelOrder();
          },
          child: Text(
            S.current.cancelButton,
          ),
        ),
        optionalButton: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(S.of(context).backButton),
        ),
        descriptions: Container(),
      ),
    );
  }

  Future<void> onSelectSlip() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      updateFormState({
        WaitingPaymentUploadSlipFormStateFields.slipPath: image.path,
      });
    }
  }

  void onRemoveSlip() {
    updateFormState(
      {
        WaitingPaymentUploadSlipFormStateFields.slipPath: '',
      },
    );
  }

  Future<void> uploadSlip(int idOrder, String refCode) async {
    try {
      updateState({WaitingPaymentPageStateFields.isLoading: true});
      final formState = _formSubject.value;
      final ref = refCode;
      final uploadPath = await _firebaseService.uploadFile(
          FirebaseStorageValue.slipPaymentRef,
          File(formState.slipPath),
          'slip_payment_$ref');

      if (uploadPath.isNotEmpty) {
        updateState({WaitingPaymentPageStateFields.slipUploaded: true});
        final order = await _orderService
            .orderFull(RequestOrderFullModel(idOrder: idOrder, ref: refCode));
        final proofResult = await _trxFiatService.trxProof(
            RequestTrxFiatProofManualModel(
                idTrxFiat: order.trxfiat!.idTrxFiat!,
                paymentProof: uploadPath,
                refCode: refCode,
                datetimePayment: DateTime.now().toUtc().toString()));
        print('trx prool: $proofResult');
      } else {
        DialogUtils.showToast(msg: S.current.somethingWentWrong, type: 'error');
      }
      updateState({WaitingPaymentPageStateFields.isLoading: false});
    } catch (e) {
      updateState({WaitingPaymentPageStateFields.isLoading: false});
      DialogUtils.showToast(msg: S.current.somethingWentWrong, type: 'error');
    }
  }

  void copyBankAccountNumberToClipboard() {
    FlutterClipboard.copy(CompanyData.bankAccountNumber)
        .then((value) => DialogUtils.showToast(msg: 'copy to clipboard'));
  }

  Future<void> mockComplete() async {
    final state = _stateSubject.value;
    final updateTransaction = state.transactionDetail.copyWith({
      ResponseTradeTransactionModelFields.statusPayment:
          TransactionPaymentStatus.complete.name
    });
    await _firebaseService.updateTradeTransaction(
        updateTransaction.ref, updateTransaction);
    _routesSubject.add(
      AppRouteSpec(
        name: RoutesConstant.orderCompleted,
        arguments: {'transaction_detail': updateTransaction},
      ),
    );
  }

  Future<ResponseOrderFullModel?> getOrder(int idOrder, String refCode) async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      final result = await _orderService
          .orderFull(RequestOrderFullModel(idOrder: idOrder, ref: refCode));
      // print(result.trxfiat!.paymentProof);
      // print(result.toJson());
      updateOrderData(result);
      return result;
    } catch (e) {
      // print(e);
      DialogUtils.showToast(msg: S.current.somethingWentWrong, type: 'error');
      if (_countdownTimer != null) _countdownTimer!.cancel();
      throw Exception(e);
    }
  }

  void intervalCheckOrder(int idOrder, String refCode) {
    // _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(
        const Duration(seconds: SystemsSetting.orderCheckTimeSecond), (timer) {
      getOrder(idOrder, refCode).then(
        (value) {
          // print(idOrder);
          final order = value?.order ?? const ResponseOrderGetModel();
          if (order.status == OrderStatus.toreceive.name) {
            _countdownTimer!.cancel();
            NavigationService.navigatorKey.currentState!.pushReplacementNamed(
                RoutesConstant.orderToReceive,
                arguments: OrderToreceiveArgumentsScreen(
                    idOrder: idOrder, refCode: refCode));
          }
          if (order.status == OrderStatus.cancelled.name) {
            _countdownTimer!.cancel();
            Future.delayed(
              const Duration(seconds: 1),
              () {
                NavigationService.toReplacementWithNamed(
                    RoutesConstant.orderCancel,
                    arguments: OrderCancelArgumentsScreen(
                        idOrder: idOrder, refCode: refCode));
              },
            );
          }
        },
      );
    });
  }

  void backToHome() {
    _routesSubject.add(const AppRouteSpec(
        name: RoutesConstant.home, action: AppRouteAction.replaceAllWith));
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
      _countdownTimer!.cancel();
      final order = await _orderService
          .orderGet(RequestOrderGetModel(idOrder: idOrder, ref: refCode));
      await Future.delayed(const Duration(seconds: 1));
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
        try {
          final user = await _authenticationFirebaseService.getCurrentUser();
          final result = await _bankFirebaseService.pureFiatOpenCheck(
              params: PureFiatOpenCheckRequest(
                  idUser: user.uid, paymentType: PureFiatType.trxfiat.name));

          await _bankFirebaseService.pureFiatCancel(
              params: PureFiatCancelRequest(
                  idPureFiat: result.idPureFiat,
                  cancelReason: 'expired',
                  refcode: result.refcode));
        } catch (e) {
          print('no purefiat order');
        }

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
    _routesSubject.add(const AppRouteSpec(
        name: RoutesConstant.orderHistory, action: AppRouteAction.replaceWith));
    return false;
  }

  void cancelCheckOrder() {
    _countdownTimer!.cancel();
  }

  Future<void> qrSave(String refCode) async {
    final state = _stateSubject.value;
    final RenderRepaintBoundary boundary =
        qrSaveKey.currentContext!.findRenderObject()! as RenderRepaintBoundary;
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
          name: 'qr-payment-order-$refCode.png',
          mimeType: 'image/png',
        ),
      ],
      subject: 'qr_payment_order_$refCode',
      sharePositionOrigin: boundary.localToGlobal(Offset.zero) & boundary.size,
    );
  }

  Future<PureFiatOpenCheckResponse> checkPurefiat() async {
    final user = await _authenticationFirebaseService.getCurrentUser();

    //check purefiat ndid
    try {
      final result = await _bankFirebaseService.pureFiatOpenCheck(
          params: PureFiatOpenCheckRequest(
              idUser: user.uid, paymentType: PureFiatType.trxfiat.name));
      print('check trxFiat');
      print(result.toJson());
      return result;
    } catch (e) {
      print('no order');
      return PureFiatOpenCheckResponse();
    }
  }
}
