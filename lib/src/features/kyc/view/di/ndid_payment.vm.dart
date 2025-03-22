import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:aconnec_1109_x/src/features/kyc/view/widgets/alerts/ndid_payment_cancel_alert.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_bank_function/response_bay_qr.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_pure_fiat_function/pure_fiat_cancel.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_pure_fiat_function/pure_fiat_create.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_pure_fiat_function/pure_fiat_open_check.m.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/features/authenticate/service/di/authentication.firebase.dart';
import 'package:aconnec_1109_x/src/features/bank/services/di/payment.firebase.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_new.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/ndid_payment.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_bank_function/bay_qr_request.m.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/utilities/string.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:aconnec_1109_x/src/widgets/custom_dialog_box.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/subjects.dart';
import 'dart:ui' as ui;

@Injectable()
class NdidPaymentViewModel extends ViewModel {
  final KycFirebaseService _firebaseService;
  final AuthenticationFirebaseService _authenticationFirebaseService;
  final PaymentFirebaseService _bankFirebaseService;
  NdidPaymentViewModel(
    this._firebaseService,
    this._authenticationFirebaseService,
    this._bankFirebaseService,
  );

  final _stateSubject =
      BehaviorSubject<NdidPaymentPageState>.seeded(NdidPaymentPageState());

  Stream<NdidPaymentPageState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final _timerSubject =
      BehaviorSubject<NdidPaymentTimerState>.seeded(NdidPaymentTimerState());
  Stream<NdidPaymentTimerState> get timerState => _timerSubject;

  late KycFinalViewModel _kycLevel2ViewModel;
  DateTime expireAt = DateTime.now();
  late Timer _countdownTimer;

  bool loadingQr = false;

  final GlobalKey slipForSaveKey = GlobalKey();

  @override
  void dispose() {
    _stateSubject.close();
    _routesSubject.close();
    _countdownTimer.cancel();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(
      state.copyWith(updateValue),
    );
  }

  void updateTimerState(Map<String, dynamic> updateValue) {
    final state = _timerSubject.value;
    _timerSubject.add(
      state.copyWith(updateValue),
    );
  }

  void setKycLevel2ViewModel(KycFinalViewModel viewModel) {
    _kycLevel2ViewModel = viewModel;
  }

  void promptpayCancelAlert(BuildContext context) {
    showNdidPaymentCancelAlert(onCancel: () {
      cancellation();
    });
  }

  void goToRoot() {
    _routesSubject.add(const AppRouteSpec.popUntilRoot());
  }

  Future<void> cancellation() async {
    _kycLevel2ViewModel.updateState({
      KycLevel2PageStateFields.isLoading: true,
    });
    final user = await _authenticationFirebaseService.getCurrentUser();

    try {
      final purefiatData = await _bankFirebaseService.pureFiatOpenCheck(
          params:
              PureFiatOpenCheckRequest(idUser: user.uid, paymentType: 'ndid'));
      print(purefiatData.toJson());
      await _bankFirebaseService.pureFiatCancel(
          params: PureFiatCancelRequest(
              idPureFiat: purefiatData.idPureFiat,
              cancelReason: 'user_cancel',
              refcode: purefiatData.refcode));
    } catch (e) {
      print(e);
      _kycLevel2ViewModel.updateState({
        KycLevel2PageStateFields.isLoading: false,
      });
      return;
    }

    final kycProgress = await _firebaseService.getKycProgress();
    final updateProgress = kycProgress.copyWith({
      KycFinalPageStateFields.thirdStepProgress: KycPageNames.ndidSelect.name
    });
    _kycLevel2ViewModel.updateState({
      KycLevel2PageStateFields.isLoading: false,
    });
    await _firebaseService.setKycProgress(updateProgress);
    // goToRoot();
  }

  Future<void> mockPaymentSuccess() async {
    // _kycLevel2ViewModel.updateState({
    //   KycLevel2PageStateFields.isLoading: true,
    // });

    await Future.delayed(const Duration(seconds: 2));

    final kycProgress = await _firebaseService.getKycProgress();
    final updateProgress = kycProgress.copyWith({
      KycFinalPageStateFields.thirdStepProgress:
          KycPageNames.ndidPaymentResult.name,
      KycFinalPageStateFields.ndidPaymentResult: 'success'
    });

    await _firebaseService.setKycProgress(updateProgress);

    // _kycLevel2ViewModel.updateState({
    //   KycLevel2PageStateFields.isLoading: false,
    // });
  }

  Future<void> mockPaymentFailed() async {
    _kycLevel2ViewModel.updateState({
      KycLevel2PageStateFields.isLoading: true,
    });
    final kycProgress = await _firebaseService.getKycProgress();
    final updateProgress = kycProgress.copyWith({
      KycLevel2PageStateFields.thirdStepProgress:
          KycPageNames.ndidPaymentResult.name,
      KycLevel2PageStateFields.ndidPaymentResult: 'failed',
    });

    await _firebaseService.setKycProgress(updateProgress);
    _kycLevel2ViewModel.updateState({
      KycLevel2PageStateFields.isLoading: true,
    });
  }

