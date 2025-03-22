import 'dart:async';

import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/data/local/shared_preferences.dart';
import 'package:aconnec_1109_x/src/features/authenticate/model/otp_verification.st.dart';
import 'package:aconnec_1109_x/src/features/authenticate/service/di/authentication.firebase.dart';
import 'package:aconnec_1109_x/src/model/user_profile.m.p.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/subjects.dart';

import '../../bindings/authenticate.binding.dart';

@Injectable()
class OtpVerificationViewModel extends ViewModel {
  final AuthenticationFirebaseService _service;
  final SharedPreferencesHelper _sharedPreferencesHelper;
  OtpVerificationViewModel(this._service, this._sharedPreferencesHelper);

  final _stateSubject =
      BehaviorSubject<OtpVerificationState>.seeded(OtpVerificationState());

  final _formStateSubject = BehaviorSubject<OtpVerificationFormState>.seeded(
      OtpVerificationFormState());

  final _timerStateSubject = BehaviorSubject<OtpVerificationTimerState>.seeded(
      OtpVerificationTimerState());

  Stream<OtpVerificationState> get state => _stateSubject;
  Stream<OtpVerificationFormState> get formState => _formStateSubject;
  Stream<OtpVerificationTimerState> get timerState => _timerStateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final logger = Logger('otp_verification_viewmodel');

  late StreamSubscription<OtpVerificationTimerState> _timerSubscription;
  late StreamSubscription<DatabaseEvent> _databaseSubscriber;

  final otpController = TextEditingController();

  late BuildContext _context;

  PhoneAuthCredential? credential;

  @override
  void dispose() {
    _stateSubject.close();
    _timerSubscription.cancel();
    _timerStateSubject.close();
    _formStateSubject.close();
    _routesSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(
      state.copyWith(updateValue),
    );
  }

  void updateFormState(Map<String, dynamic> updateValue) {
    final fomrState = _formStateSubject.value;
    _formStateSubject.add(
      fomrState.copyWith(updateValue),
    );
  }

  void updateTimerState(Map<String, dynamic> updateValue) {
    final timerState = _timerStateSubject.value;
    _timerStateSubject.add(
      timerState.copyWith(updateValue),
    );
  }

  void setContext(BuildContext context) {
    _context = context;
  }

  Future<void> onChangedOtp(String value) async {
    try {
      final formState = _formStateSubject.value;
      if (value.length == 6) {
        updateState(<String, dynamic>{OtpVerificationFields.isLoading: true});
        final pageState = _stateSubject.value;

        credential = PhoneAuthProvider.credential(
            verificationId: formState.verificationId, smsCode: value);
        // print(userCredential);
        // final logged = await loggin();
        final anonymouse = await _service.isAnonymously();
        if (anonymouse) {
          await _service.offAnonymously();
          await _service.signOut();
        }
        final user = await _service.signInWithCredential(credential!);
        await _service.signInWithPhoneAuthCredential(user);
        _timerSubscription.cancel();
        updateState(<String, dynamic>{OtpVerificationFields.isLoading: false});
        if (pageState.mode == 'sign_in') {
          final formState = _formStateSubject.value;
          //check status
          final userProfile = await _service.getCurrentUser();

          // if (userProfile.status == 'suspended') {
          //   await _service.signOut();
          //   NavigationService.toReplacementAllNamed(RoutesConstant.welcomBack);
          // } else {
          //   if (userProfile.actionSetPin == 1) {
          //     gotoEnterPin();
          //   } else {
          //     gotoSetPin();
          //   }
          // }
          if (userProfile.actionSetPin == 1) {
            gotoEnterPin();
          } else {
            gotoSetPin();
          }
        } else if (pageState.mode == 'forgot_pin') {
          await _service.resetSetUpPin();
          await gotoSetPin();
        }
      }
    } on FirebaseAuthException catch (e) {
      print('otperror:');
      print(e);
      //Sentry.captureException(e);
      // if (e.code == 'invalid-verification-code') {
      //   DialogUtils.showToast(
      //       msg: 'Otp incorrect, Please try again', type: 'error');

      // } else {
      //   DialogUtils.showToast(msg: '${e.code}: ${e.message!}', type: 'error');
      // }

      updateState(<String, dynamic>{OtpVerificationFields.isLoading: false});
      updateFormState(
        <String, dynamic>{
          OtpVerificationFormFields.errorState: e.message,
          OtpVerificationFormFields.submit: false
        },
      );
    }
  }

