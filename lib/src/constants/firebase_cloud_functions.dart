class FirebaseCloundFunctionsValue {
  FirebaseCloundFunctionsValue._();
  static const String asia1 = 'asia-southeast1';
  static const String asia2 = 'asia-southeast2';

  static const String idCardCheck = 'onCallCheckIdCard';
  static const String onCallRP = 'onCallRP';
  static const String onCallBank = 'onCallBank';

  static const String rpPublicIdp = 'public.list';
  static const String rpAgentIdp = 'agent.list';
  static const String rpPublicCreateReqeust = 'public.create_request';
  static const String rpAgentCreateReqeust = 'agent.create_request';
  static const String rpUtilityListPublic = 'utility.public_idp';
  static const String rpUtilityListIdp = 'utility.list_idp';
  static const String rpUtilityListAgent = 'utility.agent_idp';
  static const String rpUtilityListAS = 'utility.list_as';
  static const String rpPublicCloseRequest = 'public.close_request';
  static const String rpAgentCloseRequest = 'agent.close_request';

  static const String bayQrRequest = 'bay.qr_request';

  static const String updateAmloStatus = 'updateAmloStatusV2';
  static const String updateDopaStatus = 'updateDopaStatusV2';
  static const String onCallCheckPin = 'onCallCheckPin';
  static const String onCallSetPin = 'onCallSetPin';

  static const String orderFunction = 'onCallOrder';
  static const String orderCreate = 'create';
  static const String orderCreateHotFix = 'create_hot_fix';
  static const String orderCheck = 'check';
  static const String orderGet = 'get';
  static const String orderCancel = 'cancel';
  static const String orderToPending = 'pending';
  static const String orderToReceive = 'toreceive';
  static const String orderFinish = 'finish';
  static const String orderFull = 'full_byuser';
  static const String orderList = 'list_byuser';
  static const String orderListWithFields = 'list_byuser_with_fields';
  static const String getSpendToday = 'get_spend_today';

  static const String trxFiatFunction = 'onCallTrxFiat';
  static const String trxFiatCreate = 'create';
  static const String trxFiatProof = 'proof';

  static const String trxDigitalAssetFunction = 'onCallTrxDigitalasset';
  static const String trxDigitalAssetCreate = 'create';

  static const String bitgoFunction = 'onCallBitgo';
  static const String bitgoDepositAddress = 'get_deposit_wallet';

  static const String listingFunction = 'onCallListing';
  static const String listingGetList = 'list';

  static const String onCallPredataSensitive = 'onPredataUserSensitive';
  static const String onCallAuth = 'onCallAuth';
  static const String authCheck = 'check';

  static const String onCallPureFiat = 'onCallPureFiat';
  static const String pureFiatCreate = 'created';
  static const String pureFiatOpenCheck = 'check';
  static const String pureFiatCancel = 'cancel';
}
