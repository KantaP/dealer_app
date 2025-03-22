import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/subjects.dart';

@Injectable()
class PreKnowledgeViewModel extends ViewModel {
  late KycFinalViewModel _kycViewModel;

  final KycFirebaseService _firebaseService;
  PreKnowledgeViewModel(this._firebaseService);

  final _routesSubject = PublishSubject<AppRouteSpec>();

  Stream<AppRouteSpec> get routes => _routesSubject;

  final logger = Logger('pre_knowledge_logger');

  @override
  void dispose() {
    _routesSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    // TODO: implement updateState
  }

  void setKycViewModel(KycFinalViewModel viewModel) {
    _kycViewModel = viewModel;
  }

  void next() {
    _routesSubject
        .add(const AppRouteSpec(name: RoutesConstant.knowledgeQuestion));
  }

  // Future<void> checkAnswer() async {
  //   _kycViewModel.updateState({KycLevel2PageStateFields.isLoading: true});
  //   try {
  //     final knowledgeState = await _firebaseService.getKnowledgeAnswers();
  //     _kycViewModel.updateState({KycLevel2PageStateFields.isLoading: false});
  //     logger
  //         .info(KnowledgeQuestionFormStatePersistence().toJson(knowledgeState));
  //     if (knowledgeState.userChoices.length == 10) {
  //       //update progress
  //       final pageState = await _firebaseService.getKycProgress();
  //       final updateKycProgress = pageState.copyWith({
  //         KycFinalPageStateFields.secondStepProgress:
  //             StaticValue.pageIndex[KycPageNames.knowledgeTestResult.name]
  //       });
  //       await _firebaseService.setKycProgress(updateKycProgress);
  //     }
  //   } catch (e) {
  //     // print('Error:$e');
  //     _kycViewModel.updateState({KycLevel2PageStateFields.isLoading: false});
  //   }
  // }
}
