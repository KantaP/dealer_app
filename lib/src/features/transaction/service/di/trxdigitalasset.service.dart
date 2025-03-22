import 'package:aconnec_1109_x/src/constants/firebase_cloud_functions.dart';
import 'package:aconnec_1109_x/src/data/network/firebase_client.dart';
import 'package:aconnec_1109_x/src/exceptions/firebase_exception.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/trxdigitalasset_function/trxdigitalasset_create.m.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@Singleton(order: -1)
class TrxDigitalAssetService {
  final FirebaseClient _firebaseClient;
  final logger = Logger('order_service');

  late HttpsCallable callableFunction;

  TrxDigitalAssetService(this._firebaseClient) {
    callableFunction = _firebaseClient.httpsCallable(
      FirebaseCloundFunctionsValue.trxDigitalAssetFunction,
      region: FirebaseCloundFunctionsValue.asia1,
    );
  }

  Future<ResponseTrxDigitalAssetCreateModel> trxDigitalAssetCreate(
      RequestTrxDigitalAssetCreateModel data) async {
    try {
      final params = <String, dynamic>{
        'name': FirebaseCloundFunctionsValue.orderCreate,
        'params': data.toJson(),
      };
      final result = await callableFunction.call<Map<String, dynamic>>(params);
      final Map<String, dynamic> mapped = result.data.cast<String, dynamic>();
      final response = ResponseTrxDigitalAssetCreateModel.fromJson(mapped);
      return response;
    } on FirebaseFunctionsException catch (e) {
      final exception =
          CustomFirebaseException(message: e.message, code: e.code);
      if (exception.code == 'not-found') {
        return const ResponseTrxDigitalAssetCreateModel(idTrxDigitalAsset: 0);
      } else {
        exception.captureException();
      }
      throw Exception(exception.message);
    }
  }
}
