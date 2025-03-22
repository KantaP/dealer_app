import 'package:aconnec_1109_x/src/data/local/di/public_idp.ds.dart';
import 'package:aconnec_1109_x/src/model/idp.m.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class IdpDatasouceRepository {
  final IdpDataSource idpDataSource;
  IdpDatasouceRepository(this.idpDataSource);

  Future<IdpModel> insert(IdpModel item) {
    return idpDataSource.insert(item);
  }

  Future<List<IdpModel>> getAll() async {
    final list = await idpDataSource.getAll();
    return list ?? [];
  }

  Future<void> deleteAll() async {
    await idpDataSource.deleteAll();
    return;
  }
}
