import 'package:injectable/injectable.dart';
import 'package:aconnec_1109_x/src/di/components/injection.dart';
import 'package:aconnec_1109_x/src/features/authenticate/data/repositories/authentication.repo.dart';

@Environment(Env.production)
@Injectable(as: AuthenticationRepository)
class AuthenticationRepositoryProd extends AuthenticationRepository {
  AuthenticationRepositoryProd(super.userDataSource);
}
