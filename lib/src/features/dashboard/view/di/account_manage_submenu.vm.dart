import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/features/authenticate/model/otp_verification_arguments.dart';
import 'package:aconnec_1109_x/src/features/authenticate/service/di/authentication.firebase.dart';
import 'package:aconnec_1109_x/src/features/dashboard/model/account_manage_submenu.st.dart';
import 'package:aconnec_1109_x/src/features/dashboard/model/side_menu_model.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model_new.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@singleton
@Injectable()
class AccountManageSubmenuViewModel
    extends CustomViewModel<AccountManageSubmenuPageState> {
  final AuthenticationFirebaseService _authenticationFirebaseService;

  AccountManageSubmenuViewModel(this._authenticationFirebaseService);

  final _stateSubject = BehaviorSubject<AccountManageSubmenuPageState>.seeded(
      const AccountManageSubmenuPageState());

  Stream<AccountManageSubmenuPageState> get state => _stateSubject;

  @override
  void dispose() {
    _stateSubject.close();
  }

  @override
  void updateState(AccountManageSubmenuPageState updateValue) {
    // TODO: implement updateState
  }

  List<SideSubmenuModel> menus() {
    return <SideSubmenuModel>[
      SideSubmenuModel(
        text: S.current.resetPinSubMenuLabel,
        onPress: () {
          resetPin();
        },
      ),
      // SideSubmenuModel(
      //   text: 'ลบบัญชี',
      //   onPress: () {
      //     NavigationService.toNamed(RoutesConstant.suspendAccount);
      //   },
      // ),
      SideSubmenuModel(
        text: S.current.deleteAccountSubMenuLabel,
        onPress: () {
          NavigationService.toNamed(RoutesConstant.suspendAccount);
        },
      ),
    ];
  }

  Future<void> resetPin() async {
    final profile = await _authenticationFirebaseService.getCurrentUser();
    if (profile.kycLevel == 2) {
      //check id card
      final checkIdCardResult =
          await NavigationService.toNamed(RoutesConstant.checkIdCard)
              as NavigationResult;
      if (checkIdCardResult.result == true) {
        NavigationService.toNamed(RoutesConstant.otpVerification,
            arguments: OtpVerificationArgumentsScreen(
                mode: 'forgot_pin', phoneNumber: profile.mobileNumber));
      }
    } else {
      NavigationService.toNamed(RoutesConstant.otpVerification,
          arguments: OtpVerificationArgumentsScreen(
              mode: 'forgot_pin', phoneNumber: profile.mobileNumber));
    }
  }
}
