import 'dart:async';

import 'package:aconnec_1109_x/src/constants/firebase_cloud_functions.dart';
import 'package:aconnec_1109_x/src/constants/firebase_rt_db.dart';
import 'package:aconnec_1109_x/src/core/custom_stream_subject.dart';
import 'package:aconnec_1109_x/src/data/network/firebase_client.dart';
import 'package:aconnec_1109_x/src/exceptions/firebase_exception.dart';
import 'package:aconnec_1109_x/src/features/coin/view/widgets/coin_filter.dart';
import 'package:aconnec_1109_x/src/features/coin/view/widgets/coin_filter_groupbox.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_listing/listing_list.m.dart';
import 'package:aconnec_1109_x/src/model/realtime_database/coin_price.m.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

@Singleton(order: -1)
class CoinService {
  final FirebaseClient _firebaseClient;
  final logger = Logger('coin_list_servcie');

  late HttpsCallable callableFunction;

  final filterSubject =
      CustomStreamSubject<String>(CoinFilterGroup.crypto.name);

  CoinService(this._firebaseClient) {
    callableFunction = _firebaseClient.httpsCallable(
      FirebaseCloundFunctionsValue.listingFunction,
      region: FirebaseCloundFunctionsValue.asia1,
    );
  }

  void setFilter(String filter) {
    filterSubject.setValue(filter);
  }

  Future<ResponseListingListModel> coinList(
      RequestListingListModel data) async {
    try {
      await Future.delayed(const Duration(milliseconds: 500));
      final params = <String, dynamic>{
        'name': FirebaseCloundFunctionsValue.listingGetList,
        'params': data.toJson(),
      };
      try {
        final result =
            await callableFunction.call<Map<String, dynamic>>(params);
        Map<String, dynamic> mapped = result.data.cast<String, dynamic>();

        List<Object?> snapshotRows = mapped['rows'];
        List<Map<String, dynamic>> convertRows = [];
        for (var e in snapshotRows) {
          final json = Map<String, dynamic>.from(e as Map<Object?, Object?>);
          convertRows.add(json);
        }
        mapped['rows'] = convertRows;
        final response = ResponseListingListModel.fromJson(mapped);
        return response;
      } catch (e) {
        throw Exception(e);
      }
    } on FirebaseFunctionsException catch (e) {
      final exception =
          CustomFirebaseException(message: e.message, code: e.code);
      exception.captureException();
      if (exception.code == 'not-found') {
        return const ResponseListingListModel();
      }
      throw Exception(e.message);
    }
  }

  Future<CoinPriceModel> getCoinPrice(int coinId) async {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      final snapshot = await _firebaseClient.getData(
        FirebaseRealtimeDatabaseValue.coinPricePath(coinId),
      );

      if (snapshot.value != null) {
        try {
          final data = snapshot.value as dynamic;

          final mapped = Map<String, dynamic>.from(data);
          final coinData = CoinPriceModel.fromJson(mapped);

          return coinData;
        } catch (e) {
          throw Exception(e);
        }
      }
      return const CoinPriceModel();
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Stream<DatabaseEvent> onCoinData(int coinId) {
    try {
      final user = _firebaseClient.currentUser();
      if (user == null) {
        throw Exception('user not found');
      }
      DatabaseReference ref = _firebaseClient.firebaseDatabase
          .ref(FirebaseRealtimeDatabaseValue.coinPricePath(coinId));
      return ref.onValue;
    } on FirebaseException catch (e) {
      logger.warning('Failed with error code: ${e.code}');
      logger.warning(e.message);
      throw Exception(e.message);
    }
  }
}
