import 'package:aconnec_1109_x/src/data/local/shared_preferences.dart';
import 'package:aconnec_1109_x/src/data/repositories/ndidService.repo.dart';
import 'package:injectable/injectable.dart';
import 'package:aconnec_1109_x/src/di/components/injection.dart';

@Environment(Env.stagging)
@Injectable(as: NdidServiceRepository)
class NdidServiceRepositoryStag extends NdidServiceRepository {
  NdidServiceRepositoryStag()
      : super(
          serviceId01: '001.cust_info_001',
          serviceId02: '900.cust_info_Dipchip_002',
          sharedPreferencesHelper: getIt<SharedPreferencesHelper>(),
        );
}
