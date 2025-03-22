import 'dart:io';

import 'package:aconnec_1109_x/src/model/request_user_bank_account.m.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:aconnec_1109_x/src/constants/firebase_rt_db.dart';
import 'package:aconnec_1109_x/src/constants/firestore.dart';
import 'package:aconnec_1109_x/src/data/network/firebase_client.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@Singleton()
class UtilityFirebaseService {
  final FirebaseClient _firebaseClient;
  final logger = Logger('auth.firebase');

  UtilityFirebaseService(this._firebaseClient);

  Future<void> addBankAccount(UserBankAccountModel data) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      List<Map<String, dynamic>> newBankList = [];
      final bankList = await getMyBanks();

      if (bankList.isNotEmpty) {
        final List<Map<String, dynamic>> bankListJson =
            bankList.map((e) => e.toJson()).toList();

        newBankList = [...bankListJson, data.toJson()];
      } else {
        newBankList = [data.toJson()];
      }
      await _firebaseClient.setValues(
        FirebaseRealtimeDatabaseValue.bankAccountPath(user.uid),
        newBankList,
      );
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<List<UserBankAccountModel>> getMyBanks() async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final snapshot = await _firebaseClient.getData(
        FirebaseRealtimeDatabaseValue.bankAccountPath(user.uid),
      );
      List<UserBankAccountModel> bankList = [];
      List? data = snapshot.value as List?;
      if (data != null) {
        data = data.map((e) => Map<String, dynamic>.from(e)).toList();
        bankList = data.map((e) => UserBankAccountModel.fromJson(e)).toList();
      }

      return bankList;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<void> savePaymentTransaction() async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }

      CollectionReference paymentTransaction =
          _firebaseClient.collectionRef(FireStoreValue.transactionCollection);

      // await paymentTransaction.doc(user.uid).set();
      return;
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
}
