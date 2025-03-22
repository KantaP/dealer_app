import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:aconnec_1109_x/src/constants/firebase_cloud_functions.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:aconnec_1109_x/src/constants/firebase_rt_db.dart';

@Singleton(order: -2)
class FirebaseClient {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  final FirebaseFunctions functions = FirebaseFunctions.instance;
  final FirebaseFunctions functionsAsia =
      FirebaseFunctions.instanceFor(region: 'asia-southeast1');
  final FirebaseFunctions functionsAsia2 =
      FirebaseFunctions.instanceFor(region: 'asia-southeast2');
  final logger = Logger('firebase');

  Future<UserCredential?> createUserWithEmailAndPassword(
      String email, String password) async {
    return await firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(), password: password.trim());
  }

  Future<void> setValue(String dbRef, Map<String, dynamic> value) async {
    try {
      DatabaseReference ref = firebaseDatabase.ref(dbRef);
      await ref.set(value);
    } on FirebaseAuthException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      rethrow;
    }
  }

  Future<void> setValues(String dbRef, dynamic value) async {
    try {
      DatabaseReference ref = firebaseDatabase.ref(dbRef);
      await ref.set(value);
    } on FirebaseAuthException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      rethrow;
    }
  }

  Stream<DatabaseEvent> onUserDBValue() {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw 'user not found';
      }
      DatabaseReference ref = firebaseDatabase
          .ref(FirebaseRealtimeDatabaseValue.userProfileData(user.uid));
      return ref.onValue;
    } on FirebaseAuthException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      rethrow;
    }
  }

  User? currentUser() {
    return firebaseAuth.currentUser;
  }

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
              email: email.trim(), password: password.trim());
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        logger.warning('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        logger.warning('Wrong password provided for that user.');
      }
      rethrow;
    }
  }

  Future<void> signOut() {
    return firebaseAuth.signOut();
  }

  Future<DataSnapshot> getData(String dbRef) {
    try {
      logger.info(dbRef);
      DatabaseReference ref = firebaseDatabase.ref(dbRef);
      return ref.get();
    } on FirebaseAuthException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e);
    }
  }

  Future<void> verifyPhoneNumber(
    String phoneNumber, {
    required Function(PhoneAuthCredential) verificationCompleted,
    required Function(FirebaseAuthException) verificationFailed,
    required Function(String, int?) codeSent,
    required Function(String) codeAutoRetrievalTimeout,
  }) async {
    // await firebaseAuth.setSettings(appVerificationDisabledForTesting: true);
    return firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 120),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  Future<UserCredential> signInWithCredential(
      PhoneAuthCredential credential) async {
    return firebaseAuth.signInWithCredential(credential);
  }

  Future<ConfirmationResult> signInWithPhoneNumber(String phoneNumber) async {
    return firebaseAuth.signInWithPhoneNumber(
      phoneNumber,
    );
  }

  Stream<DatabaseEvent> onKycLevel2Value() {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw 'user not found';
      }
      DatabaseReference ref =
          firebaseDatabase.ref('kyc/${user.uid}/progress/level2');
      return ref.onValue;
    } on FirebaseAuthException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      rethrow;
    }
  }

  Stream<DatabaseEvent> onKycLevel1Value() {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw 'user not found';
      }
      DatabaseReference ref =
          firebaseDatabase.ref('kyc/${user.uid}/progress/level1');
      return ref.onValue;
    } on FirebaseAuthException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      rethrow;
    }
  }

  Future<String> uploadFile(String ref, File file, String fileName) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw 'user not found';
      }
      final ext = extension(file.path);
      final docRef = firebaseStorage.ref(ref).child(user.uid).child(fileName);
      // print(docRef.fullPath);
      await docRef.putFile(file);
      return docRef.fullPath;
    } on FirebaseAuthException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.code);
    }
  }

  Future<String> getDownloadURL(String ref, String fileName) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw 'user not found';
      }
      final docRef = firebaseStorage.ref(ref).child(user.uid).child(fileName);
      return docRef.getDownloadURL();
    } on FirebaseAuthException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.code);
    }
  }

  Future<String> getStaticFile(String ref, String fileName) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw 'user not found';
      }
      // print(ref);
      // print('$fileName.png');
      final docRef = firebaseStorage.ref(ref).child(fileName);

      return docRef.getDownloadURL();
    } on FirebaseAuthException catch (e) {
      // logger.warning('Failed with error code: ${e.code}');
      // logger.warning(e.message);
      throw Exception(e.code);
    }
  }

  Future<String> getStaticFileWithUserId(String ref, String fileName) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw 'user not found';
      }
      // print(ref);
      // print('$fileName.png');
      final docRef = firebaseStorage.ref(ref).child(user.uid).child(fileName);

      return docRef.getDownloadURL();
    } on FirebaseAuthException catch (e) {
      // logger.warning('Failed with error code: ${e.code}');
      // logger.warning(e.message);
      throw Exception(e.code);
    }
  }

  CollectionReference collectionRef(String collection) {
    return firestore.collection(collection);
  }

  HttpsCallable httpsCallable(String functionName, {String? region}) {
    if (region == FirebaseCloundFunctionsValue.asia1) {
      return functionsAsia.httpsCallable(functionName);
    }
    if (region == FirebaseCloundFunctionsValue.asia2) {
      return functionsAsia2.httpsCallable(functionName);
    }
    return functions.httpsCallable(functionName);
  }

  Stream<DatabaseEvent> onIdCardAddressValue() {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw 'user not found';
      }
      DatabaseReference ref =
          firebaseDatabase.ref('kyc/${user.uid}/progress/level1');
      return ref.onValue;
    } on FirebaseAuthException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      rethrow;
    }
  }

  Stream<DatabaseEvent> onValueRef(String path) {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw 'user not found';
      }
      DatabaseReference ref = firebaseDatabase.ref(path);
      return ref.onValue;
    } on FirebaseAuthException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      rethrow;
    }
  }

  Future<void> requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      // print('User granted provisional permission');
    } else {
      // print('User declined or has not accepted permission');
    }
    return;
  }

  Future<void> sendResetPasswordEmail(String email) {
    return firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<UserCredential> refreshToken(String username, String password) async {
    AuthCredential credential =
        EmailAuthProvider.credential(email: username, password: password);
    final newCredential = await firebaseAuth.currentUser!
        .reauthenticateWithCredential(credential);
    return newCredential;
  }
}
