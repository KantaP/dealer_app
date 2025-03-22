import 'package:aconnec_1109_x/src/constants/firebase_cloud_functions.dart';
import 'package:aconnec_1109_x/src/data/network/firebase_client.dart';
import 'package:aconnec_1109_x/src/exceptions/firebase_exception.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_bitgo/get_deposit_wallet.m.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@Singleton(order: -1)
class BitgoService {
  final FirebaseClient _firebaseClient;
  final logger = Logger('bitgo_service');

  late HttpsCallable callableFunction;

  BitgoService(this._firebaseClient) {
    callableFunction = _firebaseClient.httpsCallable(
      FirebaseCloundFunctionsValue.bitgoFunction,
      region: FirebaseCloundFunctionsValue.asia1,
    );
  }

  Future<ResponseGetDepositWalletModel> getDepositAddress(
      RequestGetDepositWalletModel request) async {
    try {
      final params = <String, dynamic>{
        'name': FirebaseCloundFunctionsValue.bitgoDepositAddress,
        'params': request.toJson(),
      };
      // print(params);
      final result = await callableFunction.call<Map<String, dynamic>>(params);
      final Map<String, dynamic> mapped = result.data.cast<String, dynamic>();
      // print(mapped);
      final response = ResponseGetDepositWalletModel.fromJson(mapped);
      return response;
    } on FirebaseFunctionsException catch (e) {
      // print(e);
      final exception =
          CustomFirebaseException(message: e.message, code: e.code);
      exception.captureException();
      if (exception.code == 'not-found') {
        return const ResponseGetDepositWalletModel();
      }
      throw Exception(exception.message);
    }
  }
}
