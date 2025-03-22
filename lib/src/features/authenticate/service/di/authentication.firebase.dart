import 'package:aconnec_1109_x/src/constants/firebase_cloud_functions.dart';
import 'package:aconnec_1109_x/src/data/local/shared_preferences.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_auth/check.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_check_pin_function/response_check_pin.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_set_pin_function/response_set_pin.m.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/firebase_rt_db.dart';
import 'package:aconnec_1109_x/src/constants/strings.dart';
import 'package:aconnec_1109_x/src/data/network/firebase_client.dart';
import 'package:aconnec_1109_x/src/data/local/di/user.ds.dart';
import 'package:aconnec_1109_x/src/model/user_profile.m.dart';
import 'package:aconnec_1109_x/src/model/user_profile.m.p.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@Singleton(order: -1)
class AuthenticationFirebaseService {
  final FirebaseClient _firebaseClient;
  final UserDataSource _dataSource;
  final logger = Logger('auth.firebase');
  final SharedPreferencesHelper _sharedPreferencesHelper;

  AuthenticationFirebaseService(
      this._firebaseClient, this._dataSource, this._sharedPreferencesHelper);

  Future<void> setPin(String pin) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw 'user not found';
      }
      final userModel = await getCurrentUser();
      final userLocalData = userModel.copyWith(<String, dynamic>{
        UserProfileModelFields.pinData: '',
        UserProfileModelFields.pinActiveStatus: 1,
        UserProfileModelFields.userLastUpdate:
            DateTime.now().toUtc().toString(),
      });

      final res = await onCallSetPin(pin);
      if (res) {
        return _firebaseClient.setValue(
            FirebaseRealtimeDatabaseValue.userProfileData(user.uid),
            UserProfileModelPersistence().toJson(userLocalData));
      } else {
        throw Exception('error');
      }
    } on FirebaseAuthException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e);
    }
  }

  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    final credential =
        await _firebaseClient.signInWithEmailAndPassword(email, password);
    _sharedPreferencesHelper.setUsername(email);
    _sharedPreferencesHelper.setPassword(password);
    return credential;
  }

  Future<UserCredential?> createUserWithEmailAndPassword(
      String email, String password) {
    return _firebaseClient.createUserWithEmailAndPassword(email, password);
  }

  Future<void> signOut() async {
    try {
      await _sharedPreferencesHelper.setLoggedIn(false);
      return _firebaseClient.signOut();
    } on FirebaseAuthException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
    }
  }

  Stream<DatabaseEvent> onUserDBValue() {
    return _firebaseClient.onUserDBValue();
  }

  void verifyPhoneNumber(
    String phoneNumber, {
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(FirebaseAuthException) verificationFailed,
    required Function(String, int?) codeSent,
    required Function(String) codeAutoRetrievalTimeout,
  }) {
    _firebaseClient.verifyPhoneNumber(
      phoneNumber,
      verificationCompleted: (credential) {
        verificationCompleted(credential);
      },
      verificationFailed: (exception) {
        verificationFailed(exception);
      },
      codeSent: (s, i) {
        codeSent(s, i);
      },
      codeAutoRetrievalTimeout: (s) {
        codeAutoRetrievalTimeout(s);
      },
    );
  }

  Future<UserCredential?> signInWithPhoneAuthCredential(
      UserCredential result) async {
    UserProfileModel profile;

    try {
      final uid = result.user?.uid ?? '';
      final userData = await _firebaseClient
          .getData(FirebaseRealtimeDatabaseValue.userProfileData(uid));
      if (userData.exists) {
        if (userData.value != null) {
          profile = UserProfileModelPersistence()
              .fromJson(Map<String, dynamic>.from(userData.value as dynamic));
        }
      } else {
        final now = DateTime.now();
        final customerId = now.millisecondsSinceEpoch;
        final createdAt = now.toUtc().toString();
        profile = UserProfileModel(
          uid: uid,
          id: customerId,
          username: customerId.toString(),
          status: UserStatus.active.name,
          kycStatus: StaticValue.kycUnverified,
          createdAt: createdAt,
          mobileNumber: result.user?.phoneNumber ?? '',
          customerStatus: 'RI',
          dealerCustomerStatus: '99',
          userType: National.thai.name,
        );
        await _firebaseClient.setValue(
          FirebaseRealtimeDatabaseValue.userProfileData(uid),
          UserProfileModelPersistence().toJson(profile),
        );
        await onCallPredataUserSensitive();
      }
      return result;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  Future<UserProfileModel> createUserProfile(UserCredential result) async {
    UserProfileModel profile = UserProfileModel();

    try {
      final uid = result.user?.uid ?? '';
      final userData = await _firebaseClient
          .getData(FirebaseRealtimeDatabaseValue.userProfileData(uid));
      if (userData.exists) {
        if (userData.value != null) {
          profile = UserProfileModelPersistence()
              .fromJson(Map<String, dynamic>.from(userData.value as dynamic));
        }
      } else {
        final now = DateTime.now();
        final customerId = now.millisecondsSinceEpoch;
        final createdAt = now.toUtc().toString();
        profile = UserProfileModel(
          uid: uid,
          id: customerId,
          username: customerId.toString(),
          status: UserStatus.active.name,
          kycStatus: StaticValue.kycUnverified,
          createdAt: createdAt,
          mobileNumber: result.user?.phoneNumber ?? '',
          customerStatus: 'RI',
          dealerCustomerStatus: '99',
          userType: National.thai.name,
          userEmail: result.user?.email ?? '',
        );
        await _firebaseClient.setValue(
          FirebaseRealtimeDatabaseValue.userProfileData(uid),
          UserProfileModelPersistence().toJson(profile),
        );
        await onCallPredataUserSensitive();
      }
      return profile;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  Future<void> sendVerifyEmail() {
    final user = _firebaseClient.currentUser();
    if (user == null) {
      throw Exception('user not found');
    }
    // final actionCodeSettings = ActionCodeSettings(
    //   url: 'https://www.1109x.com',
    //   iOSBundleId: 'com.gaffverse.x1109.staging',
    //   androidPackageName: 'com.gaffverse.x1109.staging',
    // );

    return user.sendEmailVerification();
  }

  Future<dynamic> signInWithPhoneNumber(String phoneNumber) {
    return _firebaseClient.signInWithPhoneNumber(phoneNumber);
  }

  Future<User?> getUserAuthData() async {
    final user = _firebaseClient.currentUser();
    if (user == null) {
      throw Exception('user not found');
    }
    return user;
  }

  Future<UserProfileModel> getCurrentUser() async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final checkAnnoymously = await isAnonymously();
      if (checkAnnoymously) {
        throw Exception('annoymousely mode');
      }
      final userData = await _firebaseClient
          .getData(FirebaseRealtimeDatabaseValue.userProfileData(user.uid));

      if (userData.exists) {
        if (userData.value != null) {
          return UserProfileModelPersistence()
              .fromJson(Map<String, dynamic>.from(userData.value as dynamic));
        }
      }
      return UserProfileModel();
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<UserProfileModel> terminate() async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw 'user not found';
      }
      final userData = await _firebaseClient
          .getData(FirebaseRealtimeDatabaseValue.userProfileData(user.uid));

      if (userData.exists) {
        if (userData.value != null) {
          final userProfile = UserProfileModelPersistence()
              .fromJson(Map<String, dynamic>.from(userData.value as dynamic));
          final updateUserProfile = userProfile.copyWith({
            UserProfileModelFields.userActiveStatus: 'terminated',
            UserProfileModelFields.userLastUpdate:
                DateTime.now().toUtc().toString()
          });
          await _firebaseClient.setValue(
              FirebaseRealtimeDatabaseValue.userProfileData(user.uid),
              UserProfileModelPersistence().toJson(updateUserProfile));
          return updateUserProfile;
        }
      }
      return UserProfileModel();
    } on FirebaseException catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> onCallCheckPin(String pin) async {
    try {
      final callable = _firebaseClient.httpsCallable(
          FirebaseCloundFunctionsValue.onCallCheckPin,
          region: FirebaseCloundFunctionsValue.asia1);
      final result = await callable.call(<String, dynamic>{
        'text': pin,
      });

      final json = Map<String, dynamic>.from(result.data as dynamic);
      try {
        final ResponseCheckPinModel response =
            ResponseCheckPinModel.fromJson(json);
        print(response.status);
        return response.status;
      } catch (e) {
        throw Exception('Cannot converter response');
      }
    } on FirebaseFunctionsException catch (e) {
      print(e);
      throw Exception(e.message);
    }
  }

  Future<bool> onCallSetPin(String pin) async {
    try {
      final callable = _firebaseClient.httpsCallable(
          FirebaseCloundFunctionsValue.onCallSetPin,
          region: FirebaseCloundFunctionsValue.asia1);
      final result = await callable.call(<String, dynamic>{
        'text': pin,
      });

      final json = Map<String, dynamic>.from(result.data as dynamic);
      try {
        final ResponseSetPinModel response = ResponseSetPinModel.fromJson(json);

        return response.status;
      } catch (e) {
        throw Exception('Cannot converter response');
      }
    } on FirebaseFunctionsException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> resetSetUpPin() async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw 'user not found';
      }
      final userModel = await getCurrentUser();
      final userLocalData = userModel.copyWith(<String, dynamic>{
        UserProfileModelFields.pinActiveStatus: 0,
        UserProfileModelFields.userLastUpdate:
            DateTime.now().toUtc().toString(),
      });
      return _firebaseClient.setValue(
          FirebaseRealtimeDatabaseValue.userProfileData(user.uid),
          UserProfileModelPersistence().toJson(userLocalData));
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<UserCredential> signInWithCredential(PhoneAuthCredential credential) {
    // Sign the user in (or link) with the credential
    return _firebaseClient.firebaseAuth.signInWithCredential(credential);
  }

  Future<bool> onCallPredataUserSensitive() async {
    try {
      final callable = _firebaseClient.httpsCallable(
          FirebaseCloundFunctionsValue.onCallPredataSensitive,
          region: FirebaseCloundFunctionsValue.asia1);
      final result = await callable.call();

      final json = Map<String, dynamic>.from(result.data as dynamic);
      return json['status'] ?? false;
    } on FirebaseFunctionsException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<bool> onCallAuth({required String phoneNumber}) async {
    try {
      final request = AuthCheckRequest(phoneNumber: phoneNumber);
      final callable = _firebaseClient.httpsCallable(
          FirebaseCloundFunctionsValue.onCallAuth,
          region: FirebaseCloundFunctionsValue.asia1);
      final result = await callable.call({
        'name': FirebaseCloundFunctionsValue.authCheck,
        'params': request.toJson()
      });

      final json = Map<String, dynamic>.from(result.data as dynamic);
      return json['status'] ?? false;
    } on FirebaseFunctionsException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<bool> isLoggedIn() async {
    final bool loggedIn = await _sharedPreferencesHelper.getLoggedIn() ?? false;
    return loggedIn;
  }

  Future<UserCredential> signInAnonymously() async {
    return _firebaseClient.firebaseAuth.signInAnonymously();
  }

  Future<void> asAnonymously() async {
    await _sharedPreferencesHelper.setAnonymously(true);
    return;
  }

  Future<void> offAnonymously() async {
    await _sharedPreferencesHelper.setAnonymously(false);
    return;
  }

  Future<bool> isAnonymously() async {
    final checked = await _sharedPreferencesHelper.getAnonymously() ?? false;
    return checked;
  }

  Future<void> requestNotificationPermission() async {
    await _firebaseClient.requestNotificationPermission();
    return;
  }

  Future<void> refreshToken() async {
    final username = await _sharedPreferencesHelper.getUsername() ?? '';
    final password = await _sharedPreferencesHelper.getPassword() ?? '';
    if (username.isNotEmpty && password.isNotEmpty) {
      await _firebaseClient.refreshToken(username, password);
    }
    return;
  }
}