  Future<void> verifyPhoneNumber() async {
    // print('verify number');

    updateFormState(<String, dynamic>{
      OtpVerificationFormFields.submit: false,
      OtpVerificationFormFields.errorState: '',
    });
    otpController.value = TextEditingValue.empty;
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      final formState = _formStateSubject.value;
      updateState(<String, dynamic>{OtpVerificationFields.isLoading: true});
      _service.verifyPhoneNumber(
        formState.phoneNumber,
        verificationCompleted: _onVerificationCompleted,
        verificationFailed: _onVerificationFailed,
        codeSent: _codeSent,
        codeAutoRetrievalTimeout: _codeAutoRetrievalTimeout,
      );
    } catch (e) {
      updateState(<String, dynamic>{OtpVerificationFields.isLoading: false});
      updateFormState(<String, dynamic>{
        OtpVerificationFormFields.errorState:
            S.current.otpVerificationSomethingWentWrong
      });
    }
  }

  void _onVerificationCompleted(PhoneAuthCredential credential) {
    updateState(
      <String, dynamic>{OtpVerificationFields.isLoading: false},
    );
    updateFormState(<String, dynamic>{OtpVerificationFormFields.submit: false});
  }

  void _onVerificationFailed(FirebaseAuthException e) {
    //Sentry.captureException(e);

    updateState(
      <String, dynamic>{OtpVerificationFields.isLoading: false},
    );
    updateFormState(
      <String, dynamic>{
        OtpVerificationFormFields.errorState: e.message,
        OtpVerificationFormFields.submit: false
      },
    );
  }

  void _codeSent(String s, int? datetime) {
    updateState(<String, dynamic>{OtpVerificationFields.isLoading: false});
    updateFormState(
      <String, dynamic>{
        OtpVerificationFormFields.verificationId: s,
      },
    );
    print('code sent');
    updateState(
      <String, dynamic>{OtpVerificationFields.isLoading: false},
    );
    updateTimerState(<String, dynamic>{OtpVerificationTimerFields.time: 120});
  }

  void _codeAutoRetrievalTimeout(String s) {
    updateState(<String, dynamic>{OtpVerificationFields.isLoading: false});
    updateFormState(
      <String, dynamic>{
        OtpVerificationFormFields.verificationId: s,
      },
    );
    print('code retrie');
    updateTimerState(<String, dynamic>{OtpVerificationTimerFields.time: 120});
  }

  void listenState() {
    _timerSubscription = timerState.listen((event) {
      if (event.time > 0) {
        Future.delayed(const Duration(seconds: 1), () {
          updateTimerState(
            <String, dynamic>{OtpVerificationTimerFields.time: event.time - 1},
          );
        });
      }
    });
  }

  void firebaseListen() {
    try {
      _databaseSubscriber = _service.onUserDBValue().listen((event) {
        _databaseSubscriber.cancel();
        if (event.snapshot.value != null) {
          final data =
              Map<String, dynamic>.from(event.snapshot.value as dynamic);
          final user = UserProfileModelPersistence().fromJson(data);
          if (user.actionSetPin == 1) {
            gotoEnterPin();
          } else {
            gotoSetPin();
          }
        } else {
          DialogUtils.showToast(msg: 'Not found user', type: 'error');
        }
      });
    } catch (e) {
      // print(e);
      //Sentry.captureException(e);
    }
  }

  Future<void> gotoEnterPin() async {
    final callback = await NavigationService.navigatorKey.currentState!
        .pushNamed(RoutesConstant.enterPin);

    // if (callback.runtimeType == Map<String, dynamic>) {
    final mappedCallback = callback as Map<String, dynamic>;
    if (mappedCallback['result']) {
      _sharedPreferencesHelper.setLoggedIn(true);
      _routesSubject.add(
        const AppRouteSpec(
            name: RoutesConstant.home, action: AppRouteAction.replaceAllWith),
      );
    } else {
      NavigationService.toNamed(RoutesConstant.welcomBack);
    }

    // }
  }

  // Future<bool> loggin() async {
  //   if (credential == null) return false;
  //   try {
  //     // print(credential);
  //     // print('after');
  //     final user = await _service.signInWithPhoneAuthCredential(credential!);
  //     // print('after2');
  //     return true;
  //   } on Exception catch (e) {
  //     // print(e.toString());
  //     updateFormState(
  //         <String, dynamic>{OtpVerificationFormFields.submit: false});
  //     updateState(<String, dynamic>{OtpVerificationFields.isLoading: false});
  //     if (e
  //         .toString()
  //         .contains(FirebaseExceptionCode.invalidVerificationCode)) {
  //       updateFormState(<String, dynamic>{
  //         OtpVerificationFormFields.errorState: S.current.otpVerificationInvalid
  //       });
  //     }

  //     if (e.toString().contains(FirebaseExceptionCode.sessionExpired)) {
  //       updateFormState(<String, dynamic>{
  //         OtpVerificationFormFields.errorState: S.current.otpVerificationExpire
  //       });
  //     }
  //     return false;
  //   }
  // }

  Future<void> gotoSetPin() async {
    final callback = await NavigationService.navigatorKey.currentState!
        .pushNamed(RoutesConstant.setPin);

    final mappedCallback = callback as Map<String, dynamic>;
    if (mappedCallback['result']) {
      _sharedPreferencesHelper.setLoggedIn(true);
      _routesSubject.add(
        const AppRouteSpec(
            name: RoutesConstant.home, action: AppRouteAction.replaceAllWith),
      );
    }
  }

  Future<bool> onWillPop() async {
    final countdownService = AuthenticateBinding.phoneAuthCountDownService;
    countdownService.countdownState.setValue(120);
    NavigationService.back(NavigationResult(null));
    return false;
  }
}
