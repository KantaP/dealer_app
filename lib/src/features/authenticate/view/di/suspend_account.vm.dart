import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/core/custom_stream_subject.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/features/authenticate/model/suspend_account.st.dart';
import 'package:aconnec_1109_x/src/features/authenticate/service/di/authentication.firebase.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model_new.abs.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@singleton
@Injectable()
class SuspendAccountViewModel extends CustomViewModel<SuspendAccountPageState> {
  final AuthenticationFirebaseService _authenticationFirebaseService;
  SuspendAccountViewModel(this._authenticationFirebaseService);

  final pageSubject = CustomStreamSubject(const SuspendAccountPageState());
  @override
  void dispose() {
    pageSubject.dispose();
  }

  @override
  void updateState(SuspendAccountPageState updateValue) {
    pageSubject.subject.add(updateValue);
  }

  Future<void> suspendAccount() async {
    final callback = await NavigationService.toNamed(RoutesConstant.enterPin);
    final result = callback['result'];
    if (result) {
      await _authenticationFirebaseService.terminate();
      DialogUtils.showToast(msg: S.current.terminateAccountSuccess);
      await _authenticationFirebaseService.signOut();
      NavigationService.toReplacementAllNamed(RoutesConstant.welcomBack);
    }
  }
}
