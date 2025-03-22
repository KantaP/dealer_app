import 'package:aconnec_1109_x/src/constants/enums.dart';

class KycIndex {
  KycIndex._();
  static final pages = <String, int>{
    //step 1
    KycPageNames.customerType.name: 0,
    KycPageNames.customerNational.name: 1,
    KycPageNames.fatca.name: 2,
    KycPageNames.kycTerm.name: 3,
    KycPageNames.pdpa.name: 4,
    KycPageNames.idUploadIntroduction.name: 5,
    KycPageNames.selfieIntroduction.name: 6,
    KycPageNames.personalInformation.name: 7,
    KycPageNames.personalCheck.name: 8,
    KycPageNames.address.name: 9,
    KycPageNames.occupation.name: 10,
    //end step 1
    //step 2
    KycPageNames.suiteableTestIntroduction.name: 11,
    KycPageNames.sutieableTestResult.name: 12,
    KycPageNames.knowledgeTestIntroduction.name: 13,
    KycPageNames.knowledgeTestResult.name: 14,
    //end step 2
    //step 3
    KycPageNames.ndidSelect.name: 15,
    KycPageNames.ndidTermAndCondition.name: 16,
    KycPageNames.ndidIntroduction.name: 17,
    KycPageNames.ndidSelectPayment.name: 18,
    KycPageNames.ndidPaymentResult.name: 19,
    KycPageNames.ndidSelectIdp.name: 20,
    KycPageNames.ndidWatingIdp.name: 21,
    KycPageNames.ndidResult.name: 22,
    //end step3
  };
}
