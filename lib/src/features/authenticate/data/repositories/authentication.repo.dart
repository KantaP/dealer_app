import 'package:aconnec_1109_x/src/model/user_profile.m.dart';
import 'package:aconnec_1109_x/src/data/local/di/user.ds.dart';

class AuthenticationRepository {
  final UserDataSource _userDataSource;
  AuthenticationRepository(this._userDataSource);

  Future<UserProfileModel> insertUser(UserProfileModel item) {
    return _userDataSource.insert(item);
  }

  Future<List<UserProfileModel>?> getUserByFilter(
      Map<String, dynamic> filters) {
    return _userDataSource.getByFilter(filters);
  }
}
