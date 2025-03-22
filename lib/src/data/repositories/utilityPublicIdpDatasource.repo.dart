import 'package:aconnec_1109_x/src/data/local/di/utility_public_idp.ds.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_rp_function/utility_idp_identifier.m.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UtilityPublicIdpDatasourceRepository {
  final UtilityPublicIdpDatasource utilityPublicIdpDatasource;
  UtilityPublicIdpDatasourceRepository(this.utilityPublicIdpDatasource);

  Future<UtilityIdpIdentifierModel> insert(UtilityIdpIdentifierModel item) {
    return utilityPublicIdpDatasource.insert(item);
  }

  Future<List<UtilityIdpIdentifierModel>> getAll() async {
    final list = await utilityPublicIdpDatasource.getAll();
    return list ?? [];
  }

  Future<void> deleteAll() async {
    await utilityPublicIdpDatasource.deleteAll();
    return;
  }
}
