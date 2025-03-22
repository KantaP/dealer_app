import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/model/user_profile.m.dart';

class UserModel implements Model<UserModel> {
  UserProfileModel? _profile;

  UserModel({
    UserProfileModel? profile,
  }) {
    _profile = profile;
  }

  UserProfileModel? get profile => _profile;

  @override
  UserModel copyWith(Map<String, dynamic> value) {
    return UserModel(
      profile: value[UserModelFields.profile] ?? _profile,
    );
  }
}

class UserModelFields {
  UserModelFields._();

  static const String profile = 'profile';
}