  void paymentConfirmationAlert(BuildContext context) {
    DialogUtils.customShowDialog(
      context: context,
      dialog: (BuildContext _) => CustomDialogAlert(
        title: Text(
          S.current.paymentConfirmationTitle,
          style: titleStyle,
        ),
        descriptions: Text(
          S.current.paymentConfirmationNdidDescription,
          style: paragraph1RegularStyle?.copyWith(color: darkGreyColor),
          textAlign: TextAlign.center,
        ),
        submitButton: ElevatedButton(
          style: elevatedButton,
          onPressed: () {
            Navigator.pop(_);
            mockPaymentSuccess();
          },
          child: Text(
            S.current.confirmButton,
          ),
        ),
        optionalButton: GestureDetector(
          onTap: () {
            Navigator.pop(_);
          },
          child: Center(
            child: Text(
              S.current.ndidPaymentCancellationReturnButton,
              style: textInButtonStyle,
            ),
          ),
        ),
      ),
    );
  }

  void countdownStart() {
    loadQrCode().then((value) {
      if (value == true) {
        expireAt = DateTime.now().add(const Duration(minutes: 15));
        _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
          final expire = expireAt;
          final now = DateTime.now();
          final diff = expire.difference(now);
          if (diff.inSeconds == 0) {
            _countdownTimer.cancel();
          }
          updateTimerState({NdidPaymentTimerStateFields.countdown: diff});
        });
      }
    });
  }

  Future<bool> loadQrCode() async {
    _kycLevel2ViewModel.updateState({KycFinalPageStateFields.isLoading: true});
    try {
      final user = await _authenticationFirebaseService.getCurrentUser();
      bool alreadyOrderNdid;
      //check purefiat ndid
      try {
        final result = await _bankFirebaseService.pureFiatOpenCheck(
            params: PureFiatOpenCheckRequest(
                idUser: user.uid, paymentType: 'ndid'));
        print('check ndid');
        if (result.idPureFiat == 0) {
          alreadyOrderNdid = false;
        } else {
          alreadyOrderNdid = true;
          updateState({
            NdidPaymentPageStateFields.refNo: result.refcode,
            NdidPaymentPageStateFields.qrData: result.paymentQrData,
            NdidPaymentPageStateFields.amount: result.paymentValueActual,
          });
        }
      } catch (e) {
        print('no order');
        alreadyOrderNdid = false;
      }
      print(alreadyOrderNdid);
      if (alreadyOrderNdid) {
      } else {
        final refNo = StringUtils.generateRandomString(10);

        try {
          final request = BayQrRequestModel(
            ref1: refNo,
            ref2: user.id.toString(),
            amount: 130.00.toStringAsFixed(2),
            remark: 'ค่าดำเนินการ Ndid',
            type: QrPaymentType.purefiat.name,
            terminalId: QrPaymentType.purefiat.name,
          );
          final response =
              await _bankFirebaseService.onCallBayQrRequest(params: request);

          updateState({
            // NdidPaymentPageStateFields.refNo: refNo,
            NdidPaymentPageStateFields.qrResponse: response,
            NdidPaymentPageStateFields.qrData: response.content,
            NdidPaymentPageStateFields.amount: double.parse(response.amount),
          });
          try {
            final purefiatRequest = PureFiatCreateRequestModel(
              idUser: user.uid,
              refCode: refNo,
              paymentValue: 130.00,
              qrData: response.content,
            );

            print(purefiatRequest.toJson());

            final fiatResult = await _bankFirebaseService.pureFiatCreate(
                params: purefiatRequest);
            print(fiatResult.toJson());
            updateState({
              NdidPaymentPageStateFields.refNo: fiatResult.refcode,
            });
          } catch (e) {
            print('purefiat create error');
            throw e;
          }
        } catch (e) {
          print('bayqr create error');
          throw e;
        }
      }

      _kycLevel2ViewModel
          .updateState({KycFinalPageStateFields.isLoading: false});
      // Future.delayed(const Duration(seconds: 15), () {
      //   mockPaymentSuccess();
      // });
      return true;
    } catch (e) {
      print(e);
      _kycLevel2ViewModel
          .updateState({KycFinalPageStateFields.isLoading: false});
      DialogUtils.showToast(msg: S.current.somethingWentWrong, type: 'error');
      // Future.delayed(const Duration(seconds: 10), () {
      //   mockPaymentSuccess();
      // });
      return false;
    }
  }

  Future<void> exportQrCode() async {
    try {
      final RenderRepaintBoundary boundary = slipForSaveKey.currentContext!
          .findRenderObject()! as RenderRepaintBoundary;
      final ui.Image image = await boundary.toImage();
      final ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      final Uint8List pngBytes = byteData!.buffer.asUint8List();
      final String slipFileName =
          '1109x-ndid-payment-qr-${DateTime.now().toIso8601String()}.png';
      final path = join((await getTemporaryDirectory()).path, slipFileName);
      File imgFile = File(path);
      final bytes = await imgFile.writeAsBytes(pngBytes);
      final result = await ImageGallerySaver.saveFile(path);
      // print(result);
      DialogUtils.showToast(msg: 'Save QR success');
    } catch (e) {
      // print(e);
      DialogUtils.showToast(msg: e.toString(), type: 'error');
    }
  }
}
