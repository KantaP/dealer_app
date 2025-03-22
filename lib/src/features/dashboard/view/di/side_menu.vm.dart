import 'package:aconnec_1109_x/src/features/authenticate/bindings/authenticate.binding.dart';
import 'package:aconnec_1109_x/src/features/kyc/bindings/kyc.binding.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/kyc_failed_modal_bottom_sheet.dart';
import 'package:aconnec_1109_x/src/features/main/bindings/main_bottom_app_bar.binding.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/update_amlo_status_function/request_update_amlo_status.m.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/utilities/encrypted.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/data/local/shared_preferences.dart';
import 'package:aconnec_1109_x/src/features/authenticate/service/di/authentication.firebase.dart';
import 'package:aconnec_1109_x/src/features/bank/services/di/payment.firebase.dart';
import 'package:aconnec_1109_x/src/features/dashboard/model/side_menu.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/modals/view/kyc_not_approve_modal_bottom_sheet.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/modals/view/kyc_under_review_modal_bottom_sheet.dart';
import 'package:aconnec_1109_x/src/model/user_profile.m.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:aconnec_1109_x/src/widgets/custom_dialog_box.dart';
import 'package:intercom_flutter/intercom_flutter.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../di/components/injection.dart';

@Injectable()
@singleton
class SideMenuViewModel extends ViewModel {
  SideMenuViewModel();

  final _stateSubject =
      BehaviorSubject<SideMenuPageState>.seeded(SideMenuPageState());

  Stream<SideMenuPageState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final authService = AuthenticateBinding.authenticationFirebaseService;

  @override
  void dispose() {
    _stateSubject.close();
    _routesSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    // TODO: implement updateState
  }

  void goToSetting() {}

  Future<void> signOut() async {
    final mainVm = MainBottomAppBarBinding.mainBottomAppBarViewModel;
    mainVm.onTapMenu(0);
    NavigationService.toReplacementAllNamed(RoutesConstant.welcomBack);
  }

