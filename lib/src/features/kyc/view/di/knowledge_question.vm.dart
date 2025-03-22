import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/data/local/json_data.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/knowledge_question.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_new.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/suiteable_question.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/model/knowledge_question.m.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:aconnec_1109_x/src/widgets/custom_radio_field.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';
import 'dart:math';

@Injectable()
class KnowledgeQuestionViewModel extends ViewModel {
  final KycFirebaseService _firebaseService;
  KnowledgeQuestionViewModel(this._firebaseService);

  final _stateSubject = BehaviorSubject<KnowledgeQuestionPageState>.seeded(
      KnowledgeQuestionPageState());

  Stream<KnowledgeQuestionPageState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final _formSubject = BehaviorSubject<KnowledgeQuestionFormState>.seeded(
      KnowledgeQuestionFormState());
  Stream<KnowledgeQuestionFormState> get formState => _formSubject;

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

  void listenFormstate() {
    _formSubject.listen((value) {
      KnowledgeQuestionFormStatePersistence().toJson(value);
    });
  }

  Future<List<KnowledgeQuestionModel>> loadKnowledge() async {
    final knowledge = await JsonData.loadKnowledgeQuestions();
    List<KnowledgeQuestionModel> questions = [];

    List<int> rBasicCrypto = [1, 2],
        rInvestment = [180, 181],
        rintervention = [160, 161],
        rLaw = [300, 301],
        rService = [330, 331];

    questions.addAll(knowledge.basicCrypto);
    questions.addAll(knowledge.investment);
    questions.addAll(knowledge.intervention);
    questions.addAll(knowledge.law);
    questions.addAll(knowledge.service);
    updateState({KnowledgeQuestionPageStateFields.questions: questions});
    return questions;
  }

  List<int> _generateRandomId(int min, int max) {
    List<int> generate = [];
    final random = Random();
    while (generate.length < 2) {
      final number = random.nextInt(max - min) + min;
      if (!generate.contains(number)) {
        generate.add(number);
      }
    }
    // print(generate);
    return generate;
  }

  void selectAnswer({String? id, String? answerId, int? point}) {
    final formState = _formSubject.value;
    var userChoices = formState.userChoices;
    var oldAnswer = userChoices.where((e) => e.questionId == id).toList();
    if (oldAnswer.isNotEmpty) {
      var newAnswer = List<UserChoiceModel>.from(userChoices);
      newAnswer = newAnswer.map(
        (e) {
          if (e.questionId == id) {
            final List<String> answer = [];

            answer.add(answerId ?? '0');

            e = e.copyWith({
              UserChoiceModelFields.questionId: id,
              UserChoiceModelFields.answerId: answer,
              UserChoiceModelFields.point: point
            });
          }
          return e;
        },
      ).toList();
      updateFormState(
        {KnowledgeQuestionFormStateFields.userChoices: newAnswer},
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
        {KnowledgeQuestionFormStateFields.userChoices: newAnswer},
      );
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
        final questions = state.questions
            .where((e) => e.id.toString() == questionId)
            .toList();
        if (questions.isNotEmpty) {
          final question = questions.first;
          final answers = [
            question.choice1,
            question.choice2,
            question.choice3,
          ];
          final answer = answers[int.parse(userChoice.answerId[0])];
          final selecteValue = RadioValue(
              title: answer, value: userChoice.answerId[0].toString());
          return selecteValue;
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  bool compareAnswer(int index, String answer) {
    if (answer == 'ก' && index == 0) {
      return true;
    }
    if (answer == 'ข' && index == 1) {
      return true;
    }
    if (answer == 'ค' && index == 2) {
      return true;
    }
    return false;
  }

  Future<void> onSubmit() async {
    final formState = _formSubject.value;
    if (formState.userChoices.length < 10) {
      return;
    }

    int score = 0;
    for (var e in formState.userChoices) {
      score = e.point + score;
    }

    final updateValue =
        formState.copyWith({KnowledgeQuestionFormStateFields.score: score});
    updateState({
      KnowledgeQuestionPageStateFields.isLoading: true,
    });
    try {
      await _firebaseService.saveKnowledgeAnswers(updateValue);
      final kycProgress = await _firebaseService.getKycProgress();
      final updateProgress = kycProgress.copyWith({
        KycFinalPageStateFields.secondStepProgress:
            KycPageNames.knowledgeTestResult.name,
      });
      await _firebaseService.setKycProgress(updateProgress)?.then((value) {
        Future.delayed(const Duration(seconds: 1), () {
          updateState({
            KnowledgeQuestionPageStateFields.isLoading: false,
          });
          _routesSubject.add(const AppRouteSpec.pop());
        });
      });
    } catch (e) {
      //Sentry.captureException(e);
      updateState({
        KnowledgeQuestionPageStateFields.isLoading: false,
      });
    }
  }
}
