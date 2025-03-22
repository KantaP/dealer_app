import 'package:aconnec_1109_x/src/data/local/di/public_idp_as.ds.dart';
import 'package:aconnec_1109_x/src/model/idp_as.m.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class IdpAsDatasouceRepository {
  final IdpAsDatasource idpAsDatasource;
  IdpAsDatasouceRepository(this.idpAsDatasource);

  Future<IdpAsModel> insert(IdpAsModel item) {
    return idpAsDatasource.insert(item);
  }

  Future<List<IdpAsModel>> getAll() async {
    final list = await idpAsDatasource.getAll();
    return list ?? [];
  }

  Future<void> deleteAll() async {
    await idpAsDatasource.deleteAll();
    return;
  }
}
