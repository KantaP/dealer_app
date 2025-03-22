import 'dart:async';

import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/ndid_error_code.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/constants/strings.dart';
import 'package:aconnec_1109_x/src/data/repositories/ndidService.repo.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_new.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_success.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/modals/view/kyc_approve_modal_bottom_sheet.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/modals/view/kyc_not_approve_modal_bottom_sheet.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_rp_function/response_ndid_callback.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:aconnec_1109_x/src/widgets/custom_dialog_box.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

@Injectable()
class KycSuccessViewModel extends ViewModel {
  final NdidServiceRepository _ndidServiceRepository;
  final KycFirebaseService _firebaseService;
  KycSuccessViewModel(this._ndidServiceRepository, this._firebaseService);

  final _routesSubject = PublishSubject<AppRouteSpec>();

  Stream<AppRouteSpec> get routes => _routesSubject;

  final _stateSubject = BehaviorSubject.seeded(KycSuccessPageState());
  Stream<KycSuccessPageState> get state => _stateSubject;

  late StreamSubscription<DatabaseEvent> _streamCallback;
  late KycFinalViewModel _kycLevel2ViewModel;
  late StreamSubscription<DatabaseEvent> _refCallback;
  late BuildContext _context;

  @override
  void dispose() {
    _routesSubject.close();
    _stateSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(state.copyWith(updateValue));
  }

  void setKycLevel2ViewModel(KycFinalViewModel viewModel) {
    _kycLevel2ViewModel = viewModel;
  }

  void setContext(BuildContext context) {
    _context = context;
  }

  Future<void> next() async {
    _routesSubject.add(const AppRouteSpec(
        name: RoutesConstant.home, action: AppRouteAction.replaceAllWith));
  }

  Future<void> getNdidRef() async {
    updateState({KycSuccessPageStateFields.isLoading: true});
    // print('idpname: ${ref.idpName}');
    final ref = await _firebaseService.getTrackNdidRef();
    updateState({
      KycSuccessPageStateFields.ref: ref.refId,
      KycSuccessPageStateFields.createRequestResponse: ref,
    });

    // Future.delayed(const Duration(milliseconds: 500), () {
    _streamCallback = _firebaseService.onValueRef(ref.callbackRef).listen(
      (event) {
        // print('fired');
        final json = NdidCallbackResponseModelPersistence().fromJson(
            Map<String, dynamic>.from(event.snapshot.value as dynamic));
        // create model later *****
        final status = json.status;
        if (status == 'errored') {
          final errorResponse = json.errorResponseList;
          final asErrorResponse = json.asErrorResponseList;
          if (errorResponse.isNotEmpty) {
            if (errorResponse[0].errorCode != 0) {
              _streamCallback.cancel();
              final errorCode = errorResponse[0].errorCode;
              String message = getMessageError(errorCode);
              updateState({KycSuccessPageStateFields.errorMessage: message});
            } else if (errorResponse[0].errorCode == 0) {
              if (asErrorResponse.isNotEmpty) {
                if (asErrorResponse[0].errorCode != 0) {
                  _streamCallback.cancel();
                  final errorCode = asErrorResponse[0].errorCode;
                  String message = getMessageError(errorCode);
                  updateState(
                      {KycSuccessPageStateFields.errorMessage: message});
                }
              }
            }
            _firebaseService.updateKycStatus(StaticValue.kycStep3NDIDFail);
          }
        } else {
          _firebaseService.updateKycStatus(StaticValue.verified);
          if (status == 'completed') {
            openKycApprove();
          }
          _streamCallback.cancel();
        }
        updateState({KycSuccessPageStateFields.isLoading: false});
      },
    );
    // });
  }

  void openKycApprove() {
    final state = _stateSubject.value;
    showKycApproveModalBottomSheet(_context, ref: state.ref);
  }

  void openKycNotApprove() {
    final state = _stateSubject.value;
    showKycNotApproveModalBottomSheet(
      _context,
      title: S.current.kycNotSuccessHeadline,
      content: state.errorMessage,
    );
  }

  Future<KycFinalPageState> getCurrentProgress() {
    return _firebaseService.getKycProgress();
  }

