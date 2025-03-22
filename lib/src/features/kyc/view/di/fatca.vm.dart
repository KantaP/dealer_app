import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/features/main/bindings/main_bottom_app_bar.binding.dart';
import 'package:flutter/widgets.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/error_status.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/accept_law.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_new.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/fatca_modal_bottom_sheet.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/modals/view/kyc_not_approve_modal_bottom_sheet.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

@Injectable()
class FatcaViewModel extends ViewModel {
  final KycFirebaseService _firebaseService;
  FatcaViewModel(this._firebaseService);

  final _routesSubject = PublishSubject<AppRouteSpec>();

  Stream<AppRouteSpec> get routes => _routesSubject;

  final _stateSubject =
      BehaviorSubject<AcceptLawState>.seeded(AcceptLawState());
  Stream<AcceptLawState> get state => _stateSubject;

  late KycFinalViewModel _kycViewModel;
  late BuildContext _context;

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

  void setKycViewModel(KycFinalViewModel viewModel) {
    _kycViewModel = viewModel;
  }

  void setContext(BuildContext context) {
    _context = context;
  }

  Future<void> next() async {
    try {
      String result = await onRequestSaveAcception();
      if (result == ErrorStatus.nonError) {
        final kycProgress = await _firebaseService.getKycProgress();
        final updateProgress = kycProgress.copyWith({
          KycFinalPageStateFields.firstStepProgress: KycPageNames.kycTerm.name,
        });
        await _firebaseService.setKycProgress(updateProgress);
        _kycViewModel.updateState({KycFinalPageStateFields.isLoading: false});
      } else if (result == ErrorStatus.isUsaNationality) {
        final kycProgress = await _firebaseService.getKycProgress();
        final updateProgress = kycProgress.copyWith({
          KycFinalPageStateFields.firstStepProgress:
              KycPageNames.customerType.name,
        });
        await _firebaseService.setKycProgress(updateProgress);
        _kycViewModel.updateState({KycFinalPageStateFields.isLoading: false});
        // go to error page
        showKycFailedState();
      } else {
        throw Exception(result);
      }
    } catch (e) {
      _kycViewModel.updateState({KycFinalPageStateFields.isLoading: false});
    }
  }

  Future<String> onRequestSaveAcception() async {
    final state = _stateSubject.value;
    if (state.accept == true) {
      await _firebaseService.saveLawAcception(state);
      return ErrorStatus.isUsaNationality;
    }
    try {
      await _firebaseService.saveLawAcception(state);
    } catch (e) {
      return ErrorStatus.firebaseFailed;
    }

    return ErrorStatus.nonError;
  }

  Future<void> getCurrentData() async {
    final acceptionState = await _firebaseService.getAcceptLawState();

    if (acceptionState != null) {
      updateState(
        AcceptLawStatePersistence().toJson(
          acceptionState,
        ),
      );
    }
  }

  void openFatcaDocument() {
    showFatcaDocumentModalBottomSheet(_context);
    // NavigationService.toNamed(route)
  }

  void showKycFailedState() {
    showKycNotApproveModalBottomSheet(
      _context,
      title: S.current.kycFatcaFailedHeadline,
      content: S.current.kycFatcaFailedContent,
      onBack: onBackToHome,
    );
  }

  Future<void> onBackToHome() async {
    // final mainVm = MainBottomAppBarBinding.mainBottomAppBarViewModel;
    // await mainVm.onTapMenu(0);
    // Future.delayed(const Duration(milliseconds: 500));
    // return;
    // NavigationService.toReplacementAllNamed(RoutesConstant.home);
    // _routesSubject.add(const AppRouteSpec.pop());
  }
}
