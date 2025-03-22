import 'package:aconnec_1109_x/src/features/authenticate/service/di/authentication.firebase.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/di/forgot_password.vm.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/di/login_with_password.vm.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/di/suspend_account.vm.dart';

import '../../../di/components/injection.dart';
import '../service/di/phone_auth_countdown.dart';
import '../view/di/send_reset_password.vm.dart';
import '../view/di/sign_up_with_password.vm.dart';
import '../view/di/verify_email.vm.dart';

class AuthenticateBinding {
  static SuspendAccountViewModel get suspendAccountViewModel =>
      getIt<SuspendAccountViewModel>();

  static AuthenticationFirebaseService get authenticationFirebaseService =>
      getIt<AuthenticationFirebaseService>();

  static PhoneAuthCountDownService get phoneAuthCountDownService =>
      getIt<PhoneAuthCountDownService>();

  static SignUpWithPasswordViewModel get signUpWithPasswordViewModel =>
      getIt<SignUpWithPasswordViewModel>();

  static LoginWithPasswordViewModel get loginWithPasswordViewModel =>
      getIt<LoginWithPasswordViewModel>();

  static VerifyEmailViewModel get verifyEmailViewModel =>
      getIt<VerifyEmailViewModel>();

  static ForgotPasswordViewModel get forgotPasswordViewModel =>
      getIt<ForgotPasswordViewModel>();

  static SendResetPasswordViewModel get sendResetPasswordViewModel =>
      getIt<SendResetPasswordViewModel>();
}
