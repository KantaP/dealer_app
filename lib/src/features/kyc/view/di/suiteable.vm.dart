import 'dart:async';

import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/constants/strings.dart';
import 'package:aconnec_1109_x/src/data/local/json_data.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/suiteable.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/suiteable_question.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/select_item.st.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

@Injectable()
class SuiteableViewModel extends ViewModel {
  final KycFirebaseService _firebaseService;
  SuiteableViewModel(this._firebaseService);

  final _stateSubject =
      BehaviorSubject<SuiteablePageState>.seeded(SuiteablePageState());

  Stream<SuiteablePageState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final choiceController = TextEditingController();

  late final KycFinalViewModel _kycViewModel;
  late StreamSubscription<DatabaseEvent> _databaseSubscriber;

  Map<String, List<String>> investAdvices = {
    SuiteableRisk.low.name: [
      S.current.suiteTestLowInvestContent1,
      S.current.suiteTestLowInvestContent2,
    ],
    SuiteableRisk.betweenLowMedium.name: [
      S.current.suiteTestMediumLowInvestContent1,
      S.current.suiteTestMediumLowInvestContent2,
    ],
    SuiteableRisk.betweenMediumHigh.name: [
      S.current.suiteTestHighMediumInvestContent1,
      S.current.suiteTestHighMediumInvestContent2,
    ],
    SuiteableRisk.high.name: [
      S.current.suiteTestHighInvestContent1,
      S.current.suiteTestHighInvestContent2,
    ],
    SuiteableRisk.veryHigh.name: [
      S.current.suiteTestVeryHighInvestContent1,
      S.current.suiteTestVeryHighInvestContent2,
    ]
  };

  @override
  void dispose() {
    _stateSubject.close();
    _routesSubject.close();
    _databaseSubscriber.cancel();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(
      state.copyWith(updateValue),
    );
  }

  void onSelectChoice() {
    _routesSubject.add(
      AppRouteSpec(
        name: RoutesConstant.selectItem,
        arguments: <String, dynamic>{
          SelectItemPageFields.pageTitle:
              S.current.kycSuiteableChoiceSelectHeadline,
          SelectItemPageFields.items: [
            S.current.kycSuiteableChoiceOption1,
            S.current.kycSuiteableChoiceOption2,
            S.current.kycSuiteableChoiceOption3,
            S.current.kycSuiteableChoiceOption4,
          ].map((e) => SelectItem(title: e, value: compareString(e))).toList(),
          SelectItemPageFields.onSelect: (SelectItem item) {
            choiceController.value = TextEditingValue(text: item.title);
            updateState({SuiteablePageStateFields.suiteableType: item.value});
            getPrefill(item.value);
          }
        },
      ),
    );
  }

  String compareString(String e) {
    if (e == S.current.kycSuiteableChoiceOption1) {
      //low
      return StaticValue.lowRisk;
    }
    if (e == S.current.kycSuiteableChoiceOption2) {
      //medium
      return StaticValue.mediumRisk;
    }
    if (e == S.current.kycSuiteableChoiceOption3) {
      //high
      return StaticValue.highRisk;
    }
    if (e == S.current.kycSuiteableChoiceOption4) {
      //very high
      return StaticValue.veryhighRisk;
    }
    return '';
  }

  void setKycViewModel(KycFinalViewModel viewModel) {
    _kycViewModel = viewModel;
  }

  void gotoQuestion() {
    final state = _stateSubject.value;
    _routesSubject.add(
      AppRouteSpec(
        name: RoutesConstant.suiteableQuestion,
        arguments: {
          SuiteableQuestionFormeStateFields.userChoices: state.prefill,
        },
      ),
    );
  }

  Future<void> next() async {
    final formState = _stateSubject.value;
    if (formState.suiteableType.isEmpty) {
      return;
    }
    final kycProgress = await _firebaseService.getKycProgress();
    final updateProgress = kycProgress.copyWith({
      KycLevel2PageStateFields.secondStepProgress:
          KycPageNames.knowledgeTestIntroduction.name,
    });

    await _firebaseService.setKycProgress(updateProgress);
  }

  Future<void> saveAnswers() async {}

