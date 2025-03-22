import 'dart:io';

import 'package:aconnec_1109_x/src/features/authenticate/service/di/authentication.firebase.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_rp_function/public_idp_param.m.dart';
import 'package:aconnec_1109_x/src/model/kyc_general_data.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/update_amlo_status_function/request_update_amlo_status.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/update_dopa_status_function/request_update_dopa_status.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/update_amlo_status_function/response_update_amlo_status.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/update_dopa_status_function/response_update_dopa_status.m.dart';
import 'package:aconnec_1109_x/src/model/realtime_database/dipchip.m.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/firebase_cloud_functions.dart';
import 'package:aconnec_1109_x/src/constants/firebase_exception.dart';
import 'package:aconnec_1109_x/src/constants/firebase_rt_db.dart';
import 'package:aconnec_1109_x/src/constants/firestore.dart';
import 'package:aconnec_1109_x/src/constants/strings.dart';
import 'package:aconnec_1109_x/src/data/network/firebase_client.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/accept_law.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/address.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/fund.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/information.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/knowledge_question.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc.st.dart';
// import 'package:aconnec_1109_x/src/features/kyc/model/kyc_general_data.m.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_level_1.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_new.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_term.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/ndid_term.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/suiteable.st.dart';
import 'package:aconnec_1109_x/src/model/document_detail.m.dart';
import 'package:aconnec_1109_x/src/model/document_detail.m.p.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_rp_function/response_ndid_ref.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_rp_function/public_idp_param.m.p.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_rp_function/request_rp_create.m.dart';
import 'package:aconnec_1109_x/src/model/user_profile.m.dart';
import 'package:aconnec_1109_x/src/model/user_profile.m.p.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_rp_function/utility_idp_identifier.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_rp_function/utility_idp_identifier.m.p.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@Singleton()
class KycFirebaseService {
  final FirebaseClient _firebaseClient;
  final logger = Logger('kyc_firebase');
  final AuthenticationFirebaseService _authenticationFirebaseService;
  KycFirebaseService(this._firebaseClient, this._authenticationFirebaseService);

