import 'dart:async';

import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/features/authenticate/model/otp_verification_arguments.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/utilities/encrypted.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:aconnec_1109_x/src/data/local/shared_preferences.dart';
import 'package:aconnec_1109_x/src/features/authenticate/model/enter_pin.st.dart';
import 'package:aconnec_1109_x/src/features/authenticate/service/di/authentication.firebase.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

import '../widgets/popup/forgot_pin.dart';

@Injectable()
class EnterPinViewModel extends ViewModel {
  final AuthenticationFirebaseService _service;
  final SharedPreferencesHelper _sharedPreferencesHelper;
  EnterPinViewModel(this._service, this._sharedPreferencesHelper);

  final _stateSubject =
      BehaviorSubject<EnterPinPageState>.seeded(EnterPinPageState());
  Stream<EnterPinPageState> get state => _stateSubject;

  final _formStateSubject =
      BehaviorSubject<EnterPinFormState>.seeded(EnterPinFormState());
  Stream<EnterPinFormState> get formState => _formStateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  late StreamSubscription<DatabaseEvent> _databaseSubscriber;

  int countAttempt = 5;

  @override
  void dispose() {
    _stateSubject.close();
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

  void setPin(String value) {
    final state = _formStateSubject.value;
    if (state.pin.length < 6) {
      updateFormState(<String, dynamic>{
        EnterPinFormFields.pin: state.pin + value,
      });
      return;
    }
  }

  void removePin() {
    final state = _formStateSubject.value;
    if (state.pin.isNotEmpty) {
      final removedPin = state.pin.substring(0, state.pin.length - 1);
      updateFormState(<String, dynamic>{
        EnterPinFormFields.pin: removedPin,
      });
    }
  }

  void goBack() {
    _routesSubject.add(
      const AppRouteSpec.pop(
        arguments: {'result': false},
      ),
    );
  }

  void listenState() {
    formState.listen((event) {
      if (event.pin.length == 6) {
        updateState(<String, dynamic>{EnterPinPageStateFields.isLoading: true});
        Future.delayed(
          const Duration(seconds: 3),
          () {
            // print(event.pin);
            final encrypted = EncryptedUtils.encrypt(event.pin);
            // print(encrypted);
            checkPin(encrypted).then((value) {
              updateState(
                  <String, dynamic>{EnterPinPageStateFields.isLoading: false});
            }).catchError((e) {
              // print(e);
              updateFormState(<String, dynamic>{
                EnterPinFormFields.pin: '',
              });
              // DialogUtils.showToast(
              //     msg: S.current.somethingWentWrong, type: 'error');
              updateState(
                  <String, dynamic>{EnterPinPageStateFields.isLoading: false});
            });
          },
        );
      }
    });
  }

  Future<void> checkPin(String encryptedPin) async {
    try {
      final result = await _service.onCallCheckPin(encryptedPin);
      if (result) {
        final user = await _service.getCurrentUser();
        if (user.status == 'terminated') {
          DialogUtils.showToast(
              msg: 'Your account has been terminated.', type: 'error');
          NavigationService.toReplacementAllNamed(RoutesConstant.welcomBack);
          return;
        }
        await _service.refreshToken();
        _routesSubject.add(
          const AppRouteSpec.pop(
            arguments: {'result': true},
          ),
        );
      } else {
        countAttempt--;
        updateFormState({'pin': ''});

        if (countAttempt == 0) {
          _service.signOut().then(
            (value) {
              _routesSubject.add(
                const AppRouteSpec(
                    name: RoutesConstant.welcomBack,
                    action: AppRouteAction.replaceAllWith),
              );
            },
          );
        } else {
          DialogUtils.showToast(
              msg: 'Wrong pin, you can tryagain $countAttempt times',
              type: 'error');
        }
      }
    } catch (e) {
      DialogUtils.showToast(msg: S.current.somethingWentWrong, type: 'error');
    }

    // _databaseSubscriber = _service.onUserDBValue().listen(
    //   (event) {
    //     if (event.snapshot.value != null) {
    //       final data =
    //           Map<String, dynamic>.from(event.snapshot.value as dynamic);
    //       final user = UserProfileModelPersistence().fromJson(data);

    //       _databaseSubscriber.cancel();
    //       updateState(
    //           <String, dynamic>{EnterPinPageStateFields.isLoading: false});
    //       if (user.pin == encryptedPin) {
    //         _routesSubject.add(
    //           const AppRouteSpec.pop(
    //             arguments: {'result': true},
    //           ),
    //         );
    //       } else {
    //         countAttempt++;
    //         updateFormState({'pin': ''});
    //         DialogUtils.showToast(
    //             msg: 'Wrong pin, Please try again', type: 'error');

    //         if (countAttempt == 5) {
    //           _service.signOut().then((value) {
    //             _routesSubject.add(
    //               const AppRouteSpec(
    //                   name: RoutesConstant.welcomBack,
    //                   action: AppRouteAction.replaceAllWith),
    //             );
    //           });
    //         }
    //       }
    //     }
    //   },
    // );
  }

  Future<void> forgotPin() async {
    showForgotPinAlert();
    // final profile = await _service.getCurrentUser();

    // if (profile.kycLevel == 2) {
    //   //check id card
    //   final checkIdCardResult =
    //       await NavigationService.toNamed(RoutesConstant.checkIdCard)
    //           as NavigationResult;
    //   if (checkIdCardResult.result == true) {
    //     NavigationService.toNamed(RoutesConstant.otpVerification,
    //         arguments: OtpVerificationArgumentsScreen(
    //             mode: 'forgot_pin', phoneNumber: profile.mobileNumber));
    //   }
    // } else {
    //   NavigationService.toNamed(RoutesConstant.otpVerification,
    //       arguments: OtpVerificationArgumentsScreen(
    //           mode: 'forgot_pin', phoneNumber: profile.mobileNumber));
    // }

    // _routesSubject.add(
    //   AppRouteSpec(
    //     name: RoutesConstant.otpVerification,
    //     arguments: OtpVerificationArgumentsScreen(
    //         mode: 'forgot_pin', phoneNumber: profile.mobileNumber),
    //   ),
    // );
  }
}