  Future<UserProfileModel> getCurrentUser() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    return authService.getCurrentUser();
  }

  Stream<DatabaseEvent> trackingUserData() {
    return authService.onUserDBValue();
  }

  Future<void> checkKyc() async {
    final user = await getCurrentUser();
    if (user.kycLevel == 0) {
      goToKyc();
    }
    if (user.kycLevel == 1) {
      gotoKycLevel2();
    }
  }

  void goToKyc() {
    NavigationService.toNamed(RoutesConstant.kycAll);
    // Navigator.of(NavigationService.navigatorKey.currentContext!)
    //     .pushReplacementNamed(RoutesConstant.kycAll);
  }

  void dialogNdidLimitReach() {
    DialogUtils.customShowDialog(
        context: NavigationService.navigatorKey.currentContext!,
        dialog: ndidLimitReach);
  }

  Widget ndidLimitReach(BuildContext _) {
    return CustomDialogAlert(
      title: Text(
        S.current.noticeDialogTitle,
        style: titleStyle,
      ),
      descriptions: Column(
        children: [
          Text(
            S.current.ndidReachToLimit,
            style: paragraph2Style,
          )
        ],
      ),
      submitButton: ElevatedButton(
        onPressed: () {
          Navigator.pop(_);
        },
        child: Text(
          S.current.okButton,
        ),
      ),
    );
  }

  void openUnderReview() {
    showUnderReviewModalBottomSheet(
        NavigationService.navigatorKey.currentContext!, onPress: () {
      NavigationService.toReplacementAllNamed(RoutesConstant.home);
      // _routesSubject.add(
      //   const AppRouteSpec(
      //       name: RoutesConstant.home, action: AppRouteAction.replaceAllWith),
      // );
    });
  }

  void openKycReject() {
    showKycFailedModalBottomSheet(
      NavigationService.navigatorKey.currentContext!,
      title: S.current.kycNotPassTitle,
      content: S.current.kycNotPassContent,
      onBack: () {
        NavigationService.toReplacementAllNamed(RoutesConstant.home);
        // _routesSubject.add(
        //   const AppRouteSpec(
        //       name: RoutesConstant.home, action: AppRouteAction.replaceAllWith),
        // );
      },
    );
  }

  void gotoKycLevel2() {
    NavigationService.toNamed(RoutesConstant.kyc);
    // _routesSubject.add(const AppRouteSpec(
    //     name: RoutesConstant.kyc, action: AppRouteAction.replaceWith));
  }

  void gotoBuyGasth() {
    NavigationService.toNamed(RoutesConstant.buyGToken);
    // _routesSubject.add(const AppRouteSpec(
    //   name: RoutesConstant.buyGToken,
    //   action: AppRouteAction.replaceWith,
    // ));
  }

  void gotoHistory() {
    NavigationService.toNamed(RoutesConstant.orderHistory);
    // _routesSubject.add(const AppRouteSpec(
    //   name: RoutesConstant.orderHistory,
    //   // action: AppRouteAction.replaceWith,
    // ));
  }

  // Future<void> testBayQr() async {
  //   final user = await _service.getCurrentUser();
  //   final request = BayQrRequestModel(
  //     ref1: StringUtils.generateRandomString(10),
  //     ref2: user.id.toString(),
  //     amount: 10,
  //     remark: 'test qr code',
  //   );
  //   _bankFirebaseService.onCallBayQrRequest(params: request);
  // }

  Future<void> underReviewModal(BuildContext context) async {
    showUnderReviewModalBottomSheet(context, onPress: () {
      print('test');
    });
  }

  Future<void> kycApprove(BuildContext context) async {
    // showKycApproveModalBottomSheet(
    //   context,
    //   onPress: () {
    //     print('test');
    //   },
    //   ref: '123456',
    // );
    showKycNotApproveModalBottomSheet(context);
  }

  Future<void> gotoQrCodeScanner() async {
    // _routesSubject.add(const AppRouteSpec(
    //   name: RoutesConstant.qrCodeScanner,
    // ));
    final result =
        await Navigator.of(NavigationService.navigatorKey.currentContext!)
            .pushNamed(RoutesConstant.qrCodeScanner);
    // print(result);
  }

  String showKycLevel(int level, String kycStatus) {
    if (level == 0) {
      if (kycStatus == '2-') {
        return S.current.userUnderReview;
      }
      return S.current.userUnverified;
    }
    return S.current.userVerified;
  }

  void goToSetpin() {
    NavigationService.toNamed(RoutesConstant.setPin);
    // _routesSubject.add(const AppRouteSpec(name: RoutesConstant.setPin));
  }

  Future<bool> amloCheck() async {
    final kycService = KycBinding.kycService;
    final kycIdCardInformation = await kycService.getIdCardInformation();

    if (kycIdCardInformation != null) {
      if (kycIdCardInformation.idCard.isNotEmpty) {
        final decryptedIdCard =
            EncryptedUtils.decrypt(kycIdCardInformation.idCard);
        final amloResult = await kycService.updateAmloStatus(
          request:
              RequestUpdateAmloStatusModel(identificationId: decryptedIdCard),
        );
        return amloResult.status;
      }
    }
    return true;
  }

  void gotoAccountMenu() {
    NavigationService.toNamed(RoutesConstant.accountSubmenu);
    // _routesSubject.add(const AppRouteSpec(name: RoutesConstant.accountSubmenu));
  }

  void gotoSettingMenu() {
    NavigationService.toNamed(RoutesConstant.settingSubmenu);
    // _routesSubject.add(const AppRouteSpec(name: RoutesConstant.settingSubmenu));
  }

  void gotoHelpMenu() {
    NavigationService.toNamed(RoutesConstant.helpSubmenu);
    // _routesSubject.add(const AppRouteSpec(name: RoutesConstant.helpSubmenu));
  }

  void gotoOtherMenu() {
    NavigationService.toNamed(RoutesConstant.otherSubmenu);
    // _routesSubject.add(const AppRouteSpec(name: RoutesConstant.otherSubmenu));
  }

  Future<void> showIntercomDisplay() async {
    await Intercom.instance.displayMessenger();
  }
}
