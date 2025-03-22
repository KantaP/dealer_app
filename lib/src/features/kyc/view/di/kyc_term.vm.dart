import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/modals/view/kyc_term_condition_modal_bottom_sheet.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:flutter/services.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_term.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

import '../../../../widgets/custom_radio_field.dart';

@Injectable()
class KycTermViewModel extends ViewModel {
  final KycFirebaseService _firebaseService;
  KycTermViewModel(this._firebaseService);

  final _stateSubject =
      BehaviorSubject<KycTermPageState>.seeded(KycTermPageState());

  Stream<KycTermPageState> get state => _stateSubject;
  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  late KycFinalViewModel _kycLevel2ViewModel;

  final List<RadioValue> listRadio = <RadioValue>[
    RadioValue(title: S.current.accept, value: true),
    RadioValue(title: S.current.doNotAccept, value: false),
  ];

  @override
  void dispose() {
    _stateSubject.close();
    _routesSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(state.copyWith(updateValue));
  }

  Future<String> loadKycTerm() async {
    final txt = await rootBundle.loadString(AssetDocuments.kycTermTh);
    return txt;
  }

  void setKycLevel2ViewModel(KycFinalViewModel viewModel) {
    _kycLevel2ViewModel = viewModel;
  }

  Future<void> next() async {
    final state = _stateSubject.value;

    _kycLevel2ViewModel.updateState({KycLevel2PageStateFields.isLoading: true});
    await _firebaseService.saveKycTerm(state);
    final kycProgress = await _firebaseService.getKycProgress();
    final updateProgress = kycProgress.copyWith({
      KycLevel2PageStateFields.firstStepProgress: KycPageNames.pdpa.name,
    });

    await _firebaseService.setKycProgress(updateProgress);

    _kycLevel2ViewModel
        .updateState({KycLevel2PageStateFields.isLoading: false});
  }

  bool canSubmit() {
    final state = _stateSubject.value;
    if (state.acceptAconnec && state.acceptRisk) {
      return true;
    }
    return false;
  }

  void showModalRisk() {
    showKycRisk();
  }

  void goToTermCondition() {
    NavigationService.toNamed(RoutesConstant.appTerm);
  }

  void goToRiskCondition() {
    NavigationService.toNamed(RoutesConstant.riskCondition);
  }

  void goToPrivacy() {
    NavigationService.toNamed(RoutesConstant.appPrivacy);
  }
}
