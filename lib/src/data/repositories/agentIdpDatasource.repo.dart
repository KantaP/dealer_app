import 'package:aconnec_1109_x/src/data/local/di/agent_idp.ds.dart';
import 'package:aconnec_1109_x/src/model/idp.m.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class AgentIdpDatasourceRepository {
  final AgentIdpDatasource agentIdpDatasource;
  AgentIdpDatasourceRepository(this.agentIdpDatasource);

  Future<IdpModel> insert(IdpModel item) {
    return agentIdpDatasource.insert(item);
  }

  Future<List<IdpModel>> getAll() async {
    final list = await agentIdpDatasource.getAll();
    return list ?? [];
  }

  Future<void> deleteAll() async {
    await agentIdpDatasource.deleteAll();
    return;
  }
}
