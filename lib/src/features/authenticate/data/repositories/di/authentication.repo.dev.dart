import 'package:injectable/injectable.dart';
import 'package:aconnec_1109_x/src/di/components/injection.dart';
import 'package:aconnec_1109_x/src/features/authenticate/data/repositories/authentication.repo.dart';

@Environment(Env.development)
@Injectable(as: AuthenticationRepository)
class AuthenticationRepositoryDev extends AuthenticationRepository {
  AuthenticationRepositoryDev(super.userDataSource);
}
