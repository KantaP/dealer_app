import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_new.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/kyc_failed_modal_bottom_sheet.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/update_amlo_status_function/request_update_amlo_status.m.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/utilities/encrypted.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/constants/strings.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_level_1_process.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/modals/view/kyc_not_approve_modal_bottom_sheet.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:aconnec_1109_x/src/widgets/alert_dialog.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

@Injectable()
class KycLevel1ProcessViewModel extends ViewModel {
  final KycFirebaseService _firebaseService;
  KycLevel1ProcessViewModel(this._firebaseService);

  final _routesSubject = PublishSubject<AppRouteSpec>();

  Stream<AppRouteSpec> get routes => _routesSubject;

  final _stateSubject = BehaviorSubject<KycLevel1ProcessPageState>.seeded(
      KycLevel1ProcessPageState());
  Stream<KycLevel1ProcessPageState> get state => _stateSubject;

  late KycFinalViewModel _kycLevel1ViewModel;

  @override
  void dispose() {
    _routesSubject.close();
    _stateSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(state.copyWith(updateValue));
  }

  void setKycLevel1ViewModel(KycFinalViewModel viewModel) {
    _kycLevel1ViewModel = viewModel;
  }

  Future<void> checkIdCard() async {
    try {
      final idCardInformation = await _firebaseService.getIdCardInformation();
      if (idCardInformation != null) {
        final idCardDecrypt = EncryptedUtils.decrypt(idCardInformation.idCard);

        final responseAmlo = await _firebaseService.updateAmloStatus(
          request: RequestUpdateAmloStatusModel(
            identificationId: idCardDecrypt,
          ),
        );
        if (responseAmlo.status == true) {
          final kycProgress = await _firebaseService.getKycProgress();
          final updateProgress = kycProgress.copyWith({
            KycFinalPageStateFields.firstStepProgress:
                KycPageNames.address.name,
          });
          imageCache.clear();
          await _firebaseService.setKycProgress(updateProgress);
        } else {
          // if (responseAmlo.code == 99) {
          //   // Future.delayed(const Duration(seconds: 2), () => checkIdCard());
          //   return;
          // }

          await _firebaseService.rejectKyc();
          await showKycFailedModalBottomSheet(
            NavigationService.navigatorKey.currentContext!,
            title: S.current.kycNotPassTitle,
            content: S.current.kycNotPassContent,
            onBack: () {
              NavigationService.toReplacementAllNamed(RoutesConstant.home);
            },
          );
        }
      }
    } catch (e) {
      //Sentry.captureException(e);
      DialogUtils.showToast(msg: S.current.somethingWentWrong);
    }
  }

  Future<void> mockFailed() async {
    _firebaseService
        .updateKycStatus(StaticValue.kycIdcardWarning)
        .then((value) {
      showKycNotApproveModalBottomSheet(
        NavigationService.navigatorKey.currentContext!,
        title: S.current.kycNotApproveTitle,
        content: S.current.kycNotApproveContent,
        onBack: () {},
      );
    });
  }

  void failedAlert() {
    DialogUtils.customShowDialog(
      context: NavigationService.navigatorKey.currentContext!,
      dialog: (context) => TextAlertDialog(
        title: S.current.kycLevel1FailedTitle,
        content: S.current.kycLevel1FailedContent,
        onPress: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  void goToSetPin() {
    _routesSubject.add(const AppRouteSpec(name: RoutesConstant.setPin));
  }

  void next() {
    _routesSubject.add(const AppRouteSpec(
        name: RoutesConstant.home, action: AppRouteAction.replaceAllWith));
  }
}
