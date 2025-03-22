import 'package:injectable/injectable.dart';
import 'package:aconnec_1109_x/src/di/components/injection.dart';
import 'package:aconnec_1109_x/src/features/authenticate/data/repositories/authentication.repo.dart';

@Environment(Env.stagging)
@Injectable(as: AuthenticationRepository)
class AuthenticationRepositoryStag extends AuthenticationRepository {
  AuthenticationRepositoryStag(super.userDataSource);
}
