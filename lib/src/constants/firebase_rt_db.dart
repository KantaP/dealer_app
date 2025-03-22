class FirebaseRealtimeDatabaseValue {
  FirebaseRealtimeDatabaseValue._();

  static String userData(String userId) => 'user/$userId/profile';
  static String userProfileData(String userId) => 'user/$userId/profile';

  static String idCardInformationPath(String userId) =>
      'user/$userId/kyc/personal_information';

  static String idCardAddressPath(String userId) =>
      'user/$userId/kyc/address_id_card';
  static String currentAddressPath(String userId) =>
      'user/$userId/kyc/address_current';
  static String workingAddressPath(String userId) =>
      'user/$userId/kyc/address_working';
  static String fundPath(String userId) => 'user/$userId/kyc/personal_fund';
  static String kycFatcaPath(String userId) => 'user/$userId/kyc/fatca_usa';
  static String kycTermPath(String userId) => 'user/$userId/kyc/term';
  static String ndidTermPath(String userId) => 'user/$userId/ndid/term_accept';

  static String suiteablePath(String userId) =>
      'user/$userId/kyc/assessment_suiteable';

  static String ndidRefResponsePath(String userId) =>
      'user/$userId/ndid/ndid_ref_response';

  static String dipchipResponsePath(String userId) => 'user/$userId/dipchip';

  static String ndidAttempt(String userId) => 'user/$userId/ndid/attempt_count';
  static String bankAccountPath(String userId) =>
      'user/$userId/profile/bank_accounts';
  static String bankAccountPathWithOutId(int selectedBankIndex) =>
      'profile/bank_accounts/$selectedBankIndex';

  static String transactionPaymentTracking(String userId) =>
      'transaction/$userId/payment';

  static String orderCancelReasonPath(String userId) =>
      'transaction/$userId/orderCancelReason';

  static String assenmentKnowledge(String userId) =>
      'user/$userId/kyc/assessment_knowledge';

  static String personalDocument(String userId) => 'user/$userId/kyc/documents';

  static String kycProgress(String userId) => 'user/$userId/kyc/progress';
  static String kycData(String userId) => 'user/$userId/kyc';

  static String kycUserType(String userId) => 'user/$userId/user_type';
  static String kycIsNational(String userId) =>
      'user/$userId/is_thai_nationality';

  static String kycGeneralData(String userId) =>
      'user/$userId/kyc/general_data';

  static String kycFrontIdCard(String userId) =>
      'user/$userId/kyc/kyc_document/front_id_card';
  static String kycBackIdCard(String userId) =>
      'user/$userId/kyc/kyc_document/back_id_card';
  static String kycSelfie(String userId) =>
      'user/$userId/kyc/kyc_document/selfie';
  static String kycSelfieWithId(String userId) =>
      'user/$userId/kyc/kyc_document/selfie_with_id';
  static String kycAnotherJobDoc(String userId) =>
      'user/$userId/kyc/kyc_document/another_job_doc';
  static String kycAnotherJobDocAsset(String userId) =>
      'user/$userId/kyc/kyc_document/another_job_doc_asset';

  static String userTradeTransaction(String userId, String ref) =>
      'user/$userId/transaction/$ref';

  static String coinPricePath(int coinId) => 'listing/$coinId';
}
