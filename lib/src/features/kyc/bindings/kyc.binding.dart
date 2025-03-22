import 'package:aconnec_1109_x/src/di/components/injection.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';

class KycBinding {
  static KycFirebaseService kycService = getIt<KycFirebaseService>();
}
