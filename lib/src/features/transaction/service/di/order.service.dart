import 'package:aconnec_1109_x/src/constants/firebase_cloud_functions.dart';
import 'package:aconnec_1109_x/src/data/network/firebase_client.dart';
import 'package:aconnec_1109_x/src/exceptions/firebase_exception.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/open_check.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_cancel.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_create.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_full.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_get.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_list.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_spend_limit.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/trxdigitalasset_function/trxdigitalasset_get.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/trxfiat_function/trxfiat_get.m.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@Singleton(order: -1)
class OrderFunctionService {
  final FirebaseClient _firebaseClient;
  final logger = Logger('order_service');

  late HttpsCallable callableFunction;

  OrderFunctionService(this._firebaseClient) {
    callableFunction = _firebaseClient.httpsCallable(
      FirebaseCloundFunctionsValue.orderFunction,
      region: FirebaseCloundFunctionsValue.asia1,
    );
  }

  Future<ResponseOrderCreateModel> orderCreate(
      RequestOrderCreateModel data) async {
    try {
      final params = <String, dynamic>{
        'name': FirebaseCloundFunctionsValue.orderCreateHotFix,
        'params': data.toJson(),
      };
      final result = await callableFunction.call<Map<String, dynamic>>(params);
      final Map<String, dynamic> mapped = result.data.cast<String, dynamic>();
      final response = ResponseOrderCreateModel.fromJson(mapped);
      // print(response.idOrder);
      return response;
    } on FirebaseFunctionsException catch (e) {
      // print(e);
      final exception =
          CustomFirebaseException(message: e.message, code: e.code);

      exception.captureException();
      if (exception.code == 'not-found') {
        return const ResponseOrderCreateModel();
      }
      throw Exception(exception.message);
    }
  }

  Future<ResponseOpenCheckModel> orderOpenCheck() async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw FirebaseAuthException(
            code: 'unauthenticate', message: 'unauthenticate');
      }
      final RequestOpenCheckModel request =
          RequestOpenCheckModel(idUser: user.uid);
      final params = <String, dynamic>{
        'name': FirebaseCloundFunctionsValue.orderCheck,
        'params': request.toJson(),
      };
      final result = await callableFunction.call<Map<String, dynamic>>(params);
      final Map<String, dynamic> mapped = result.data.cast<String, dynamic>();
      final response = ResponseOpenCheckModel.fromJson(mapped);
      return response;
    } on FirebaseFunctionsException catch (e) {
      final exception =
          CustomFirebaseException(message: e.message, code: e.code);
      exception.captureException();
      if (exception.code == 'not-found') {
        return const ResponseOpenCheckModel();
      }
      throw Exception(exception.message);
    }
  }

  Future<ResponseOrderGetModel> orderGet(RequestOrderGetModel data) async {
    try {
      final params = <String, dynamic>{
        'name': FirebaseCloundFunctionsValue.orderGet,
        'params': data.toJson(),
      };
      final result = await callableFunction.call<Map<String, dynamic>>(params);
      final Map<String, dynamic> mapped = result.data.cast<String, dynamic>();

      final response = ResponseOrderGetModel.fromJson(mapped);
      return response;
    } on FirebaseFunctionsException catch (e) {
      final exception =
          CustomFirebaseException(message: e.message, code: e.code);
      exception.captureException();
      if (exception.code == 'not-found') {
        return const ResponseOrderGetModel();
      }
      throw Exception(exception.message);
    }
  }

  Future<ResponseOrderFullModel> orderFull(RequestOrderFullModel data) async {
    try {
      final params = <String, dynamic>{
        'name': FirebaseCloundFunctionsValue.orderFull,
        'params': data.toJson(),
      };
      final result = await callableFunction.call<Map<String, dynamic>>(params);

      final Map<String, dynamic> mapped = result.data.cast<String, dynamic>();
      mapped.forEach(((key, value) {
        if (mapped[key] != null) {
          mapped[key] = Map<String, dynamic>.from(mapped[key]);
        }
      }));
      final response = ResponseOrderFullModel.fromJson(mapped);
      print(response.toJson());
      return response;
    } on FirebaseFunctionsException catch (e) {
      final exception =
          CustomFirebaseException(message: e.message, code: e.code);
      if (exception.code == 'not-found') {
        return ResponseOrderFullModel(
          order: const ResponseOrderGetModel(),
          trxdigitalasset: const ResponseTrxDigitalAssetGetModel(),
          trxfiat: const ResponseTrxFiatGetModel(),
        );
      } else {
        exception.captureException();
      }
      throw Exception(exception.message);
    }
  }

  Future<ResponseOrderListModel> orderList(RequestOrderListModel data) async {
    try {
      final params = <String, dynamic>{
        'name': FirebaseCloundFunctionsValue.orderList,
        'params': data.toJson(),
      };
      final result = await callableFunction.call(params);
      Map<String, dynamic> mapped = result.data.cast<String, dynamic>();

      List<Object?> snapshotRows = mapped['rows'];
      List<Map<String, dynamic>> convertRows = [];
      for (var e in snapshotRows) {
        final json = Map<String, dynamic>.from(e as Map<Object?, Object?>);
        convertRows.add(json);
      }
      mapped['rows'] = convertRows;
      final response = ResponseOrderListModel.fromJson(mapped);
      return response;
    } on FirebaseFunctionsException catch (e) {
      final exception =
          CustomFirebaseException(message: e.message, code: e.code);
      if (exception.code == 'not-found') {
        return const ResponseOrderListModel();
      } else {
        exception.captureException();
      }
      throw Exception(exception.message);
    }
  }

  Future<void> orderCancel(RequestOrderCancelModel data) async {
    try {
      final params = <String, dynamic>{
        'name': FirebaseCloundFunctionsValue.orderCancel,
        'params': data.toJson(),
      };
      // print(params);
      await callableFunction.call<dynamic>(params);
      return;
    } on FirebaseFunctionsException catch (e) {
      // print(e);
      final exception =
          CustomFirebaseException(message: e.message, code: e.code);
      if (exception.code == 'not-found') {
        return;
      } else {
        exception.captureException();
      }
      throw Exception(exception.message);
    }
  }

  Future<ResponseOrderSpendLimitModel> orderSpendLimit() async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw FirebaseAuthException(
            code: 'unauthenticate', message: 'unauthenticate');
      }
      final data = RequestOrderSpendLimitModel(idUser: user.uid, timezone: 7);
      final params = <String, dynamic>{
        'name': FirebaseCloundFunctionsValue.getSpendToday,
        'params': data.toJson(),
      };
      final result = await callableFunction.call(params);
      Map<String, dynamic> mapped = result.data.cast<String, dynamic>();
      final response = ResponseOrderSpendLimitModel.fromJson(mapped);
      return response;
    } on FirebaseFunctionsException catch (e) {
      // print(e);
      final exception =
          CustomFirebaseException(message: e.message, code: e.code);
      if (exception.code == 'not-found') {
        return const ResponseOrderSpendLimitModel();
      } else {
        exception.captureException();
      }
      throw Exception(exception.message);
    }
  }
}
