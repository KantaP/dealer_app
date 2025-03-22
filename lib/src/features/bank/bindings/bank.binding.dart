import 'package:aconnec_1109_x/src/features/bank/services/di/payment.firebase.dart';

import '../../../di/components/injection.dart';

class BankBinding {
  static PaymentFirebaseService get bankFirebaseService =>
      getIt<PaymentFirebaseService>();
}
