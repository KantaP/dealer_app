import 'package:aconnec_1109_x/src/di/components/injection.dart';
import 'package:aconnec_1109_x/src/features/coin/service/coin.service.dart';

class CoinBinding {
  static CoinService coinService = getIt<CoinService>();
}
