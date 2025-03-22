import 'package:aconnec_1109_x/src/constants/firestore.dart';
import 'package:aconnec_1109_x/src/data/network/firebase_client.dart';
import 'package:aconnec_1109_x/src/features/authenticate/service/di/authentication.firebase.dart';
import 'package:aconnec_1109_x/src/model/firestore/user_spend_limit.m.dart';
import 'package:aconnec_1109_x/src/model/user_profile.m.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@Singleton(order: -1)
class UserDataService {
  final FirebaseClient _firebaseClient;
  final logger = Logger('coin_list_servcie');
  final AuthenticationFirebaseService _service;

  UserDataService(this._firebaseClient, this._service);

  Future<UserProfileModel> getCurrentUser() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return _service.getCurrentUser();
  }

  Future<UserSpendLimitModel> getUserSpendLimit() async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }

      CollectionReference ref = _firebaseClient
          .collectionRef(FireStoreValue.userDataSensitiveCollection);

      final userData = await ref.doc(user.uid).get();
      Map<String, dynamic> data = userData.data() as Map<String, dynamic>;
      final spendData = UserSpendLimitModel.fromJson(data);

      return spendData;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }
}
