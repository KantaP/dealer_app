import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/custom_stream_subject.dart';
import '../../../../di/components/injection.dart';
import '../../../../utilities/dialog.dart';
import '../../../../widgets/layouts/di/default_layout_with_loading.vm.dart';
import '../../bindings/authenticate.binding.dart';
import '../../model/send_reset_password_arguments.dart';

@singleton
class ForgotPasswordViewModel {
  final emailSubject = CustomStreamSubject('');
  final loadingVm = getIt<DefaultLayoutWithLoadingViewModel>();
  final authService = AuthenticateBinding.authenticationFirebaseService;

  void dispose() {
    emailSubject.setValue('');
  }

  void checkEmail() async {
    try {
      loadingVm.showLoading(true);
      await authService.signInWithEmailAndPassword(
          emailSubject.subject.value, '123456');
      // print('login success');
    } on FirebaseAuthException catch (e) {
      loadingVm.showLoading(false);
      if (e.code == 'wrong-password') {
        // go to send email reset password page
        NavigationService.toReplacementWithNamed(
          RoutesConstant.resetPassword,
          arguments: SendResetPasswordArgumentsScreen(
              email: emailSubject.subject.value),
        );
      }
      if (e.code == 'too-many-requests') {
        DialogUtils.showToast(
            msg: 'Too many request, Please try again later.', type: 'error');
      }
      if (e.code == 'user-not-found') {
        DialogUtils.showToast(msg: 'User not found', type: 'error');
      }
    }
  }
}
