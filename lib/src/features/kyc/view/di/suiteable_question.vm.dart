import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/data/local/json_data.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_new.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/suiteable.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/suiteable_question.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/model/suiteable_select_list.m.dart';
import 'package:aconnec_1109_x/src/model/suiteable_question.m.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:aconnec_1109_x/src/widgets/custom_checkbox_field.dart';
import 'package:aconnec_1109_x/src/widgets/custom_radio_field.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/subjects.dart';

import '../../../utilities/model/select_item.st.dart';

@Injectable()
class SuiteableQuestionViewModel extends ViewModel {
  final KycFirebaseService _firebaseService;
  SuiteableQuestionViewModel(this._firebaseService);

  final _stateSubject = BehaviorSubject<SuiteableQuestionPageState>.seeded(
      SuiteableQuestionPageState());

  Stream<SuiteableQuestionPageState> get state => _stateSubject;

  final _formSubject = BehaviorSubject<SuiteableQuestionFormState>.seeded(
      SuiteableQuestionFormState());
  Stream<SuiteableQuestionFormState> get formState => _formSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final logger = Logger('suiteable question viewmodel logger');

  final controllers = [];
  //change later
  final sourceOfFundController = TextEditingController();

  @override
  void dispose() {
    _routesSubject.close();
    _stateSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(
      state.copyWith(updateValue),
    );
  }

  void updateFormState(Map<String, dynamic> updateValue) {
    final state = _formSubject.value;
    _formSubject.add(
      state.copyWith(updateValue),
    );
  }

  void listenState() {
    // _formSubject.listen((value) {
    //   final sourceOfFund = value.userChoices.where((e) => e.questionId == '13');
    //   if (sourceOfFund.isNotEmpty) {
    //     sourceOfFundController.value = TextEditingValue();
    //   }
    // });
  }

  Future<List<SuiteableQuestionModel>> loadQuestions() async {
    final questions = await JsonData.loadSuiteableQuestions();
    updateState({SuiteableQuestionPageStateFields.questions: questions});
    return questions;
  }

  void selectAnswer({String? id, String? answerId, int? point, String? type}) {
    final formState = _formSubject.value;
    var userChoices = formState.userChoices;
    // print(id);
    // print(point);
    var oldAnswer = userChoices.where((e) => e.questionId == id).toList();
    if (oldAnswer.isNotEmpty) {
      var newAnswer = List<UserChoiceModel>.from(userChoices);
      newAnswer = newAnswer.map(
        (e) {
          if (e.questionId == id) {
            final List<String> answer = [];
            int sumPoint = 0;
            if (type != 'checkbox') {
              answer.add(answerId ?? '');
              sumPoint = point ?? 0;
            } else {
              if (e.answerId.contains(answerId)) {
                //remove
                final List<String> removedAnswer =
                    e.answerId.where((e) => e != answerId).toList();
                answer.addAll([...removedAnswer]);
                sumPoint = e.point - (point ?? 0);
              } else {
                answer.addAll([...e.answerId, answerId ?? '']);
                sumPoint = e.point + (point ?? 0);
              }
            }
            e = e.copyWith({
              UserChoiceModelFields.answerId: answer,
              UserChoiceModelFields.point: sumPoint,
            });
            // print(e.point);
          }
          return e;
        },
      ).toList();
      updateFormState(
        {SuiteableQuestionFormeStateFields.userChoices: newAnswer},
      );
    } else {
      var newAnswer = List<UserChoiceModel>.from(userChoices);
      newAnswer.add(
        UserChoiceModel(
          questionId: id.toString(),
          answerId: [answerId ?? '0'],
          point: point ?? 0,
        ),
      );
      updateFormState(
        {SuiteableQuestionFormeStateFields.userChoices: newAnswer},
      );
    }
  }

