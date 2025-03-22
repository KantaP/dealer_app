import 'package:aconnec_1109_x/src/model/user_profile.m.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class OverviewPageState implements IPageState<OverviewPageState> {
  bool _isLoading = false;

  UserProfileModel _user = UserProfileModel();

  OverviewPageState({bool isLoading = false, UserProfileModel? user}) {
    _isLoading = isLoading;
    _user = user ?? UserProfileModel();
  }

  bool get isLoading => _isLoading;
  UserProfileModel get user => _user;

  @override
  OverviewPageState copyWith(Map<String, dynamic> value) {
    return OverviewPageState(
      isLoading: value[OverviewPageStateFields.isLoading] ?? _isLoading,
      user: value[OverviewPageStateFields.user] ?? _user,
    );
  }
}

class OverviewPageStateFields {
  OverviewPageStateFields._();

  static const String isLoading = 'isLoading';
  static const String user = 'user';
}
