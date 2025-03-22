import 'package:aconnec_1109_x/src/di/components/injection.dart';
import 'package:aconnec_1109_x/src/features/transaction/service/di/order.service.dart';

import '../view/di/exchange_government_token.vm.dart';

class TransactionBinding {
  static OrderFunctionService get orderService => getIt<OrderFunctionService>();
  static ExchangeGovernmentTokenViewModel get exchangeViewModel =>
      getIt<ExchangeGovernmentTokenViewModel>();
}
