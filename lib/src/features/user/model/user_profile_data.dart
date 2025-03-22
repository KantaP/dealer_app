import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_data.freezed.dart';
part 'user_profile_data.g.dart';

@freezed
class UserProfileData with _$UserProfileData {
  const factory UserProfileData({
    @Default('') String fullNameTh,
    @Default('') String fullNameEng,
    @Default('') String mobilePhone,
  }) = _UserProfileData;

  factory UserProfileData.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDataFromJson(json);
}