  Future<void> getPrefill(String level) async {
    final prefills = await JsonData.loadSuiteablePrefills();
    final filter = prefills.where((e) => e.riskLevel == level).toList().first;
    int score = 0;
    for (final v in filter.userChoices) {
      score = score + v.point;
    }
    updateState({
      SuiteablePageStateFields.prefill: filter.userChoices,
      SuiteablePageStateFields.score: score,
    });
  }

  double calculateProgress() {
    final state = _stateSubject.value;
    return state.score / 100;
  }

  // void callbackFromQuestionPage(List<UserChoiceModel> userChoices) {
  //   int score = 0;
  //   for (final v in userChoices) {
  //     score = score + v.point;
  //   }
  //   String suiteableType = '';
  //   if (score < 10) {
  //     choiceController.value =
  //         TextEditingValue(text: S.current.kycSuiteableChoiceOption1);
  //     suiteableType = StaticValue.lowRisk;
  //   } else if (score >= 10 && score <= 15) {
  //     choiceController.value =
  //         TextEditingValue(text: S.current.kycSuiteableChoiceOption2);
  //     suiteableType = StaticValue.mediumRisk;
  //   } else if (score >= 16 && score <= 25) {
  //     choiceController.value =
  //         TextEditingValue(text: S.current.kycSuiteableChoiceOption3);
  //     suiteableType = StaticValue.highRisk;
  //   } else if (score > 25) {
  //     choiceController.value =
  //         TextEditingValue(text: S.current.kycSuiteableChoiceOption4);
  //     suiteableType = StaticValue.veryhighRisk;
  //   }

  //   updateState({
  //     SuiteablePageStateFields.prefill: userChoices,
  //     SuiteablePageStateFields.score: score,
  //     SuiteablePageStateFields.suiteableType: suiteableType
  //   });
  // }

  void onSuiteableTestValue() {
    _databaseSubscriber =
        _firebaseService.onSuiteableTestValue().listen((event) {
      final decode = Map<String, dynamic>.from(event.snapshot.value as dynamic);
      final result = SuiteablePageStatePersistence().fromJson(decode);

      updateState({
        SuiteablePageStateFields.prefill: result.prefill,
        SuiteablePageStateFields.score: result.score,
        SuiteablePageStateFields.suiteableType: result.suiteableType,
        SuiteablePageStateFields.iwtRiskId: result.iwtRiskId,
        SuiteablePageStateFields.iwtScore: result.iwtScore,
      });
    });
  }

  Future<void> getSuiteableResult() async {
    try {
      // _kycViewModel.updateState({KycFinalPageStateFields.isLoading: true});
      final result = await _firebaseService.getSuiteableAnswers();
      // _kycViewModel.updateState({KycFinalPageStateFields.isLoading: false});
      updateState({
        SuiteablePageStateFields.prefill: result.prefill,
        SuiteablePageStateFields.score: result.score,
        SuiteablePageStateFields.suiteableType: result.suiteableType,
        SuiteablePageStateFields.iwtRiskId: result.iwtRiskId,
        SuiteablePageStateFields.iwtScore: result.iwtScore,
      });
    } catch (e) {
      //Sentry.captureException(e);
    }
  }

  String choiceText(String choiceType) {
    if (choiceType == SuiteableRisk.low.name) {
      return S.current.riskLow;
    }
    if (choiceType == SuiteableRisk.betweenLowMedium.name) {
      return S.current.riskBetweenLowMedium;
    }
    if (choiceType == SuiteableRisk.betweenMediumHigh.name) {
      return S.current.riskBetweenMediumHigh;
    }
    if (choiceType == SuiteableRisk.high.name) {
      return S.current.riskHigh;
    }
    if (choiceType == SuiteableRisk.veryHigh.name) {
      return S.current.riskVeryHigh;
    }
    return '';
  }

  Color getProgressColor(String choiceType) {
    if (choiceType == SuiteableRisk.low.name) {
      return blueColor;
    }
    if (choiceType == SuiteableRisk.betweenLowMedium.name) {
      return yellowColor;
    }
    if (choiceType == SuiteableRisk.betweenMediumHigh.name) {
      return yellowColor;
    }
    if (choiceType == SuiteableRisk.high.name) {
      return redColor;
    }
    if (choiceType == SuiteableRisk.veryHigh.name) {
      return redColor;
    }
    return blueColor;
  }
}
