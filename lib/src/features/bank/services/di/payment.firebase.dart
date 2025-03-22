import 'package:cloud_functions/cloud_functions.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:aconnec_1109_x/src/constants/firebase_cloud_functions.dart';
import 'package:aconnec_1109_x/src/data/network/firebase_client.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_bank_function/bay_qr_request.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_bank_function/response_bay_qr.m.dart';

import '../../../../exceptions/firebase_exception.dart';
import '../../../../model/cloudfunction/on_call_pure_fiat_function/pure_fiat_cancel.m.dart';
import '../../../../model/cloudfunction/on_call_pure_fiat_function/pure_fiat_create.m.dart';
import '../../../../model/cloudfunction/on_call_pure_fiat_function/pure_fiat_open_check.m.dart';

@singleton
@Injectable()
class PaymentFirebaseService {
  final FirebaseClient _firebaseClient;
  PaymentFirebaseService(this._firebaseClient);

  final logger = Logger('bank firebase service');

  Future<BayQrResponseModel> onCallBayQrRequest({
    required BayQrRequestModel params,
  }) async {
    try {
      final callable = _firebaseClient.httpsCallable(
        FirebaseCloundFunctionsValue.onCallBank,
        region: FirebaseCloundFunctionsValue.asia1,
      );
      print(params.toJson());
      final result = await callable.call(
        <String, dynamic>{
          'name': FirebaseCloundFunctionsValue.bayQrRequest,
          'params': params.toJson(),
        },
      );
      print(result.data);
      if (result.data != null) {
        final response = BayQrResponseModel.fromJson(result.data);
        logger.info(response);
        return response;
      } else {
        throw Exception('Cannot generate qrcode');
      }
    } on FirebaseFunctionsException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<PureFiatCreateResponseModel> pureFiatCreate({
    required PureFiatCreateRequestModel params,
  }) async {
    try {
      final callable = _firebaseClient.httpsCallable(
        FirebaseCloundFunctionsValue.onCallPureFiat,
        region: FirebaseCloundFunctionsValue.asia1,
      );
      // print(params.toJson());
      final result = await callable.call(
        <String, dynamic>{
          'name': FirebaseCloundFunctionsValue.pureFiatCreate,
          'params': params.toJson(),
        },
      );
      // print(result.data);
      if (result.data != null) {
        final response = PureFiatCreateResponseModel.fromJson(result.data);
        logger.info(response);
        return response;
      } else {
        throw Exception('Cannot create pure fiat');
      }
    } on FirebaseFunctionsException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<PureFiatOpenCheckResponse> pureFiatOpenCheck({
    required PureFiatOpenCheckRequest params,
  }) async {
    try {
      final callable = _firebaseClient.httpsCallable(
        FirebaseCloundFunctionsValue.onCallPureFiat,
        region: FirebaseCloundFunctionsValue.asia1,
      );
      final result = await callable.call(
        <String, dynamic>{
          'name': FirebaseCloundFunctionsValue.pureFiatOpenCheck,
          'params': params.toJson(),
        },
      );
      final response = PureFiatOpenCheckResponse.fromJson(result.data);
      logger.info(response);
      return response;
    } on FirebaseFunctionsException catch (e) {
      final exception =
          CustomFirebaseException(message: e.message, code: e.code);
      exception.captureException();
      if (exception.code == 'not-found') {
        return const PureFiatOpenCheckResponse();
      }
      throw Exception(exception.message);
    }
  }

  Future<void> pureFiatCancel({
    required PureFiatCancelRequest params,
  }) async {
    try {
      final callable = _firebaseClient.httpsCallable(
        FirebaseCloundFunctionsValue.onCallPureFiat,
        region: FirebaseCloundFunctionsValue.asia1,
      );
      final result = await callable.call(
        <String, dynamic>{
          'name': FirebaseCloundFunctionsValue.pureFiatCancel,
          'params': params.toJson(),
        },
      );
      return;
    } on FirebaseFunctionsException catch (e) {
      throw Exception(e.message);
    }
  }
}
