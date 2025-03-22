import 'package:aconnec_1109_x/src/features/authenticate/service/di/authentication.firebase.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/features/user/model/user_profile.st.dart';
import 'package:aconnec_1109_x/src/features/user/model/user_profile_data.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model_new.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@singleton
@Injectable()
class UserProfileViewModel extends CustomViewModel<UserProfilePageState> {
  final KycFirebaseService _kycFirebaseService;
  final AuthenticationFirebaseService _authenticationFirebaseService;
  UserProfileViewModel(
      this._kycFirebaseService, this._authenticationFirebaseService);
  final _stateSubject = BehaviorSubject<UserProfilePageState>.seeded(
      const UserProfilePageState());

  Stream<UserProfilePageState> get state => _stateSubject;

  @override
  void dispose() {
    _stateSubject.close();
  }

  @override
  void updateState(UserProfilePageState updateValue) {
    // TODO: implement updateState
  }

  Future<UserProfileData> loadProfile() async {
    try {
      await Future.delayed(const Duration(milliseconds: 1000));
      final kycIdCardInformation =
          await _kycFirebaseService.getIdCardInformation();
      final userProfile = await _authenticationFirebaseService.getCurrentUser();
      final userProfileData = UserProfileData(
        fullNameTh:
            '${kycIdCardInformation?.firstNameThai ?? 'n/a'} ${kycIdCardInformation?.lastNameThai ?? 'n/a'}',
        fullNameEng:
            '${kycIdCardInformation?.firstNameEng ?? 'n/a'} ${kycIdCardInformation?.lastNameEng ?? 'n/a'}',
        mobilePhone: userProfile.mobileNumber,
      );
      return userProfileData;
    } catch (e) {
      throw Exception(e);
    }
  }
}