  List<CheckboxValue>? generateCheckboxValue(String questionId) {
    try {
      final state = _stateSubject.value;
      final formState = _formSubject.value;
      final userChoices = formState.userChoices
          .where((e) => e.questionId == questionId)
          .toList();
      if (userChoices.isNotEmpty) {
        final userChoice = userChoices.first;
        final question =
            state.questions.where((e) => e.id == questionId).toList().first;

        final answers = question.answers
            .where((e) => userChoice.answerId.contains(e.id))
            .toList();
        final List<CheckboxValue> selecteValue = answers
            .map((e) => CheckboxValue(
                title: e.answer?.th ?? '',
                value: '${e.id.toString()}_${e.point.toString()}'))
            .toList();
        return selecteValue;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  RadioValue? generateRadioValue(String questionId) {
    try {
      final state = _stateSubject.value;
      final formState = _formSubject.value;
      final userChoices = formState.userChoices
          .where((e) => e.questionId == questionId)
          .toList();
      if (userChoices.isNotEmpty) {
        final userChoice = userChoices.first;
        final question =
            state.questions.where((e) => e.id == questionId).toList().first;
        // print('question: ${question.id}');
        // print('choice: ${userChoice.answerId[0]}');
        // print('answer list : ${question.answers}');
        final answer = question.answers
            .where((e) => e.id == userChoice.answerId[0])
            .toList()
            .first;
        // print('answer: ${answer.id}');
        final selecteValue = RadioValue(
            title: answer.answer?.th.toString() ?? '',
            value: '${answer.id.toString()}_${answer.point.toString()}');
        return selecteValue;
      }
      return null;
    } catch (e) {
      // print(e);
      return null;
    }
  }

  void callbackToSuiteablePage() {
    final formState = _formSubject.value;
    final state = _stateSubject.value;
    if (state.callback != null) {
      state.callback!.call(formState.userChoices);
    }
  }

  Future<void> onSelectItem(String questionId) async {
    final state = _stateSubject.value;
    List<SuiteableSelectListModel> sources =
        state.questions.where((e) => e.id == questionId).first.selectList;

    _routesSubject.add(
      AppRouteSpec(
        name: RoutesConstant.selectItem,
        arguments: <String, dynamic>{
          SelectItemPageFields.pageTitle:
              S.current.kycSuiteTestSelectSourceOfFundCountryPlaceholder,
          SelectItemPageFields.items: sources
              .map((e) => SelectItem(title: e.th, value: '${e.id}_${e.score}'))
              .toList(),
          SelectItemPageFields.onSelect: (SelectItem item) {
            if (questionId == '6') {
              sourceOfFundController.value = TextEditingValue(text: item.title);
              final splitData = item.value.toString().split('_');
              final score = splitData[1];
              final id = splitData[0];
              selectAnswer(
                id: questionId,
                answerId: id,
                point: int.parse(score),
              );
            }
          }
        },
      ),
    );
  }

  Future<void> submit() async {
    int score = 0;
    int iwtScore = 0;
    final pageState = _stateSubject.value;
    final formState = _formSubject.value;

    String riskType = '';
    String iwtRiskId = '';
    final nonIwtQuestions =
        pageState.questions.where((e) => e.isIWT == false).toList();
    final iwtQuestions =
        pageState.questions.where((e) => e.isIWT == true).toList();
    final nonIwtAnswer = formState.userChoices
        .where((e) =>
            nonIwtQuestions.indexWhere((e1) => e1.id == e.questionId) > -1)
        .toList();
    final iwtAnswer = formState.userChoices
        .where(
            (e) => iwtQuestions.indexWhere((e1) => e1.id == e.questionId) > -1)
        .toList();
    for (final v in nonIwtAnswer) {
      score = score + v.point;
    }
    for (final v in iwtAnswer) {
      iwtScore = iwtScore + v.point;
    }

    if (iwtScore < 10) {
      riskType = SuiteableRisk.low.name;
      iwtRiskId = SuiteableRiskIWT.code10.name.replaceAll('code', '');
    } else if (iwtScore > 10 && iwtScore <= 15) {
      riskType = SuiteableRisk.betweenLowMedium.name;
      iwtRiskId = SuiteableRiskIWT.code20.name.replaceAll('code', '');
    } else if (iwtScore > 15 && iwtScore <= 20) {
      riskType = SuiteableRisk.betweenMediumHigh.name;
      iwtRiskId = SuiteableRiskIWT.code30.name.replaceAll('code', '');
    } else if (iwtScore > 20 && iwtScore <= 25) {
      riskType = SuiteableRisk.high.name;
      iwtRiskId = SuiteableRiskIWT.code40.name.replaceAll('code', '');
    } else if (iwtScore > 25) {
      riskType = SuiteableRisk.veryHigh.name;
      iwtRiskId = SuiteableRiskIWT.code50.name.replaceAll('code', '');
    }

    // not use now
    // if (iwtScore < 10) {
    //   iwtRiskId = '10';
    // } else if (iwtScore >= 11 && iwtScore <= 20) {
    //   iwtRiskId = '20';
    // } else if (iwtScore >= 21 && iwtScore <= 30) {
    //   iwtRiskId = '30';
    // } else if (iwtScore >= 31 && iwtScore <= 40) {
    //   iwtRiskId = '40';
    // } else if (iwtScore > 40) {
    //   iwtRiskId = '50';
    // }

    final request = SuiteablePageState(
      score: score,
      suiteableType: riskType,
      prefill: formState.userChoices,
      iwtRiskId: iwtRiskId,
      iwtScore: iwtScore,
      // iwtRistId2: iwtRistId2,
    );

    // print(score);

    try {
      updateState({SuiteableQuestionPageStateFields.isLoading: true});

      await _firebaseService.saveSuiteableAnswer(request);

      final kycProgress = await _firebaseService.getKycProgress();
      final updateProgress = kycProgress.copyWith(
        {
          KycFinalPageStateFields.secondStepProgress:
              KycPageNames.sutieableTestResult.name,
        },
      );

      await _firebaseService.setKycProgress(updateProgress);
      updateState({SuiteableQuestionPageStateFields.isLoading: false});
      _routesSubject.add(const AppRouteSpec.pop());
    } catch (e) {
      //Sentry.captureException(e);
      updateState({SuiteableQuestionPageStateFields.isLoading: false});
    }
  }
}
