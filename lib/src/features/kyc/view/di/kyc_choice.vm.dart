import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_new.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:aconnec_1109_x/src/widgets/custom_dialog_box.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

@Injectable()
class KycChoiceViewModel extends ViewModel {
  final KycFirebaseService _firebaseService;
  KycChoiceViewModel(this._firebaseService);

  final _routesSubject = PublishSubject<AppRouteSpec>();

  Stream<AppRouteSpec> get routes => _routesSubject;

  late BuildContext _context;

  @override
  void dispose() {
    _routesSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    // TODO: implement updateState
  }

  void setContext(BuildContext context) {
    _context = context;
  }

  Future<void> process(NdidType type) async {
    final attempt = await _firebaseService.getNdidAttempt();
    if (attempt == 2) {
      openWarningDialog();
      return;
    }
    final kycProgress = await _firebaseService.getKycProgress();
    final KycFinalPageState updateProgress;
    if (type == NdidType.public) {
      updateProgress = kycProgress.copyWith({
        KycFinalPageStateFields.ndidType: type.name,
        KycFinalPageStateFields.thirdStepProgress:
            KycPageNames.ndidTermAndCondition.name
      });
      await _firebaseService.setKycProgress(updateProgress);
    } else if (type == NdidType.counterService) {
      updateProgress = kycProgress.copyWith({
        KycFinalPageStateFields.ndidType: type.name,
        KycFinalPageStateFields.thirdStepProgress:
            KycPageNames.ndidIntroduction.name
      });
      await _firebaseService.setKycProgress(updateProgress);
    } else if (type == NdidType.agent) {
      updateProgress = kycProgress.copyWith({
        KycFinalPageStateFields.ndidType: type.name,
        KycFinalPageStateFields.thirdStepProgress:
            KycPageNames.ndidSelectIdp.name
      });
      await _firebaseService.setKycProgress(updateProgress);
    }
  }

  void openWarningDialog() {
    DialogUtils.customShowDialog(
      context: _context,
      dialog: (_) => const CustomDialogAlert(
        descriptions: Text('Test'),
        title: Text('Test'),
      ),
    );
  }
}
