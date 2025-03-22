import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_listing/listing_list.m.dart';
import 'package:aconnec_1109_x/src/model/realtime_database/coin_price.m.dart';

class ConfirmOrderArgumentsScreen {
  final CoinModel coinData;
  final CoinPriceModel coinPrice;
  final double baseTotal;
  final double quoteTotal;
  final String mode;
  final String symbol;

  ConfirmOrderArgumentsScreen({
    required this.coinData,
    required this.baseTotal,
    required this.quoteTotal,
    required this.mode,
    required this.symbol,
    required this.coinPrice,
  });
}
