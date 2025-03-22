import 'dart:async';

import 'package:aconnec_1109_x/src/features/kyc/view/widgets/alerts/ndid_cancel_alert.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/modals/view/ndid_suspended_modal_bottom_sheet.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/modals/view/ndid_tryagain_modal_bottom_sheet.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/ndid_error_code.dart';
import 'package:aconnec_1109_x/src/constants/strings.dart';
import 'package:aconnec_1109_x/src/data/repositories/ndidService.repo.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/bank_ndid_waiting.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_new.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/modals/view/kyc_approve_modal_bottom_sheet.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/modals/view/kyc_not_approve_modal_bottom_sheet.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_rp_function/response_ndid_callback.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_rp_function/response_ndid_ref.m.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

@Injectable()
class BankNdidWaitingViewModel extends ViewModel {
  final KycFirebaseService _firebaseService;
  final NdidServiceRepository _ndidServiceRepository;
  BankNdidWaitingViewModel(this._firebaseService, this._ndidServiceRepository);

  final _routesSubject = PublishSubject<AppRouteSpec>();

  Stream<AppRouteSpec> get routes => _routesSubject;

  final _stateSubject = BehaviorSubject.seeded(BankNdidWaitingPageState());
  Stream<BankNdidWaitingPageState> get state => _stateSubject;

  final _timerSubject = BehaviorSubject.seeded(BankNdidTimerState());
  Stream<BankNdidTimerState> get timerState => _timerSubject;

  late KycFinalViewModel _kycLevel2ViewModel;

  late Timer _countdownTimer;

  late DateTime expireAt;

  late StreamSubscription<DatabaseEvent> _streamCallback;
  late StreamSubscription<DatabaseEvent> _refCallback;

  late BuildContext _context;

