import 'package:aconnec_1109_x/src/data/local/json_data.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/knowledge_question.st.dart';
import 'package:aconnec_1109_x/src/model/knowledge_question.m.dart';
import 'package:aconnec_1109_x/src/utilities/identity.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/constants/strings.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/knowledge_result.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_new.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/modals/view/kyc_under_review_modal_bottom_sheet.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

import 'package:url_launcher/url_launcher.dart';

@Injectable()
class KnowledgeResultViewModel extends ViewModel {
  final KycFirebaseService _firebaseService;
  KnowledgeResultViewModel(this._firebaseService);

  final _stateSubject = BehaviorSubject<KnowledgeResultPageState>.seeded(
      KnowledgeResultPageState());

  Stream<KnowledgeResultPageState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  late KycFinalViewModel _kycLevel2ViewModel;
  late BuildContext _context;

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

  void setKycViewModel(KycFinalViewModel kycLevel2ViewModel) {
    _kycLevel2ViewModel = kycLevel2ViewModel;
  }

  void setContext(BuildContext context) {
    _context = context;
  }

  Future<void> getKnowledgeAnswers() async {
    final answers = await _firebaseService.getKnowledgeAnswers();
    updateState({
      KnowledgeResultPageStateFields.score: answers.score,
    });
  }

  void gotoQuestions() {
    _routesSubject
        .add(const AppRouteSpec(name: RoutesConstant.knowledgeQuestion));
  }

  Future<void> next() async {
    try {
      _kycLevel2ViewModel
          .updateState({KycLevel2PageStateFields.isLoading: true});

      //set customer type
      final suiteableTestData = await _firebaseService.getSuiteableAnswers();
      final personalFundData = await _firebaseService.getFundFormState();
      final generalData = await _firebaseService.getKycGeneralData();
      final addressData = await _firebaseService.getAddressFormState();
      final currentAddressData =
          await _firebaseService.getCurrentAddressFormState();
      final workingAddressData =
          await _firebaseService.getWorkingAddressState();

      String riskType = '';
      int riskPoint = 0;

      // if (generalData.isThaiNationality &&
      //     generalData.userType == UserType.individual.name) {
      //   riskPoint = riskPoint + 1;
      // } else if (generalData.isThaiNationality == false &&
      //     generalData.userType == UserType.individual.name) {
      //   riskPoint = riskPoint + 3;
      // }

      //default thai national and individual user change it later
      riskPoint += 1;

      //Include suite test score
      riskPoint += suiteableTestData.score;

      //Include thailand
      riskPoint += 1;

      //Include danger zone
      if (UtilsIdentity.checkProvinceIsDangerZone(addressData!.province) ||
          UtilsIdentity.checkProvinceIsDangerZone(
              currentAddressData!.province) ||
          UtilsIdentity.checkProvinceIsDangerZone(
              workingAddressData!.province)) {
        riskPoint += 39;
      } else {
        riskPoint += 1;
      }

      //Include occupation score
      riskPoint += personalFundData.occupationScore;

      //Include politic status
      // int politicScore = 0;
      // for (final answer in personalFundData.politicAnswers) {
      //   politicScore += answer.point;
      // }

      // if (politicScore > 0) {
      //   riskPoint += 30;
      // }

      if (riskPoint >= 0 && riskPoint <= 8) {
        riskType = UserRiskType.low.name;
      } else if (riskPoint >= 9 && riskPoint <= 37) {
        riskType = UserRiskType.medium.name;
      } else if (riskPoint >= 38) {
        riskType = UserRiskType.high.name;
      }

      final updateGeneralData = generalData.copyWith(
        userRiskType: riskType,
        userRiskScore: riskPoint,
      );

      await _firebaseService.setKycGeneralData(updateGeneralData);

      final kycProgress = await _firebaseService.getKycProgress();
      final updateProgress = kycProgress.copyWith({
        KycFinalPageStateFields.currentStepIndex: 2,
        KycLevel2PageStateFields.thirdStepProgress:
            KycPageNames.ndidSelect.name,
      });

      await _firebaseService.setKycProgress(updateProgress);
      await _firebaseService.updateKycStatus(StaticValue.kycStep2HighRisk);
      _kycLevel2ViewModel
          .updateState({KycLevel2PageStateFields.isLoading: false});
      openBottomSheet();
    } catch (e) {
      //Sentry.captureException(e);
      _kycLevel2ViewModel
          .updateState({KycLevel2PageStateFields.isLoading: false});
    }
  }

  void openBottomSheet() {
    showUnderReviewModalBottomSheet(_context);
  }

  Future<void> openCryptoAcademyLink() async {
    final Uri url = Uri.parse('https://www.seccryptoacademy.com/');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> openSmartToInvestLink() async {
    final Uri url = Uri.parse('https://www.smarttoinvest.com/');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Future<List<Map<String, dynamic>>> loadKnowledge() async {
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

    final answer = await _firebaseService.getKnowledgeAnswers();
    // print(KnowledgeQuestionFormStatePersistence().toJson(answer));

    final List<Map<String, dynamic>> listFormatData = questions.map(
      (e) {
        final userAnswer = answer.userChoices
            .where((userAns) => userAns.questionId == e.id.toString())
            .first;
        final selectedAnswer = (userAnswer.answerId[0] == '0')
            ? e.choice1
            : userAnswer.answerId[0] == '1'
                ? e.choice2
                : e.choice3;
        final correctAnswer = (e.answer == 'ก')
            ? e.choice1
            : e.answer == 'ข'
                ? e.choice2
                : e.choice3;
        final Map<String, dynamic> newFormat = {
          'id': e.id,
          'question': e.question,
          'user_select': selectedAnswer,
          'correct_answer': correctAnswer,
          'choice1': e.choice1,
          'choice2': e.choice2,
          'choice3': e.choice3,
        };
        return newFormat;
      },
    ).toList();

    // print(listFormatData);

    return listFormatData;
  }
}
