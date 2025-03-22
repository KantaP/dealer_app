import 'dart:io';

import 'package:aconnec_1109_x/src/data/local/shared_preferences.dart';
import 'package:aconnec_1109_x/src/features/authenticate/bindings/authenticate.binding.dart';
import 'package:aconnec_1109_x/src/features/dashboard/model/home.st.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model_new.abs.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/widgets/dialogs/kyc_warning_dialog.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

@singleton
@Injectable()
class HomeViewModel extends CustomViewModel<HomePageState> {
  HomeViewModel(this._preferencesHelper);
  final SharedPreferencesHelper _preferencesHelper;
  final authenService = AuthenticateBinding.authenticationFirebaseService;

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void updateState(HomePageState updateValue) {
    // TODO: implement updateState
  }

  Future<void> checkKyc() async {
    Future.delayed(const Duration(seconds: 1), () async {
      final user = await authenService.getCurrentUser();

      if (user.uid.isEmpty) return;
      if (user.kycLevel == 2) return;
      kycWarningDialog();
    });
  }

  Future<void> kycWarningDialog() async {
    final isExpiredKycWarning =
        await _preferencesHelper.oneTimeKycWarningIsExpired();
    if (isExpiredKycWarning) {
      Future.delayed(const Duration(milliseconds: 1000)).then((_) {
        _preferencesHelper.updateOneTimeKycWarningExpired();
        openKycWarningDialog();
      });
    }
  }

  Future<void> open1109xUrlClosedBeta() async {
    const String url = 'https://link.1109x.com/closed-beta';
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: (Platform.isAndroid) ? false : true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
