enum EnumValidateTypes { isNotEmpty, isLaserIdCard, isEmail, isIdCard }

enum NdidType { public, agent, appman, counterService }

enum CurrencySwapType { thb, gasth }

enum TransactionStatus { pending, completed, cancel, incomplete, transfered }

enum ExchangeMode { buy, sell }

enum UserStatus { active, suspended, inactive, deleted }

enum ListFilter {
  all,
  pending,
  complete,
  canceled,
}

enum National {
  thai,
  foreigner,
}

enum UserType { individual, juristic }

enum SuiteableRisk { low, betweenLowMedium, betweenMediumHigh, high, veryHigh }

enum SuiteableRiskIWT {
  code10,
  code20,
  code30,
  code40,
  code50,
}

enum UserRiskType { low, medium, high }

// enum KycStatus {
//   unverified,
//   processing,
//   verified,
//   failed,
// }

enum KycStatus {
  unverified,
  step1Complete,
  step2Complete,
  step2HighRisk,
  step3NDID,
  step3Verified,
  step3NDIDFile,
}

enum KycPageNames {
  customerType,
  customerNational,
  fatca,
  kycTerm,
  kycTermSensitive,
  idUploadIntroduction,
  selfieIntroduction,
  personalInformation,
  personalCheck,
  address,
  occupation,
  suiteableTestIntroduction,
  sutieableTestResult,
  knowledgeTestIntroduction,
  knowledgeTestResult,
  ndidSelect,
  ndidTermAndCondition,
  ndidIntroduction,
  ndidSelectPayment,
  ndidPaymentResult,
  ndidSelectIdp,
  ndidWatingIdp,
  ndidResult,
  pdpa,
}

enum KycDocuments {
  frontIdCard,
  backIdCard,
  selfie,
  selfieWithId,
  anotherJobDoc,
  anotherJobDocAsset,
}

enum TransactionPaymentStatus { waiting, complete, cancel }

enum TransactionTradeStatus { initiate, waitingpayment, complete, cancel }

enum PaymentSide { buy, sell }

enum PaymentType { trade, ndidfee, refund }

enum PaymentChannel { qr, dd, dc }

enum OrderStatus {
  topay,
  toreceive,
  pending,
  completed,
  cancelled,
}

enum OrderTrxFiatStatus { init, customerPaid, completed }

enum OrderBuyPaymentChannel { qr, bank }

enum OrderSellPaymentChannel { bitgo, manual }

enum QrPaymentType { purefiat, trxfiat }

enum PureFiatType {
  ndid,
  trxfiat,
}
