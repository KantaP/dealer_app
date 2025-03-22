import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/pre_suiteable_test.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/suiteable_question.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class PreSuiteableTestViewModel extends ViewModel {
  final _pageStateSubject = BehaviorSubject<PreSuiteableTestPageState>.seeded(
      PreSuiteableTestPageState());
  Stream<PreSuiteableTestPageState> get pageState => _pageStateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  late KycFinalViewModel _kycViewModel;
  late BuildContext _context;

  @override
  void dispose() {
    _pageStateSubject.close();
    _routesSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    // TODO: implement updateState
  }

  void setKycViewModel(KycFinalViewModel viewModel) {
    _kycViewModel = viewModel;
  }

  void setContext(BuildContext context) {
    _context = context;
  }

  void next() {
    final state = _pageStateSubject.value;
    _routesSubject.add(
      AppRouteSpec(
        name: RoutesConstant.suiteableQuestion,
        arguments: {
          SuiteableQuestionFormeStateFields.userChoices: state.prefill,
          SuiteableQuestionPageStateFields.callback:
              (List<UserChoiceModel> data) {}
        },
      ),
    );
  }
}
