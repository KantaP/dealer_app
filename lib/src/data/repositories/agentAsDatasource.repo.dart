import 'package:aconnec_1109_x/src/data/local/di/agent_idp_as.ds.dart';
import 'package:aconnec_1109_x/src/model/idp_as.m.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class AgentAsDatasourceRepository {
  final AgentAsDatasource agentAsDatasource;
  AgentAsDatasourceRepository(this.agentAsDatasource);

  Future<IdpAsModel> insert(IdpAsModel item) {
    return agentAsDatasource.insert(item);
  }

  Future<List<IdpAsModel>> getAll() async {
    final list = await agentAsDatasource.getAll();
    return list ?? [];
  }

  Future<void> deleteAll() async {
    await agentAsDatasource.deleteAll();
    return;
  }
}