  Future<void> saveInformationForm(KycInformationFormState state) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }

      final json = KycInformationFormStatePersistence().toJsonSecure(state);
      final updateJson = {
        ...json,
        'created_at': DateTime.now().toUtc().toString()
      };
      await _firebaseClient.setValue(
        FirebaseRealtimeDatabaseValue.idCardInformationPath(user.uid),
        updateJson,
      );

      //save to firestore
      CollectionReference idCardInformation = _firebaseClient
          .collectionRef(FireStoreValue.idCardInformationCollection);

      await idCardInformation.doc(user.uid).set({
        KycInformationFormStateFields.idCard:
            json[KycInformationFormStateFields.idCard]
      });

      return;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<void> saveAddressForm(KycAddressFormState state) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final json = KycAddressFormStatePersistence().toJson(state);
      final updateJson = {
        ...json,
        'created_at': DateTime.now().toUtc().toString()
      };
      await _firebaseClient.setValue(
        FirebaseRealtimeDatabaseValue.idCardAddressPath(user.uid),
        updateJson,
      );
      return;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<void> saveCurrentAddressForm(KycAddressFormState state) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final json = KycAddressFormStatePersistence().toJson(state);
      final updateJson = {
        ...json,
        'created_at': DateTime.now().toUtc().toString()
      };
      await _firebaseClient.setValue(
        FirebaseRealtimeDatabaseValue.currentAddressPath(user.uid),
        updateJson,
      );
      return;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<void> saveWorkingAddressForm(KycAddressFormState state) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final json = KycAddressFormStatePersistence().toJson(state);
      final updateJson = {
        ...json,
        'created_at': DateTime.now().toUtc().toString()
      };
      await _firebaseClient.setValue(
        FirebaseRealtimeDatabaseValue.workingAddressPath(user.uid),
        updateJson,
      );
      return;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<void> saveFundForm(KycFundFormState state) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final json = KycFundFormStatePersistence().toJson(state);
      final updateJson = {
        ...json,
        'created_at': DateTime.now().toUtc().toString()
      };
      await _firebaseClient.setValue(
        FirebaseRealtimeDatabaseValue.fundPath(user.uid),
        updateJson,
      );
      return;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<KycAddressFormState>? getAddressFormState() async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final snapshot = await _firebaseClient.getData(
        FirebaseRealtimeDatabaseValue.idCardAddressPath(user.uid),
      );
      final addressState = (snapshot.value != null)
          ? KycAddressFormStatePersistence()
              .fromJson(Map<String, dynamic>.from(snapshot.value as dynamic))
          : KycAddressFormState();
      return addressState;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<void>? setKycLevel2Progress(KycLevel2PageState state) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      await _firebaseClient.setValue(
        'kyc/${user.uid}/progress/level2',
        KycLevel2PageStatePersistence().toJson(state),
      );
      return;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<KycLevel2PageState> getKycLevel2Progress() async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final snapshot = await _firebaseClient.getData(
        'kyc/${user.uid}/progress/level2',
      );
      if (snapshot.value != null) {
        final kycState = KycLevel2PageStatePersistence()
            .fromJson(Map<String, dynamic>.from(snapshot.value as dynamic));
        return kycState;
      }
      return KycLevel2PageState();
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<void>? setKycLevel1Progress(KycLevel1PageState state) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      await _firebaseClient.setValue(
        'kyc/${user.uid}/progress/level1',
        KycLevel1PageStatePersistence().toJson(state),
      );
      return;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<KycLevel1PageState> getKycLevel1Progress() async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final snapshot = await _firebaseClient.getData(
        'kyc/${user.uid}/progress/level1',
      );
      if (snapshot.value != null) {
        final kycState = KycLevel1PageStatePersistence()
            .fromJson(Map<String, dynamic>.from(snapshot.value as dynamic));
        return kycState;
      }
      return KycLevel1PageState();
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<void>? saveKnowledgeAnswers(KnowledgeQuestionFormState state) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final answers = KnowledgeQuestionFormStatePersistence().toJson(state);
      final updateJson = {
        ...answers,
        'created_at': DateTime.now().toUtc().toString()
      };
      await _firebaseClient.setValue(
        FirebaseRealtimeDatabaseValue.assenmentKnowledge(user.uid),
        updateJson,
      );
      return;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<KnowledgeQuestionFormState> getKnowledgeAnswers() async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final snapshot = await _firebaseClient.getData(
        FirebaseRealtimeDatabaseValue.assenmentKnowledge(user.uid),
      );
      if (snapshot.value != null) {
        final answers = KnowledgeQuestionFormStatePersistence()
            .fromJson(Map<String, dynamic>.from(snapshot.value as dynamic));
        return answers;
      }
      return KnowledgeQuestionFormState();
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<void>? saveLawAcception(AcceptLawState state) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }

      final json = AcceptLawStatePersistence().toJson(state);
      final updateJson = {
        ...json,
        'created_at': DateTime.now().toUtc().toString()
      };
      await _firebaseClient.setValue(
        FirebaseRealtimeDatabaseValue.kycFatcaPath(user.uid),
        updateJson,
      );
      return;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Stream<DatabaseEvent> onKycLevel1Value() {
    return _firebaseClient.onKycLevel1Value();
  }

  Stream<DatabaseEvent> onKycLevel2Value() {
    return _firebaseClient.onKycLevel2Value();
  }

  Future<void>? saveSuiteableAnswer(SuiteablePageState state) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final answers = SuiteablePageStatePersistence().toJson(state);
      final updateJson = {
        ...answers,
        'created_at': DateTime.now().toUtc().toString()
      };
      await _firebaseClient.setValue(
        FirebaseRealtimeDatabaseValue.suiteablePath(user.uid),
        updateJson,
      );
      return;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<SuiteablePageState> getSuiteableAnswers() async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final snapshot = await _firebaseClient.getData(
        FirebaseRealtimeDatabaseValue.suiteablePath(user.uid),
      );
      if (snapshot.value != null) {
        print(snapshot.value);
        final answers = SuiteablePageStatePersistence()
            .fromJson(Map<String, dynamic>.from(snapshot.value as dynamic));
        return answers;
      }
      return SuiteablePageState();
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<String> uploadFile(String ref, File file, String fileName) async {
    final uploadRes = await _firebaseClient.uploadFile(ref, file, fileName);
    if (uploadRes.isNotEmpty) {
      return uploadRes;
    }
    return '';
  }

  Future<String> getDownloadURL(String ref, String fileName) async {
    final path = await _firebaseClient.getDownloadURL(ref, fileName);
    return path;
  }

  // Future<void> saveKycDocuments(KycDocumentsModel data) async {
  //   try {
  //     final user = _firebaseClient.currentUser();
  //     if (user == null) {
  //       throw Exception('user not found');
  //     }
  //     await _firebaseClient.setValue(
  //         FirebaseRealtimeDatabaseValue.personalDocument(user.uid),
  //         KycDocumentsModelPersistence().toJson(data));
  //   } on FirebaseException catch (e) {
  //     logger.warning('Failed with error code: ${e.code}');
  //     logger.warning(e.message);
  //     throw Exception(e.message);
  //   }
  // }

  // Future<KycDocumentsModel> getKycDocuments() async {
  //   try {
  //     final user = _firebaseClient.currentUser();
  //     if (user == null) {
  //       throw Exception('user not found');
  //     }
  //     final snapshot = await _firebaseClient
  //         .getData(FirebaseRealtimeDatabaseValue.personalDocument(user.uid));
  //     if (snapshot.value != null) {
  //       final paths = KycDocumentsModelPersistence()
  //           .fromJson(Map<String, dynamic>.from(snapshot.value as dynamic));
  //       return paths;
  //     }
  //     return KycDocumentsModel();
  //   } on FirebaseException catch (e) {
  //     logger.warning('Failed with error code: ${e.code}');
  //     logger.warning(e.message);
  //     throw Exception(e.message);
  //   }
  // }

  Future<bool> checkIdCard(String idCard) async {
    try {
      // print(idCard);
      final callable = _firebaseClient.httpsCallable(
          FirebaseCloundFunctionsValue.idCardCheck,
          region: FirebaseCloundFunctionsValue.asia1);
      final result = await callable.call(<String, dynamic>{
        'text': idCard,
      });
      // print(result.data);
      return result.data['checkResult'];
    } on FirebaseFunctionsException catch (e) {
      // print(e.code);
      // print(e.details);
      // print(e.message);
      throw Exception(e);
    }
  }

  Future<void> saveNdidTerm(NdidTermPageState data) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      await _firebaseClient.setValue(
        FirebaseRealtimeDatabaseValue.ndidTermPath(user.uid),
        NdidTermPageStatePersistence().toJson(data),
      );
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<KycAddressFormState>? getCurrentAddressFormState() async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final snapshot = await _firebaseClient.getData(
        FirebaseRealtimeDatabaseValue.currentAddressPath(user.uid),
      );
      final addressState = (snapshot.value != null)
          ? KycAddressFormStatePersistence()
              .fromJson(Map<String, dynamic>.from(snapshot.value as dynamic))
          : KycAddressFormState();
      return addressState;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<KycFundFormState> getFundFormState() async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final snapshot = await _firebaseClient.getData(
        FirebaseRealtimeDatabaseValue.fundPath(user.uid),
      );
      final fundState = (snapshot.value != null)
          ? KycFundFormStatePersistence()
              .fromJson(Map<String, dynamic>.from(snapshot.value as dynamic))
          : KycFundFormState();
      return fundState;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<KycAddressFormState>? getWorkingAddressState() async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final snapshot = await _firebaseClient.getData(
        FirebaseRealtimeDatabaseValue.workingAddressPath(user.uid),
      );
      final address = (snapshot.value != null)
          ? KycAddressFormStatePersistence()
              .fromJson(Map<String, dynamic>.from(snapshot.value as dynamic))
          : KycAddressFormState();
      return address;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<AcceptLawState>? getAcceptLawState() async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final snapshot = await _firebaseClient.getData(
        FirebaseRealtimeDatabaseValue.kycFatcaPath(user.uid),
      );
      final state = (snapshot.value != null)
          ? AcceptLawStatePersistence()
              .fromJson(Map<String, dynamic>.from(snapshot.value as dynamic))
          : AcceptLawState();
      return state;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Stream<DatabaseEvent> onIdCardAddressValue() {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      return _firebaseClient.onValueRef(
        FirebaseRealtimeDatabaseValue.idCardAddressPath(user.uid),
      );
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Stream<DatabaseEvent> onCurrentAddressValue() {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      return _firebaseClient.onValueRef(
        FirebaseRealtimeDatabaseValue.currentAddressPath(user.uid),
      );
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Stream<DatabaseEvent> onWorkingAddressValue() {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      return _firebaseClient.onValueRef(
        FirebaseRealtimeDatabaseValue.workingAddressPath(user.uid),
      );
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Stream<DatabaseEvent> onFundValue() {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      return _firebaseClient.onValueRef(
        FirebaseRealtimeDatabaseValue.fundPath(user.uid),
      );
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Stream<DatabaseEvent> onLawAcceptionValue() {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      return _firebaseClient.onValueRef(
        FirebaseRealtimeDatabaseValue.kycFatcaPath(user.uid),
      );
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<List<UtilityIdpIdentifierModel>> onCallUtilityPublicIdp({
    required PublicIdpParamModel params,
  }) async {
    try {
      final callable = _firebaseClient.httpsCallable(
          FirebaseCloundFunctionsValue.onCallRP,
          region: FirebaseCloundFunctionsValue.asia1);
      final result = await callable.call(<String, dynamic>{
        'name': FirebaseCloundFunctionsValue.rpUtilityListIdp,
        'params': PublicIdpParamModelPersistence().toJson(
          params,
        ),
      });

      if (result.data != null) {
        final listData = result.data as List;
        if (listData.isEmpty) {
          // print('empty list');
          return [];
        }
        final data =
            UtilityIdpIdentifierModelPersistence().fromArrayJson(listData);
        return data;
      }
      return [];
    } on FirebaseFunctionsException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<List<UtilityIdpIdentifierModel>> onCallUtilityAgentIdp({
    required PublicIdpParamModel params,
  }) async {
    try {
      final callable = _firebaseClient.httpsCallable(
          FirebaseCloundFunctionsValue.onCallRP,
          region: FirebaseCloundFunctionsValue.asia1);
      final json = <String, dynamic>{
        'name': FirebaseCloundFunctionsValue.rpUtilityListAgent,
        'params': PublicIdpParamModelPersistence().toJson(
          params,
        ),
      };
      final result = await callable.call(json);

      if (result.data != null) {
        final listData = result.data as List;
        // print(listData[0]);
        final data =
            UtilityIdpIdentifierModelPersistence().fromArrayJson(listData);
        return data;
      }
      return [];
    } on FirebaseFunctionsException catch (e) {
      print(e);
      throw Exception(e.message);
    }
  }

  Future<void> updateKycLevel(int level) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final snapshot = await _firebaseClient
          .getData(FirebaseRealtimeDatabaseValue.userData(user.uid));

      if (snapshot.value != null) {
        final data = UserProfileModelPersistence().fromJson(
          Map<String, dynamic>.from(snapshot.value as dynamic),
        );
        final updateData = data.copyWith({
          UserProfileModelFields.kycLevel: level,
        });
        final json = UserProfileModelPersistence().toJson(updateData);
        // print(json);
        return _firebaseClient.setValue(
          FirebaseRealtimeDatabaseValue.userData(user.uid),
          json,
        );
      } else {
        throw Exception('user not found');
      }
    } on FirebaseAuthException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e);
    }
  }

  Future<NdidRefResponseModel> onCallPublicCreateRequest({
    required RpCreateRequestModel params,
  }) async {
    try {
      final json = RpCreateRequestModelPersistence().toJson(params);

      final callable = _firebaseClient.httpsCallable(
          FirebaseCloundFunctionsValue.onCallRP,
          region: FirebaseCloundFunctionsValue.asia1);
      final result = await callable.call(<String, dynamic>{
        'name': FirebaseCloundFunctionsValue.rpPublicCreateReqeust,
        'params': json,
      });

      if (result.data != null) {
        // print(result.data);
        final data = NdidRefResponseModelPersistence()
            .fromJson(Map<String, dynamic>.from(result.data));
        return data;
      }
      return NdidRefResponseModel();
    } on FirebaseFunctionsException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<NdidRefResponseModel> onCallAgentCreateRequest({
    required RpCreateRequestModel params,
  }) async {
    try {
      final callable = _firebaseClient.httpsCallable(
          FirebaseCloundFunctionsValue.onCallRP,
          region: FirebaseCloundFunctionsValue.asia1);
      final result = await callable.call(<String, dynamic>{
        'name': FirebaseCloundFunctionsValue.rpAgentCreateReqeust,
        'params': RpCreateRequestModelPersistence().toJson(params),
      });

      if (result.data != null) {
        final data = NdidRefResponseModelPersistence()
            .fromJson(Map<String, dynamic>.from(result.data));
        return data;
      }
      return NdidRefResponseModel();
    } on FirebaseFunctionsException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> onCallPublicCancelRequest({
    required String requestId,
  }) async {
    try {
      final callable = _firebaseClient.httpsCallable(
          FirebaseCloundFunctionsValue.onCallRP,
          region: FirebaseCloundFunctionsValue.asia1);
      final result = await callable.call(<String, dynamic>{
        'name': FirebaseCloundFunctionsValue.rpPublicCloseRequest,
        'params': {'request_id': requestId},
      });

      if (result.data != null) {
        // print(result.data);
      }
      // return NdidRefResponseModel();
      return;
    } on FirebaseFunctionsException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> onCallAgentCancelRequest({
    required String requestId,
  }) async {
    try {
      final callable = _firebaseClient.httpsCallable(
          FirebaseCloundFunctionsValue.onCallRP,
          region: FirebaseCloundFunctionsValue.asia1);
      final result = await callable.call(<String, dynamic>{
        'name': FirebaseCloundFunctionsValue.rpAgentCloseRequest,
        'params': {'request_id': requestId},
      });

      if (result.data != null) {
        // print(result.data);
      }
      // return NdidRefResponseModel();
      return;
    } on FirebaseFunctionsException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<NdidRefResponseModel> saveTrackNdidRef(
      NdidRefResponseModel data) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final json = NdidRefResponseModelPersistence().toJson(data);
      final updateJson = {
        ...json,
        'created_at': DateTime.now().toUtc().toString()
      };
      await _firebaseClient.setValue(
        FirebaseRealtimeDatabaseValue.ndidRefResponsePath(user.uid),
        updateJson,
      );
      return NdidRefResponseModelPersistence().fromJson(updateJson);
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<NdidRefResponseModel> getTrackNdidRef() async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final snapshot = await _firebaseClient.getData(
        FirebaseRealtimeDatabaseValue.ndidRefResponsePath(user.uid),
      );
      final state = (snapshot.value != null)
          ? NdidRefResponseModelPersistence()
              .fromJson(Map<String, dynamic>.from(snapshot.value as dynamic))
          : NdidRefResponseModel();
      return state;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<DipchipModel> getDipchipTracking() async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final snapshot = await _firebaseClient.getData(
        FirebaseRealtimeDatabaseValue.dipchipResponsePath(user.uid),
      );
      final state = (snapshot.value != null)
          ? DipchipModel.fromJson(
              Map<String, dynamic>.from(snapshot.value as dynamic))
          : DipchipModel();
      return state;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Stream<DatabaseEvent> onValueRef(String path) {
    return _firebaseClient.onValueRef(path);
  }

  Future<void> completeKyc() async {
    final user = _firebaseClient.currentUser();
    if (user == null) {
      throw Exception('user not found');
    }
    final userData = await _firebaseClient.getData(
      FirebaseRealtimeDatabaseValue.userData(user.uid),
    );
    if (userData.value != null) {
      final user = UserProfileModelPersistence()
          .fromJson(Map<String, dynamic>.from(userData.value as dynamic));

      final update = user.copyWith({
        UserProfileModelFields.kycLevel: 2,
        UserProfileModelFields.kycStatus: StaticValue.verified
      });
      final updateJson = UserProfileModelPersistence().toJson(update);
      try {
        await _firebaseClient.setValue(
            FirebaseRealtimeDatabaseValue.userData(user.uid), updateJson);
        return;
      } on FirebaseException catch (e) {
        logger.warning('Failed with error code: ${e.code}');
        logger.warning(e.message);
        throw Exception(e.message);
      }
    }
    throw Exception('user not found');
  }

  Future<void> completeKycLevel1() async {
    final user = _firebaseClient.currentUser();
    if (user == null) {
      throw Exception('user not found');
    }
    final userData = await _firebaseClient.getData(
      FirebaseRealtimeDatabaseValue.userData(user.uid),
    );
    if (userData.value != null) {
      final user = UserProfileModelPersistence()
          .fromJson(Map<String, dynamic>.from(userData.value as dynamic));

      final update = user.copyWith({UserProfileModelFields.kycLevel: 1});
      final updateJson = UserProfileModelPersistence().toJson(update);
      try {
        await _firebaseClient.setValue(
            FirebaseRealtimeDatabaseValue.userData(user.uid), updateJson);
        return;
      } on FirebaseException catch (e) {
        logger.warning('Failed with error code: ${e.code}');
        logger.warning(e.message);
        throw Exception(e.message);
      }
    }
    throw Exception('user not found');
  }

  Future<void> resetNdidAttempt() async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      await _firebaseClient.setValue(
        FirebaseRealtimeDatabaseValue.ndidAttempt(user.uid),
        {'count': 0},
      );

      return;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<void> addNdidAttempt() async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final oldValue = await _firebaseClient
          .getData(FirebaseRealtimeDatabaseValue.ndidAttempt(user.uid));
      if (oldValue.value == null) {
        //first time attempt
        await _firebaseClient.setValue(
          FirebaseRealtimeDatabaseValue.ndidAttempt(user.uid),
          {'count': 1},
        );
      } else {
        final oldCount = Map<String, dynamic>.from(oldValue.value as dynamic);
        const newConnt = 0;
        if (oldCount['count'] == 2) {
          throw Exception(FirebaseExceptionCode.ndidReachToLimit);
        }
        final newCount = oldCount['count'] + 1;
        await _firebaseClient.setValue(
          FirebaseRealtimeDatabaseValue.ndidAttempt(user.uid),
          {'count': newCount},
        );
      }

      return;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<int> getNdidAttempt() async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final oldValue = await _firebaseClient
          .getData(FirebaseRealtimeDatabaseValue.ndidAttempt(user.uid));
      if (oldValue.exists) {
        final json = Map<String, dynamic>.from(oldValue.value as dynamic);
        return json['count'] ?? 0;
      }
      return 0;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Stream<DatabaseEvent> onNdidRefResponse() {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      return _firebaseClient.onValueRef(
        FirebaseRealtimeDatabaseValue.ndidRefResponsePath(user.uid),
      );
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Stream<DatabaseEvent> onDipchipResponse() {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      return _firebaseClient.onValueRef(
        FirebaseRealtimeDatabaseValue.dipchipResponsePath(user.uid),
      );
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<void>? setKycProgress(KycFinalPageState state) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }

      await _firebaseClient.setValue(
        FirebaseRealtimeDatabaseValue.kycProgress(user.uid),
        KycFinalPageStatePersistence().toJson(state),
      );
      return;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<KycFinalPageState> getKycProgress() async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final snapshot = await _firebaseClient.getData(
        FirebaseRealtimeDatabaseValue.kycProgress(user.uid),
      );
      if (snapshot.value != null) {
        final kycState = KycFinalPageStatePersistence()
            .fromJson(Map<String, dynamic>.from(snapshot.value as dynamic));
        return kycState;
      }
      return KycFinalPageState();
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  // Future<void>? saveKycData(Map<String, dynamic> data) async {
  //   try {
  //     final user = _firebaseClient.currentUser();
  //     if (user == null) {
  //       throw Exception('user not found');
  //     }
  //     await _firebaseClient.setValue(
  //       FirebaseRealtimeDatabaseValue.kycData(user.uid),
  //       data,
  //     );
  //     return;
  //   } on FirebaseException catch (e) {
  //     logger.warning('Failed with error code: ${e.code}');
  //     logger.warning(e.message);
  //     throw Exception(e.message);
  //   }
  // }

  Future<void>? setKycGeneralData(KycGeneralDataModel data) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      await _firebaseClient.setValue(
        FirebaseRealtimeDatabaseValue.kycGeneralData(user.uid),
        data.toJson(),
      );
      return;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<KycGeneralDataModel> getKycGeneralData() async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final snapshot = await _firebaseClient.getData(
        FirebaseRealtimeDatabaseValue.kycGeneralData(user.uid),
      );
      final generalData = (snapshot.value != null)
          ? KycGeneralDataModel.fromJson(
              Map<String, dynamic>.from(snapshot.value as dynamic))
          : const KycGeneralDataModel();
      return generalData;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Stream<DatabaseEvent> onKycProgress() {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      return _firebaseClient.onValueRef(
        FirebaseRealtimeDatabaseValue.kycProgress(user.uid),
      );
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<void> saveKycTerm(KycTermPageState state) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final json = KycTermPageStatePersistence().toJson(state);
      final updateJson = {
        ...json,
        'created_at': DateTime.now().toUtc().toString()
      };
      await _firebaseClient.setValue(
        FirebaseRealtimeDatabaseValue.kycTermPath(user.uid),
        updateJson,
      );
      return;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<KycTermPageState> getKycTerm() async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }

      final snapshot = await _firebaseClient.getData(
        FirebaseRealtimeDatabaseValue.kycTermPath(user.uid),
      );

      final state = (snapshot.value != null)
          ? KycTermPageStatePersistence()
              .fromJson(Map<String, dynamic>.from(snapshot.value as dynamic))
          : KycTermPageState();
      return state;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Stream<DatabaseEvent> onSuiteableTestValue() {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      return _firebaseClient.onValueRef(
        FirebaseRealtimeDatabaseValue.suiteablePath(user.uid),
      );
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<void> updateKycStatus(String kycStatus) async {
    final user = _firebaseClient.currentUser();
    if (user == null) {
      throw Exception('user not found');
    }
    final userData = await _firebaseClient.getData(
      FirebaseRealtimeDatabaseValue.userData(user.uid),
    );
    if (userData.value != null) {
      final user = UserProfileModelPersistence()
          .fromJson(Map<String, dynamic>.from(userData.value as dynamic));

      final update =
          user.copyWith({UserProfileModelFields.kycStatus: kycStatus});
      final updateJson = UserProfileModelPersistence().toJson(update);
      try {
        await _firebaseClient.setValue(
            FirebaseRealtimeDatabaseValue.userData(user.uid), updateJson);
        return;
      } on FirebaseException catch (e) {
        logger.warning('Failed with error code: ${e.code}');
        logger.warning(e.message);
        throw Exception(e.message);
      }
    }
    throw Exception('user not found');
  }

  Future<void> saveKycDocument(
    String docType,
    String docPath,
  ) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      String path = '';
      if (docType == KycDocuments.frontIdCard.name) {
        path = FirebaseRealtimeDatabaseValue.kycFrontIdCard(user.uid);
      }
      if (docType == KycDocuments.backIdCard.name) {
        path = FirebaseRealtimeDatabaseValue.kycBackIdCard(user.uid);
      }
      if (docType == KycDocuments.selfie.name) {
        path = FirebaseRealtimeDatabaseValue.kycSelfie(user.uid);
      }
      if (docType == KycDocuments.selfieWithId.name) {
        path = FirebaseRealtimeDatabaseValue.kycSelfieWithId(user.uid);
      }
      if (docType == KycDocuments.anotherJobDoc.name) {
        path = FirebaseRealtimeDatabaseValue.kycAnotherJobDoc(user.uid);
      }
      if (docType == KycDocuments.anotherJobDocAsset.name) {
        path = FirebaseRealtimeDatabaseValue.kycAnotherJobDocAsset(user.uid);
      }
      await _firebaseClient.setValue(
        path,
        DocumentDetailModelPersistence().toJson(
          DocumentDetailModel(
            path: docPath,
            createdAt: DateTime.now().toUtc().toString(),
          ),
        ),
      );
      return;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<ResponseUpdateDopaStatusResult> updateDopaStatus({
    required RequestUpdateDopaStatusModel request,
  }) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final callable = _firebaseClient.httpsCallable(
          FirebaseCloundFunctionsValue.updateDopaStatus,
          region: FirebaseCloundFunctionsValue.asia2);
      final updateRequest = request.copyWith(uid: user.uid);
      print(updateRequest);
      final result = await callable.call(updateRequest.toJson());
      // print(updateRequest.toJson());
      if (result.data != null) {
        print(result.data);
        final response = ResponseUpdateDopaStatusResult.fromJson(result.data);

        return response;
      }
      return const ResponseUpdateDopaStatusResult();
    } on FirebaseFunctionsException catch (e) {
      print(e);
      throw Exception(e.message);
    }
  }

  Future<KycInformationFormState>? getIdCardInformation() async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final snapshot = await _firebaseClient.getData(
        FirebaseRealtimeDatabaseValue.idCardInformationPath(user.uid),
      );
      final state = (snapshot.value != null)
          ? KycInformationFormStatePersistence()
              .fromJson(Map<String, dynamic>.from(snapshot.value as dynamic))
          : KycInformationFormState();

      return state;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<void> rejectKyc({String kycStatus = StaticValue.kycUnverified}) async {
    final user = _firebaseClient.currentUser();
    if (user == null) {
      throw Exception('user not found');
    }
    final userData = await _firebaseClient.getData(
      FirebaseRealtimeDatabaseValue.userData(user.uid),
    );
    if (userData.value != null) {
      final user = UserProfileModelPersistence()
          .fromJson(Map<String, dynamic>.from(userData.value as dynamic));

      final update = user.copyWith({
        UserProfileModelFields.kycLevel: 99,
        UserProfileModelFields.kycStatus: kycStatus
      });
      final updateJson = UserProfileModelPersistence().toJson(update);
      try {
        await _firebaseClient.setValue(
            FirebaseRealtimeDatabaseValue.userData(user.uid), updateJson);
        return;
      } on FirebaseException catch (e) {
        logger.warning('Failed with error code: ${e.code}');
        logger.warning(e.message);
        throw Exception(e.message);
      }
    }
    throw Exception('user not found');
  }

  Future<bool> checkAmlo() async {
    try {
      final userData = await _authenticationFirebaseService.getCurrentUser();

      return true;
    } on FirebaseFunctionsException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<ResponseUpdateAmloStatusModel> updateAmloStatus({
    required RequestUpdateAmloStatusModel request,
  }) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final callable = _firebaseClient.httpsCallable(
          FirebaseCloundFunctionsValue.updateAmloStatus,
          region: FirebaseCloundFunctionsValue.asia2);
      final updateRequest = request.copyWith(uid: user.uid);
      final result = await callable.call(updateRequest.toJson());

      if (result.data != null) {
        final response = ResponseUpdateAmloStatusModel.fromJson(result.data);
        // if (response.status == false) {
        //   await _authenticationFirebaseService.suspend();
        // }
        return response;
      }
      return const ResponseUpdateAmloStatusModel(
        status: false,
        message: 'api_failed',
        code: 99,
      );
    } on FirebaseFunctionsException catch (e) {
      throw Exception(e.message);
    }
  }
}
