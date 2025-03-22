import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:aconnec_1109_x/src/constants/firebase_cloud_functions.dart';
import 'package:aconnec_1109_x/src/data/network/firebase_client.dart';
import 'package:aconnec_1109_x/src/data/repositories/ndidService.repo.dart';
import 'package:aconnec_1109_x/src/model/idp.m.dart';
import 'package:aconnec_1109_x/src/model/idp.m.p.dart';
import 'package:aconnec_1109_x/src/model/idp_as.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_rp_function/utility_idp_identifier.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_rp_function/utility_idp_identifier.m.p.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_rp_function/utility_list_as_param.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_rp_function/utility_list_as_param.m.p.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@Singleton()
class SplashScreenFirebaseService {
  final FirebaseClient _firebaseClient;
  final logger = Logger('auth.firebase');
  final NdidServiceRepository _ndidServiceRepository;
  SplashScreenFirebaseService(
      this._firebaseClient, this._ndidServiceRepository);

  User? currentUser() {
    return _firebaseClient.currentUser();
  }

  Future<List<IdpModel>> onCallRPPublicIdp() async {
    try {
      final callable = _firebaseClient.httpsCallable(
          FirebaseCloundFunctionsValue.onCallRP,
          region: FirebaseCloundFunctionsValue.asia1);
      final result = await callable.call(<String, dynamic>{
        'name': FirebaseCloundFunctionsValue.rpPublicIdp,
        'params': {}
      });
      if (result.data != null && result.data['data'] != null) {
        // print(result.data['data']);
        final data =
            IdpModelPersistence().fromArrayJson(result.data['data'] as List);
        return data;
      }
      return [];
    } on FirebaseFunctionsException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<List<IdpModel>> onCallRPAgentdp() async {
    try {
      final callable = _firebaseClient.httpsCallable(
          FirebaseCloundFunctionsValue.onCallRP,
          region: FirebaseCloundFunctionsValue.asia1);
      final result = await callable.call(<String, dynamic>{
        'name': FirebaseCloundFunctionsValue.rpAgentIdp,
        'params': {}
      });
      if (result.data != null && result.data['data'] != null) {
        final data =
            IdpModelPersistence().fromArrayJson(result.data['data'] as List);
        return data;
      }
      return [];
    } on FirebaseFunctionsException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<List<IdpAsModel>> onCallRpIdpAs() async {
    try {
      final callable = _firebaseClient.httpsCallable(
          FirebaseCloundFunctionsValue.onCallRP,
          region: FirebaseCloundFunctionsValue.asia1);
      final result = await callable.call(<String, dynamic>{
        'name': FirebaseCloundFunctionsValue.rpUtilityListAS,
        'params': UtilityListAsParamPersistence().toJson(
            UtilityListAsParam(serviceId: _ndidServiceRepository.serviceId01))
      });

      if (result.data != null) {
        final listData = result.data as List;
        // print(listData.length);
        final data = IdpAsModelPersistence().fromArrayJson(listData);

        return data;
      }
      return [];
    } on FirebaseFunctionsException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<List<IdpAsModel>> onCallRpAgentAs() async {
    try {
      final callable = _firebaseClient.httpsCallable(
          FirebaseCloundFunctionsValue.onCallRP,
          region: FirebaseCloundFunctionsValue.asia1);
      final result = await callable.call(<String, dynamic>{
        'name': FirebaseCloundFunctionsValue.rpUtilityListAS,
        'params': UtilityListAsParamPersistence().toJson(
            UtilityListAsParam(serviceId: _ndidServiceRepository.serviceId02))
      });

      if (result.data != null) {
        final listData = result.data as List;

        final data = IdpAsModelPersistence().fromArrayJson(listData);
        return data;
      }
      return [];
    } on FirebaseFunctionsException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<List<UtilityIdpIdentifierModel>> onCallRpUtilityPublicIdp() async {
    try {
      // print('oncall utility public');
      final callable = _firebaseClient.httpsCallable(
          FirebaseCloundFunctionsValue.onCallRP,
          region: FirebaseCloundFunctionsValue.asia1);
      final result = await callable.call(<String, dynamic>{
        'name': FirebaseCloundFunctionsValue.rpUtilityListPublic,
        'params': {}
      });
      if (result.data != null) {
        // print(result.data);
        final data = UtilityIdpIdentifierModelPersistence()
            .fromArrayJson(result.data as List);
        return data;
      }
      return [];
    } on FirebaseFunctionsException catch (e) {
      throw Exception(e.message);
    }
  }
}
