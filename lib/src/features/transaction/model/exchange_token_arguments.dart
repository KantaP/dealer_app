import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_listing/listing_list.m.dart';
import 'package:aconnec_1109_x/src/model/realtime_database/coin_price.m.dart';

class ExchangeTokenArguments {
  final CoinModel coinData;
  final CoinPriceModel coinPrice;

  ExchangeTokenArguments({required this.coinData, required this.coinPrice});
}
