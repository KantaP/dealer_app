import 'package:aconnec_1109_x/src/constants/enums.dart';

class StaticValue {
  StaticValue._();

  static const String yes = 'yes';
  static const String no = 'no';
  static const String male = 'male';
  static const String female = 'female';
  static const String lgbtq = 'lgbtq';

  static const String lowRisk = 'low';
  static const String mediumRisk = 'medium';
  static const String highRisk = 'high';
  static const String veryhighRisk = 'very_high';

  static const int mockIdentifier = 1309913659936;

  static const String kycUnverified = '0';
  static const String kycIdcardWarning = '1-';
  static const String personalCheckComplete = '1';
  static const String kycStep2HighRisk = '2-';
  static const String notApprove = '2--';
  static const String semiVerified = '2';
  static const String kycStep3NDIDReview = '3-';
  static const String verified = '3';
  static const String kycStep3NDIDFail = '3--';

  static final kycPageIndex = <String, int>{
    //step 1
    KycPageNames.customerType.name: 1,
    KycPageNames.customerNational.name: 2,
    KycPageNames.fatca.name: 3,
    KycPageNames.kycTerm.name: 4,
    KycPageNames.pdpa.name: 5,
    KycPageNames.idUploadIntroduction.name: 6,
    KycPageNames.selfieIntroduction.name: 7,
    KycPageNames.personalInformation.name: 8,
    KycPageNames.personalCheck.name: 9,
    KycPageNames.address.name: 10,
    KycPageNames.occupation.name: 11,
    //end step 1
    //step 2
    KycPageNames.suiteableTestIntroduction.name: 12,
    KycPageNames.sutieableTestResult.name: 13,
    KycPageNames.knowledgeTestIntroduction.name: 14,
    KycPageNames.knowledgeTestResult.name: 15,
    //end step 2
    //step 3
    KycPageNames.ndidSelect.name: 16,
    KycPageNames.ndidTermAndCondition.name: 17,
    KycPageNames.ndidIntroduction.name: 18,
    KycPageNames.ndidSelectPayment.name: 19,
    KycPageNames.ndidPaymentResult.name: 20,
    KycPageNames.ndidSelectIdp.name: 21,
    KycPageNames.ndidWatingIdp.name: 22,
    KycPageNames.ndidResult.name: 23,
    //end step3
  };
}
