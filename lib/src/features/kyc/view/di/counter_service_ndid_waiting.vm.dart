import 'dart:async';

import 'package:aconnec_1109_x/src/constants/firebase_rt_db.dart';
import 'package:aconnec_1109_x/src/features/authenticate/bindings/authenticate.binding.dart';
import 'package:aconnec_1109_x/src/features/authenticate/service/di/authentication.firebase.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/aconnec_ndid_waiting.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/alerts/ndid_cancel_alert.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/modals/view/dipchip_tryagain_modal_bottom_sheet.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/modals/view/ndid_suspended_modal_bottom_sheet.dart';
import 'package:aconnec_1109_x/src/model/realtime_database/dipchip.m.dart';
import 'package:aconnec_1109_x/src/model/user_profile.m.p.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
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
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

@Injectable()
class CounterServiceNdidWaitingViewModel extends ViewModel {
  final KycFirebaseService _firebaseService;
  final NdidServiceRepository _ndidServiceRepository;
  final AuthenticationFirebaseService _authenticationFirebaseService =
      AuthenticateBinding.authenticationFirebaseService;
  CounterServiceNdidWaitingViewModel(
      this._firebaseService, this._ndidServiceRepository);

  final _routesSubject = PublishSubject<AppRouteSpec>();

  Stream<AppRouteSpec> get routes => _routesSubject;

  final _stateSubject = BehaviorSubject.seeded(AconnecNdidWatingPageState());
  Stream<AconnecNdidWatingPageState> get state => _stateSubject;

  final _timerSubject = BehaviorSubject.seeded(AconnecNdidTimerState());
  Stream<AconnecNdidTimerState> get timerState => _timerSubject;

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
    _streamCallback.cancel();
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

  Future<void> countdownStart(DipchipModel response) async {
    Duration timeLimit = const Duration(hours: 24);
    String type = NdidType.counterService.name;
    // final encodeData = await _ndidServiceRepository.getReferrence();
    // if (encodeData != null) {
    //   final decodeData = jsonDecode(encodeData);
    //   //convert to model
    //   NdidRefResponseModel ref = NdidRefResponseModelPersistence()
    //       .fromJson(Map<String, dynamic>.from(decodeData));

    //   if (ref.type == NdidType.counterService.name) {
    //     timeLimit = const Duration(days: 1);
    //     type = NdidType.counterService.name;
    //   }
    // }
    expireAt =
        DateTime.parse(response.dipchipCheckDate).toLocal().add(timeLimit);
    // print(expireAt);
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final expire = expireAt;
      final now = DateTime.now();
      final diff = expire.difference(now);
      if (diff.inSeconds < 0) {
        _countdownTimer.cancel();
        reCheckTryagain();
      }
      updateTimerState({
        BankNdidTimerStateFields.countdown: diff,
        BankNdidTimerStateFields.type: type,
      });
    });
    return;
  }

  void mockSuccess() {
    Future.delayed(const Duration(milliseconds: 5000), () {
      completeKyc();
    });
  }

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
      KycFinalPageStateFields.thirdStepProgress: KycPageNames.ndidSelect.name,
    });

    await _firebaseService.setKycProgress(updateProgress);
    await _firebaseService.updateKycStatus(StaticValue.kycStep3NDIDFail);
  }

  Future<void> updateKycFailed() async {
    final kycProgress = await _firebaseService.getKycProgress();
    final updateProgress = kycProgress.copyWith({
      KycFinalPageStateFields.thirdStepProgress: KycPageNames.ndidSelect.name,
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

  Future<void> getDipchipRef() async {
    // final encodeData = await _ndidServiceRepository.getReferrence();
    final ref = await _firebaseService.getDipchipTracking();

    await countdownStart(ref);
    final userProfile = await _authenticationFirebaseService.getCurrentUser();
    _streamCallback = _firebaseService
        .onValueRef(
            FirebaseRealtimeDatabaseValue.userProfileData(userProfile.uid))
        .listen((event) {
      final data = Map<String, dynamic>.from(event.snapshot.value as dynamic);
      final updateUserProfile = UserProfileModelPersistence().fromJson(data);
      if (updateUserProfile.kycStatus == '3' &&
          updateUserProfile.kycLevel == 2) {
        showKycApprove();
      } else if (updateUserProfile.kycStatus == '3--') {
        reCheckTryagain();
      }
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
    // try {
    //   await _firebaseService.addNdidAttempt();
    // } catch (e) {
    //   print(e);
    // }
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
    showKycFailed(
      title: S.current.kycNotSuccessHeadline,
      content: S.current.ndidFailedIDpDesc,
    );
  }

  void onValueRefResponse() {
    _refCallback = _firebaseService.onDipchipResponse().listen((event) {
      // print('ref response');
      getDipchipRef();
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

  Future<void> reCheckTryagain() async {
    final ndidAttempt = await _firebaseService.getNdidAttempt();
    if (ndidAttempt < 2) {
      showDipchipTryagainModalBottomSheetBottomSheet();
    } else {
      showNdidSuspendedModalBottomSheet();
    }
  }
}