  String getMessageError(int errorCode) {
    switch (errorCode.toString()) {
      case NdidErrorCode.code30000:
        return S.current.ndidErrorCode30000;
      case NdidErrorCode.code30200:
        return S.current.ndidErrorCode30200;
      case NdidErrorCode.code30300:
        return S.current.ndidErrorCode30300;
      case NdidErrorCode.code30400:
        return S.current.ndidErrorCode30400;
      case NdidErrorCode.code30500:
        return S.current.ndidErrorCode30500;
      case NdidErrorCode.code30510:
        return S.current.ndidErrorCode30510;
      case NdidErrorCode.code30520:
        return S.current.ndidErrorCode30520;
      case NdidErrorCode.code30530:
        return S.current.ndidErrorCode30530;
      case NdidErrorCode.code30600:
        return S.current.ndidErrorCode30600;
      case NdidErrorCode.code30610:
        return S.current.ndidErrorCode30610;
      case NdidErrorCode.code30700:
        return S.current.ndidErrorCode30700;
      case NdidErrorCode.code30800:
        return S.current.ndidErrorCode30800;
      case NdidErrorCode.code30900:
        return S.current.ndidErrorCode30900;
      case NdidErrorCode.code40000:
        return S.current.ndidErrorCode40000;
      case NdidErrorCode.code40200:
        return S.current.ndidErrorCode40200;
      case NdidErrorCode.code40300:
        return S.current.ndidErrorCode40300;
      case NdidErrorCode.code40400:
        return S.current.ndidErrorCode40400;
      case NdidErrorCode.code40500:
        return S.current.ndidErrorCode40500;
      default:
        return '';
    }
  }

  Future<void> cancelDialogAlert(BuildContext context) async {
    // final ndidAttemptValue = await _firebaseService.getNdidAttempt();
    const ndidAttemptValue = 2;
    DialogUtils.customShowDialog(
      context: context,
      dialog: (BuildContext _) => CustomDialogAlert(
        title: Text(
          S.current.ndidWaitingCancelTitle,
          style: titleStyle,
        ),
        descriptions: Column(
          children: [
            Text(
              S.current.ndidCancel2ndTitle,
              style: paragraph1RegularStyle?.copyWith(color: darkGreyColor),
              textAlign: TextAlign.center,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                S.current.ndid2ndCancelRefundDesc,
                style: paragraph1RegularStyle?.copyWith(color: darkGreyColor),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        submitButton: OutlinedButton(
          style: outlineAlertButtonStyle,
          onPressed: () {
            resetNdid().then((value) => Navigator.pop(_));
          },
          child: Text(
            S.current.kycNdidCancel2ndButton,
          ),
        ),
        optionalButton: GestureDetector(
          onTap: () {
            Navigator.pop(_);
          },
          child: Center(
            child: Text(
              S.current.backButton,
              style: textInButtonStyle,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> backtoIdp() async {
    final kycProgress = await _firebaseService.getKycProgress();
    final updateProgress = kycProgress.copyWith({
      KycFinalPageStateFields.thirdStepProgress: KycPageNames.ndidSelectIdp.name
    });

    await _firebaseService.setKycProgress(updateProgress);
    return;
  }

  Future<void> resetNdid() async {
    final kycProgress = await _firebaseService.getKycProgress();
    final updateProgress = kycProgress.copyWith({
      KycFinalPageStateFields.thirdStepProgress: KycPageNames.ndidSelect.name
    });
    // await _firebaseService.resetNdidAttempt();
    await _firebaseService.setKycProgress(updateProgress);
    return;
  }

  Future<int> getAttempt() async {
    final count = _firebaseService.getNdidAttempt();
    return count;
  }

  Future<void> backToHome() async {
    final kycProgress = await _firebaseService.getKycProgress();
    final updateProgress = kycProgress.copyWith({
      KycFinalPageStateFields.thirdStepProgress: KycPageNames.ndidSelect.name
    });

    await _firebaseService.setKycProgress(updateProgress);
    // await _firebaseService.resetNdidAttempt();
    _routesSubject.add(const AppRouteSpec(
        name: RoutesConstant.home, action: AppRouteAction.replaceAllWith));
    return;
  }

  void onValueRefResponse() {
    _refCallback = _firebaseService.onKycProgress().listen((event) {
      getNdidRef();
    });
  }
}
