import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/strings.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_new.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/modals/view/kyc_not_approve_modal_bottom_sheet.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/update_amlo_status_function/request_update_amlo_status.m.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/utilities/encrypted.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

@Injectable()
class NdidIntroViewModel extends ViewModel {
  final KycFirebaseService _firebaseService;
  NdidIntroViewModel(this._firebaseService);

  final _routesSubject = PublishSubject<AppRouteSpec>();

  Stream<AppRouteSpec> get routes => _routesSubject;

  late KycFinalViewModel _kycLevel2ViewModel;

  @override
  void dispose() {
    _routesSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    // TODO: implement updateState
  }

  void setKycLevel2ViewModel(KycFinalViewModel viewModel) {
    _kycLevel2ViewModel = viewModel;
  }

  Future<void> next() async {
    _kycLevel2ViewModel.updateState({KycLevel2PageStateFields.isLoading: true});

    await Future.delayed(const Duration(seconds: 2));

    //check amlo
    final idCardInformation = await _firebaseService.getIdCardInformation();
    final decryptIdCard = EncryptedUtils.decrypt(idCardInformation!.idCard);
    final amloResponse = await _firebaseService.updateAmloStatus(
        request: RequestUpdateAmloStatusModel(identificationId: decryptIdCard));
    if (amloResponse.status == false) {
      await _firebaseService.updateKycStatus(StaticValue.notApprove);
      showKycNotApproveModalBottomSheet(
          NavigationService.navigatorKey.currentContext!);
      return;
    }

    final kycProgress = await _firebaseService.getKycProgress();
    final updateProgress = kycProgress.copyWith({
      KycFinalPageStateFields.thirdStepProgress:
          KycPageNames.ndidSelectPayment.name
    });

    await _firebaseService.setKycProgress(updateProgress);
    _kycLevel2ViewModel
        .updateState({KycLevel2PageStateFields.isLoading: false});
  }

  Future<void> cancel() async {
    _kycLevel2ViewModel.updateState({KycLevel2PageStateFields.isLoading: true});
    final kycProgress = await _firebaseService.getKycProgress();
    final updateProgress = kycProgress.copyWith({
      KycFinalPageStateFields.thirdStepProgress: KycPageNames.ndidSelect.name
    });

    await _firebaseService.setKycProgress(updateProgress);
    _kycLevel2ViewModel
        .updateState({KycLevel2PageStateFields.isLoading: false});
  }
}
