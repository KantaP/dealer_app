import 'dart:io';

import 'package:aconnec_1109_x/src/model/firestore/request_statement.m.dart';
import 'package:aconnec_1109_x/src/model/response_trade_transaction.m.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/firebase_rt_db.dart';
import 'package:aconnec_1109_x/src/constants/firestore.dart';
import 'package:aconnec_1109_x/src/data/network/firebase_client.dart';
import 'package:aconnec_1109_x/src/model/request_order_cancel_reason.m.dart';
import 'package:aconnec_1109_x/src/model/request_order_cancel_reason.m.p.dart';
import 'package:aconnec_1109_x/src/model/request_payment_transaction.m.dart';
import 'package:aconnec_1109_x/src/model/request_payment_transaction.m.p.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@Singleton(order: -1)
class TransactionFirebaseService {
  final FirebaseClient _firebaseClient;
  final logger = Logger('kyc_firebase');

  TransactionFirebaseService(this._firebaseClient);

  Future<void> savePaymentTransaction(PaymentTransactionModel model) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }

      CollectionReference paymentTransaction =
          _firebaseClient.collectionRef(FireStoreValue.transactionCollection);

      final json = PaymentTransactionModelPersistence().toJson(model);
      await paymentTransaction
          .doc(user.uid)
          .collection(FireStoreValue.paymentCollection)
          .add(json);
      return;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<PaymentTransactionModel> getPaymentTransaction(String ref) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }

      CollectionReference transaction =
          _firebaseClient.collectionRef(FireStoreValue.transactionCollection);

      CollectionReference<PaymentTransactionModel> payment = transaction
          .doc(user.uid)
          .collection(FireStoreValue.paymentCollection)
          .withConverter<PaymentTransactionModel>(
            fromFirestore: (snapshot, _) =>
                PaymentTransactionModelPersistence().fromJson(snapshot.data()!),
            toFirestore: (transaction, _) =>
                PaymentTransactionModelPersistence().toJson(transaction),
          );

      final List<QueryDocumentSnapshot<PaymentTransactionModel>> docs =
          await payment
              .where('ref', isEqualTo: ref)
              .get()
              .then((snapshot) => snapshot.docs);

      if (docs.isNotEmpty) {
        return docs[0].data();
      }
      return PaymentTransactionModel();
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<bool> updatePaymentTransaction(
    String ref,
    Map<String, dynamic> updateValues,
  ) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }

      CollectionReference transaction =
          _firebaseClient.collectionRef(FireStoreValue.transactionCollection);

      CollectionReference<PaymentTransactionModel> payment = transaction
          .doc(user.uid)
          .collection(FireStoreValue.paymentCollection)
          .withConverter<PaymentTransactionModel>(
            fromFirestore: (snapshot, _) =>
                PaymentTransactionModelPersistence().fromJson(snapshot.data()!),
            toFirestore: (transaction, _) =>
                PaymentTransactionModelPersistence().toJson(transaction),
          );

      final List<QueryDocumentSnapshot<PaymentTransactionModel>> docs =
          await payment
              .where('ref', isEqualTo: ref)
              .get()
              .then((snapshot) => snapshot.docs);

      if (docs.isNotEmpty) {
        await payment.doc(docs[0].id).update(updateValues);
        return true;
      }
      return false;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<void> addTransactionPaymentTracking(
      PaymentTransactionTrackingModel model) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }

      final json = PaymentTransactionTrackingModelPersistence().toJson(model);

      await _firebaseClient.setValue(
        FirebaseRealtimeDatabaseValue.transactionPaymentTracking(user.uid),
        json,
      );
      return;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<PaymentTransactionModel> getTransactionPaymentTracking() async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }

      final snapshot = await _firebaseClient.getData(
          FirebaseRealtimeDatabaseValue.transactionPaymentTracking(user.uid));
      final state = (snapshot.value != null)
          ? PaymentTransactionModelPersistence()
              .fromJson(Map<String, dynamic>.from(snapshot.value as dynamic))
          : PaymentTransactionModel();
      return state;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Stream<DatabaseEvent> onTransactionPaymentValue() {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      return _firebaseClient.onValueRef(
        FirebaseRealtimeDatabaseValue.transactionPaymentTracking(user.uid),
      );
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<void> cancelTransaction(String ref) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }

      CollectionReference transaction =
          _firebaseClient.collectionRef(FireStoreValue.transactionCollection);

      CollectionReference<PaymentTransactionModel> payment = transaction
          .doc(user.uid)
          .collection(FireStoreValue.paymentCollection)
          .withConverter<PaymentTransactionModel>(
            fromFirestore: (snapshot, _) =>
                PaymentTransactionModelPersistence().fromJson(snapshot.data()!),
            toFirestore: (transaction, _) =>
                PaymentTransactionModelPersistence().toJson(transaction),
          );

      final List<QueryDocumentSnapshot<PaymentTransactionModel>> docs =
          await payment
              .where('ref', isEqualTo: ref)
              .get()
              .then((snapshot) => snapshot.docs);

      if (docs.isNotEmpty) {
        payment.doc(docs[0].id).update({
          PaymentTransactionModelFiedls.status: TransactionStatus.cancel.name,
          PaymentTransactionModelFiedls.updatedAt:
              DateTime.now().toUtc().toString()
        });
      }
      return;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<void> createOrderCancelReason(
      OrderCancelReasonRequestModel request) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }

      final json = OrderCancelReasonRequestModelPersistence().toJson(request);
      CollectionReference transactionCollection =
          _firebaseClient.collectionRef(FireStoreValue.transactionCollection);

      await transactionCollection
          .doc(user.uid)
          .collection(FireStoreValue.cancelReasonCollection)
          .add(json);
      return;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<OrderCancelReasonRequestModel> getOrderCancelReason(String ref) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }

      CollectionReference transaction =
          _firebaseClient.collectionRef(FireStoreValue.transactionCollection);

      CollectionReference<OrderCancelReasonRequestModel> cancelReasonDocs =
          transaction
              .doc(user.uid)
              .collection(FireStoreValue.cancelReasonCollection)
              .withConverter<OrderCancelReasonRequestModel>(
                fromFirestore: (snapshot, _) =>
                    OrderCancelReasonRequestModelPersistence()
                        .fromJson(snapshot.data()!),
                toFirestore: (transaction, _) =>
                    OrderCancelReasonRequestModelPersistence()
                        .toJson(transaction),
              );

      final List<QueryDocumentSnapshot<OrderCancelReasonRequestModel>> docs =
          await cancelReasonDocs
              .where('orderRef', isEqualTo: ref)
              .get()
              .then((snapshot) => snapshot.docs);

      if (docs.isNotEmpty) {
        return docs[0].data();
      }
      return OrderCancelReasonRequestModel();
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<String> uploadFile(String ref, File file, String fileName) async {
    final uploadRes = await _firebaseClient.uploadFile(ref, file, fileName);
    if (uploadRes.isNotEmpty) {
      print('upload success');
    }
    return uploadRes;
  }

  Future<List<PaymentTransactionModel>> getPaymentTransactions({
    String? transactionType = 'buy',
    String? status = 'all',
  }) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }

      CollectionReference transaction =
          _firebaseClient.collectionRef(FireStoreValue.transactionCollection);

      CollectionReference<PaymentTransactionModel> payment = transaction
          .doc(user.uid)
          .collection(FireStoreValue.paymentCollection)
          .withConverter<PaymentTransactionModel>(
            fromFirestore: (snapshot, _) =>
                PaymentTransactionModelPersistence().fromJson(snapshot.data()!),
            toFirestore: (transaction, _) =>
                PaymentTransactionModelPersistence().toJson(transaction),
          );

      List<QueryDocumentSnapshot<PaymentTransactionModel>> docs = [];
      if (status != null && status.isNotEmpty) {
        if (status == 'all') {
          docs = await payment
              .where('transactionType', isEqualTo: transactionType)
              .orderBy('createdAt', descending: true)
              .get()
              .then((snapshot) => snapshot.docs);
        } else {
          docs = await payment
              .where('transactionType', isEqualTo: transactionType)
              .where('status', isEqualTo: status)
              .orderBy('createdAt', descending: true)
              .get()
              .then((snapshot) => snapshot.docs);
        }
      }

      if (docs.isNotEmpty) {
        return docs.map((e) => e.data()).toList();
      }
      return [];
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<void> addTradeTransaction(ResponseTradeTransactionModel model) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }

      final json = ResponseTradeTransactionModelPersistence().toJson(model);

      await _firebaseClient.setValue(
        FirebaseRealtimeDatabaseValue.userTradeTransaction(user.uid, model.ref),
        json,
      );
      return;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<ResponseTradeTransactionModel> getTradeTransaction(String ref) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }

      final snapshot = await _firebaseClient.getData(
          FirebaseRealtimeDatabaseValue.userTradeTransaction(user.uid, ref));
      // print(snapshot.value);
      final state = (snapshot.value != null)
          ? ResponseTradeTransactionModelPersistence()
              .fromJson(Map<String, dynamic>.from(snapshot.value as dynamic))
          : ResponseTradeTransactionModel();
      // print(state);
      return state;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<void> updateTradeTransaction(
      String ref, ResponseTradeTransactionModel data) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final json = ResponseTradeTransactionModelPersistence().toJson(data);
      return _firebaseClient.setValue(
        FirebaseRealtimeDatabaseValue.userTradeTransaction(user.uid, ref),
        json,
      );
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }

  Future<String> addRequestStatement(RequestStatementModel request) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final modifiedRequest = request.copyWith(userId: user.uid);
      final requestJson = modifiedRequest.toJson();
      CollectionReference statementRequestedRef =
          _firebaseClient.collectionRef(FireStoreValue.statementRequested);

      final statementRequest = await statementRequestedRef.add(requestJson);
      return statementRequest.id;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }
}
