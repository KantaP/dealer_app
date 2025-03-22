import 'package:aconnec_1109_x/src/core/custom_stream_subject.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/features/authenticate/bindings/authenticate.binding.dart';
import 'package:aconnec_1109_x/src/features/authenticate/model/otp_verification_arguments.dart';
import 'package:aconnec_1109_x/src/features/authenticate/model/phone_auth.st.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

import '../../../../widgets/dialogs/default_dialog.dart';
import '../../model/phone_auth_countdown.st.dart';

@Injectable()
class PhoneAuthViewModel extends ViewModel {
  final _stateSubject =
      BehaviorSubject<PhoneAuthState>.seeded(PhoneAuthState());
  Stream<PhoneAuthState> get state => _stateSubject;

  final _formStateSubject =
      BehaviorSubject<PhoneAuthFormState>.seeded(PhoneAuthFormState());
  Stream<PhoneAuthFormState> get formState => _formStateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final authenService = AuthenticateBinding.authenticationFirebaseService;

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
    final formState = _formStateSubject.value;
    _formStateSubject.add(
      formState.copyWith(updateValue),
    );
  }

  bool _validateForm() {
    final formState = _formStateSubject.value;
    bool check = true;
    if (formState.mobileNumber.trim().length < 9 || !validatePhoneNumber()) {
      updateFormState(<String, dynamic>{
        PhoneAuthFormFields.mobileNumberErrorText:
            S.current.phoneNumberWrongFormat
      });
      check = false;
    } else {
      updateFormState(
          <String, dynamic>{PhoneAuthFormFields.mobileNumberErrorText: ''});
    }

    if (formState.invitationCode != 'MOONDANCE') {
      showDefaultDialog(
        title: '',
        descriptions: S.current.inviteErrorDialogDescription,
      );
      check = false;
    }
    return check;
  }

  Future<void> verifyPhoneNumber() async {
    final formState = _formStateSubject.value;
    updateState(<String, dynamic>{PhoneAuthFormFields.submit: true});

    if (!_validateForm()) return;

    // try {
    //   final check = await authenService.onCallAuth(
    //       phoneNumber: '+66${formState.mobileNumber}');
    // } catch (e) {
    //   showDefaultDialog(title: '', descriptions: '');
    //   updateState(<String, dynamic>{PhoneAuthFormFields.submit: false});
    //   return;
    // }

    NavigationService.toNamed(
      RoutesConstant.otpVerification,
      arguments: OtpVerificationArgumentsScreen(
          mode: 'sign_in', phoneNumber: '+66${formState.mobileNumber}'),
    );
  }

  bool validatePhoneNumber() {
    final formState = _formStateSubject.value;
    final mobileNumber = formState.mobileNumber;
    return mobileNumber.startsWith(RegExp(r'^[6|8|9]'));
  }

  void goToTerm() {
    NavigationService.toNamed(RoutesConstant.appTerm);
  }

  void goToPrivacy() {
    NavigationService.toNamed(RoutesConstant.appPrivacy);
  }
}
