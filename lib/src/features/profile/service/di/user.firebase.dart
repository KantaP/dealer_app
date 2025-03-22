import 'package:firebase_database/firebase_database.dart';
import 'package:aconnec_1109_x/src/data/network/firebase_client.dart';
import 'package:aconnec_1109_x/src/data/local/di/user.ds.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@Singleton(order: -1)
class UserFirebaseService {
  final FirebaseClient _firebaseClient;
  final UserDataSource _dataSource;
  final logger = Logger('user.firebase');

  UserFirebaseService(this._firebaseClient, this._dataSource);

  // Future<void> setProfile({
  //   String? firstName,
  //   String? lastName,
  // }) async {
  //   try {
  //     final user = _firebaseClient.currentUser();
  //     if (user == null) {
  //       throw "user not found";
  //     }
  //     final userLocalDataList = await _dataSource.getByFilter(
  //         <String, dynamic>{UserProfileModelFields.idFirebase: user.uid});

  //     if (userLocalDataList == null || userLocalDataList.isEmpty) {
  //       throw "user local data not found";
  //     }

  //     final userLocalData = userLocalDataList[0].copyWith(<String, dynamic>{
  //       UserProfileModelFields.firstName: firstName,
  //       UserProfileModelFields.lastName: lastName
  //     });
  //     logger.info("get user data");
  //     logger.info(UserModelPersistence().toJson(userLocalData));
  //     final updateID = await _dataSource.update(userLocalData);
  //     // print(updateID);
  //     return _firebaseClient.setValue(
  //         "user/${user.uid}", UserModelPersistence().toJson(userLocalData));
  //   } on FirebaseAuthException catch (e) {
  //     logger.warning('Failed with error code: ${e.code}');
  //     logger.warning(e.message);
  //   }
  // }

  Stream<DatabaseEvent> onUserDBValue() {
    return _firebaseClient.onUserDBValue();
  }
}
