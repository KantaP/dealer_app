import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/constants/strings.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model_new.abs.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_new.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:injectable/injectable.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class DipchipTryagainModalBottomSheetViewModel extends CustomViewModel<void> {
  final KycFirebaseService kycFirebaseServcice;

  DipchipTryagainModalBottomSheetViewModel(this.kycFirebaseServcice);

  final _routesSubject = PublishSubject<AppRouteSpec>();

  Stream<AppRouteSpec> get routes => _routesSubject;

  @override
  void dispose() {
    _routesSubject.close();
  }

  Future<void> onBackToSelectNdid() async {
    final progress = await kycFirebaseServcice.getKycProgress();
    final newProgress = progress.copyWith({
      KycFinalPageStateFields.thirdStepProgress: KycPageNames.ndidSelect.name,
      KycFinalPageStateFields.ndidResult: '',
    });
    final rollbackStatus =
        await kycFirebaseServcice.updateKycStatus(StaticValue.semiVerified);
    await kycFirebaseServcice.setKycProgress(newProgress);
    NavigationService.back(NavigationResult(null));
  }

  void goToHome() {
    NavigationService.toRoot();
    // NavigationService.toReplacementAllNamed(RoutesConstant.home);
  }

  @override
  void updateState(void updateValue) {
    // TODO: implement updateState
  }
}
