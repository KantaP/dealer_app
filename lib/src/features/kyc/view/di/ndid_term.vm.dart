import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_new.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/ndid_term.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:aconnec_1109_x/src/widgets/custom_dialog_box.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

@Injectable()
class NdidTermViewModel extends ViewModel {
  final KycFirebaseService _firebaseService;
  NdidTermViewModel(this._firebaseService);

  final _stateSubject =
      BehaviorSubject<NdidTermPageState>.seeded(NdidTermPageState());

  Stream<NdidTermPageState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  late KycFinalViewModel _kycLevel2ViewModel;

  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    _stateSubject.close();
    _routesSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(
      state.copyWith(updateValue),
    );
  }

  void setKycLevel2ViewModel(KycFinalViewModel viewModel) {
    _kycLevel2ViewModel = viewModel;
  }

  Future<String> loadNdidTerm() async {
    final txt = await rootBundle.loadString(AssetDocuments.ndidTermTh);
    return txt;
  }

  Future<void> reject() async {
    _kycLevel2ViewModel.updateState({KycLevel2PageStateFields.isLoading: true});
    //save choice (required)
    await _firebaseService.saveNdidTerm(NdidTermPageState(accept: false));

    final kycProgress = await _firebaseService.getKycProgress();
    final updateProgress = kycProgress.copyWith({
      KycFinalPageStateFields.thirdStepProgress: KycPageNames.ndidSelect.name
    });

    await _firebaseService.setKycProgress(updateProgress);
    _kycLevel2ViewModel
        .updateState({KycLevel2PageStateFields.isLoading: false});
  }

  Future<void> next() async {
    _kycLevel2ViewModel.updateState({KycLevel2PageStateFields.isLoading: true});
    //save choice (required)
    await _firebaseService.saveNdidTerm(NdidTermPageState(accept: true));

    final kycProgress = await _firebaseService.getKycProgress();
    final updateProgress = kycProgress.copyWith({
      KycFinalPageStateFields.thirdStepProgress:
          KycPageNames.ndidIntroduction.name
    });

    await _firebaseService.setKycProgress(updateProgress);
    _kycLevel2ViewModel
        .updateState({KycLevel2PageStateFields.isLoading: false});
  }

  Future<void> cancelDialogAlert(BuildContext context) async {
    DialogUtils.customShowDialog(
      context: context,
      dialog: (BuildContext _) => CustomDialogAlert(
        title: Text(
          S.current.ndidTermCancelDialogTitle,
          style: titleStyle,
        ),
        descriptions: Column(
          children: [
            Text(
              S.current.ndidTermCancelDialogDesc,
              style: paragraph1RegularStyle?.copyWith(color: darkGreyColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        submitButton: OutlinedButton(
          style: outlineAlertButtonStyle,
          onPressed: () {
            reject().then((value) => Navigator.pop(_));
          },
          child: Text(
            S.current.rejectButton,
          ),
        ),
        optionalButton: GestureDetector(
          onTap: () {
            Navigator.pop(_);
          },
          child: Center(
            child: Text(
              S.current.backButton,
              style: textInButtonStyle,
            ),
          ),
        ),
      ),
    );
  }
}