  @override
  void dispose() {
    _routesSubject.close();
    _stateSubject.close();
    _timerSubject.close();
    _countdownTimer.cancel();
    _refCallback.cancel();
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

  void setContext(BuildContext context) {
    _context = context;
  }

  Future<void> countdownStart(NdidRefResponseModel response) async {
    Duration timeLimit = const Duration(hours: 1);
    String type = NdidType.public.name;

    if (response.type == NdidType.agent.name) {
      timeLimit = const Duration(hours: 24);
      type = NdidType.agent.name;
    }
    expireAt = DateTime.parse(response.createdAt).toLocal().add(timeLimit);
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final expire = expireAt;
      final now = DateTime.now();
      final diff = expire.difference(now);
      if (diff.inSeconds < 0) {
        _countdownTimer.cancel();
        timeoutNdid();
      }
      updateTimerState({
        BankNdidTimerStateFields.countdown: diff,
        BankNdidTimerStateFields.type: type,
      });
    });
    return;
  }

  // void mockSuccess() {
  //   Future.delayed(const Duration(milliseconds: 5000), () {
  //     _kycLevel2ViewModel.pageController.nextPage(
  //       duration: const Duration(milliseconds: 500),
  //       curve: Curves.easeIn,
  //     );
  //   });
  // }

  Future<void> completeKyc() async {
    _kycLevel2ViewModel.updateState({
      KycLevel2PageStateFields.isLoading: true,
    });

    await _firebaseService.completeKyc();

    final kycProgress = await _firebaseService.getKycProgress();
    final updateProgress = kycProgress.copyWith({
      KycFinalPageStateFields.ndidResult: 'completed',
    });

    await _firebaseService.setKycProgress(updateProgress);
    // try {
    //   await _firebaseService.addNdidAttempt();
    // } catch (e) {
    //   print(e);
    // }
    await _firebaseService.updateKycStatus(StaticValue.verified);
    _kycLevel2ViewModel.updateState({
      KycLevel2PageStateFields.isLoading: false,
    });

    showKycApprove();
  }

  void showKycApprove() {
    final state = _stateSubject.value;

    showKycApproveModalBottomSheet(_context, ref: state.ndidRefResponse.refId);
  }

  Future<void> cancel() async {
    _kycLevel2ViewModel.updateState({
      KycLevel2PageStateFields.isLoading: true,
    });

    try {
      final state = _stateSubject.value;
      if (state.ndidRefResponse.requestId.isNotEmpty) {
        if (state.ndidRefResponse.type == NdidType.public.name) {
          await _firebaseService.onCallPublicCancelRequest(
              requestId: state.ndidRefResponse.requestId);
        }
        if (state.ndidRefResponse.type == NdidType.agent.name) {
          await _firebaseService.onCallAgentCancelRequest(
              requestId: state.ndidRefResponse.requestId);
        }
      }
      final ndidAttemptValue = await _firebaseService.getNdidAttempt();
      if (ndidAttemptValue == 2) {
        suspendKyc();
      } else {
        backToSelectIdp();
      }

      _kycLevel2ViewModel.updateState({
        KycLevel2PageStateFields.isLoading: false,
      });
    } catch (e) {
      _kycLevel2ViewModel.updateState({
        KycLevel2PageStateFields.isLoading: false,
      });
    }
    return;
  }

  Future<void> suspendKyc() async {
    final kycProgress = await _firebaseService.getKycProgress();
    final updateProgress = kycProgress.copyWith({
      KycFinalPageStateFields.thirdStepProgress: KycPageNames.ndidSelect.name,
    });
    await _firebaseService.setKycProgress(updateProgress);
    await _firebaseService.updateKycStatus(StaticValue.kycStep3NDIDFail);
    showNdidSuspendedModalBottomSheet();
  }

  Future<void> backToSelectIdp() async {
    final kycProgress = await _firebaseService.getKycProgress();
    final updateProgress = kycProgress.copyWith({
      KycFinalPageStateFields.thirdStepProgress:
          KycPageNames.ndidSelectIdp.name,
    });

    await _firebaseService.setKycProgress(updateProgress);
    // await _firebaseService.updateKycStatus(StaticValue.kycStep3NDIDFail);
  }

  Future<void> cancelDialogAlert() async {
    final ndidAttemptValue = await _firebaseService.getNdidAttempt();
    _cancelDialog(ndidAttemptValue);
  }

  void _cancelDialog(int ndidAttemptValue) {
    return DialogUtils.customShowDialog(
      context: NavigationService.navigatorKey.currentContext!,
      dialog: (BuildContext _) => NdidCancelAlert(
        ndidAttemptValue: ndidAttemptValue,
        onCancel: () {
          cancel();
        },
      ),
    );
  }

  Future<void> getNdidRef() async {
    // final encodeData = await _ndidServiceRepository.getReferrence();
    final ref = await _firebaseService.getTrackNdidRef();

    // NdidRefResponseModel ref = NdidRefResponseModelPersistence()
    //     .fromJson(Map<String, dynamic>.from(decodeData));
    // print('idpname: ${ref.idpName}');
    updateState({
      BankNdidWaitingPageStateFields.ndidRefResponse: ref,
    });
    await countdownStart(ref);
    Future.delayed(const Duration(seconds: 5), () {
      if (ref.callbackRef.isEmpty || ref.asDataRef.isEmpty) {
        return;
      }
      _streamCallback =
          _firebaseService.onValueRef(ref.callbackRef).listen((event) {
        final json = NdidCallbackResponseModelPersistence().fromJson(
            Map<String, dynamic>.from(event.snapshot.value as dynamic));
        // create model later *****
        final status = json.status;
        if (status == 'completed') {
          _streamCallback.cancel();
          completeKyc();
        }
        if (status == 'errored') {
          _streamCallback.cancel();
          failedKyc(json);
        }
        if (status == 'rejected') {
          _streamCallback.cancel();
          rejectKyc();
        }
      });
    });
  }

  Future<void> failedKyc(NdidCallbackResponseModel json) async {
    _kycLevel2ViewModel.updateState({
      KycLevel2PageStateFields.isLoading: true,
    });

    final kycProgress = await _firebaseService.getKycProgress();
    final updateProgress = kycProgress.copyWith({
      KycLevel2PageStateFields.ndidResult: 'failed',
    });

    await _firebaseService.setKycProgress(updateProgress);

    final errorResponse = json.errorResponseList;
    final asErrorResponse = json.asErrorResponseList;
    String message = '';
    if (errorResponse.isNotEmpty) {
      if (errorResponse[0].errorCode != 0) {
        _streamCallback.cancel();
        final errorCode = errorResponse[0].errorCode;
        message = getMessageError(errorCode);
      } else if (errorResponse[0].errorCode == 0) {
        if (asErrorResponse.isNotEmpty) {
          if (asErrorResponse[0].errorCode != 0) {
            _streamCallback.cancel();
            final errorCode = asErrorResponse[0].errorCode;
            message = getMessageError(errorCode);
          }
        }
      }
      await _firebaseService.updateKycStatus(StaticValue.kycStep3NDIDFail);
    }
    _kycLevel2ViewModel.updateState({
      KycLevel2PageStateFields.isLoading: false,
    });
    showKycFailed(title: S.current.kycNotSuccessHeadline, content: message);
  }

  void showKycFailed({required String title, required String content}) {
    final state = _stateSubject.value;
    showKycNotApproveModalBottomSheet(_context, title: title, content: content);
  }

  Future<void> rejectKyc() async {
    _kycLevel2ViewModel.updateState({
      KycLevel2PageStateFields.isLoading: true,
    });

    final kycProgress = await _firebaseService.getKycProgress();
    final updateProgress = kycProgress.copyWith({
      KycLevel2PageStateFields.ndidResult: 'rejected',
    });

    await _firebaseService.setKycProgress(updateProgress);
    // try {
    //   await _firebaseService.addNdidAttempt();
    // } catch (e) {
    //   print(e);
    // }

    await _firebaseService.updateKycStatus(StaticValue.kycStep3NDIDFail);
    _kycLevel2ViewModel.updateState({
      KycLevel2PageStateFields.isLoading: false,
    });
    // showKycFailed(
    //   title: S.current.kycNotSuccessHeadline,
    //   content: S.current.ndidFailedIDpDesc,
    // );
  }

  void onValueRefResponse() {
    _refCallback = _firebaseService.onNdidRefResponse().listen((event) {
      // print('ref response');
      getNdidRef();
    });
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

  Future<void> timeoutNdid() async {
    final ndidAttempt = await _firebaseService.getNdidAttempt();
    if (ndidAttempt < 2) {
      showNdidTryagainModalBottomSheet();
    } else {
      showNdidSuspendedModalBottomSheet();
    }
  }
}
