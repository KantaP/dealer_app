import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(order: -2)
class SharedPreferencesHelper {
  // final SharedPreferences _pref;
  // SharedPreferencesHelper(this._pref);

  // First time open app
  Future<bool> setPassFirstTime(bool passFirstTime) async {
    final _pref = await SharedPreferences.getInstance();
    return _pref.setBool('passFirstTime', passFirstTime);
  }

  Future<bool?> getPassFirstTime() async {
    final _pref = await SharedPreferences.getInstance();
    return _pref.getBool('passFirstTime');
  }
  // End

  // Authentication
  Future<bool> setLoggedIn(bool logged) async {
    final _pref = await SharedPreferences.getInstance();
    return _pref.setBool('loggedIn', logged);
  }

  Future<bool?> getLoggedIn() async {
    final _pref = await SharedPreferences.getInstance();
    return _pref.getBool('loggedIn');
  }

  Future<bool> setAnonymously(bool value) async {
    final _pref = await SharedPreferences.getInstance();
    return _pref.setBool('anonymously', value);
  }

  Future<bool?> getAnonymously() async {
    final _pref = await SharedPreferences.getInstance();
    return _pref.getBool('anonymously');
  }
  // End

  //User data
  // Future<bool> setUserProfile(String value) {
  //   return _pref.setString("user_todolist", value);
  // }

  // String? getUserProfile() {
  //   return _pref.getString("user_todolist");
  // }
  // End

  //idp data
  Future<bool> setPublicIdpLoaded(bool value) async {
    final _pref = await SharedPreferences.getInstance();
    return _pref.setBool('alreay_load_public_idp', value);
  }

  Future<bool?> getPublicIdpLoaded() async {
    final _pref = await SharedPreferences.getInstance();
    return _pref.getBool('alreay_load_public_idp');
  }

  Future<bool> setAgentIdpLoaded(bool value) async {
    final _pref = await SharedPreferences.getInstance();
    return _pref.setBool('alreay_load_agent_idp', value);
  }

  Future<bool?> getAgentIdpLoaded() async {
    final _pref = await SharedPreferences.getInstance();
    return _pref.getBool('alreay_load_agent_idp');
  }

  Future<bool> setIdpAsLoaded(bool value) async {
    final _pref = await SharedPreferences.getInstance();
    return _pref.setBool('alreay_load_idp_as', value);
  }

  Future<bool?> getIdpAsLoaded() async {
    final _pref = await SharedPreferences.getInstance();
    return _pref.getBool('alreay_load_idp_as');
  }

  Future<bool> setAgentAsLoaded(bool value) async {
    final _pref = await SharedPreferences.getInstance();
    return _pref.setBool('alreay_load_agent_as', value);
  }

  Future<bool?> getAgentAsLoaded() async {
    final _pref = await SharedPreferences.getInstance();
    return _pref.getBool('alreay_load_agent_as');
  }

  Future<bool> setUtilityPublicIdpLoaded(bool value) async {
    final _pref = await SharedPreferences.getInstance();
    return _pref.setBool('alreay_load_utility_public_idp', value);
  }

  Future<bool?> getUtilityPublicIdpLoaded() async {
    final _pref = await SharedPreferences.getInstance();
    return _pref.getBool('alreay_load_utility_public_idp');
  }

  Future<bool> setNdidRef(String jsonEncode) async {
    final _pref = await SharedPreferences.getInstance();
    return _pref.setString('ndid_ref', jsonEncode);
  }

  Future<String?> getNdidRef() async {
    final _pref = await SharedPreferences.getInstance();
    return _pref.getString('ndid_ref');
  }

  Future<bool> setNdidAttempt(int count) async {
    final _pref = await SharedPreferences.getInstance();
    return _pref.setInt('ndid_attempt', count);
  }

  Future<int?> getNdidAttempt() async {
    final _pref = await SharedPreferences.getInstance();
    return _pref.getInt('ndid_attempt');
  }
  //end

  //general
  Future<bool> setAfterEnterPinRoute(String route) async {
    final _pref = await SharedPreferences.getInstance();
    return _pref.setString('after_enter_pin_route', route);
  }

  Future<String?> getAfterEnterPinRoute() async {
    final _pref = await SharedPreferences.getInstance();
    return _pref.getString('after_enter_pin_route');
  }

  Future<bool> updateOneTimeKycWarningExpired() async {
    final _pref = await SharedPreferences.getInstance();
    final now = DateTime.now().toUtc().millisecondsSinceEpoch;
    return _pref.setInt('one_time_kyc_warning_expired', now);
  }

  Future<bool> oneTimeKycWarningIsExpired() async {
    final _pref = await SharedPreferences.getInstance();
    final expiredValue = _pref.getInt('one_time_kyc_warning_expired');
    if (expiredValue == null) {
      return true;
    }
    final expireDate = DateTime.fromMillisecondsSinceEpoch(expiredValue);
    final now = DateTime.now().toUtc();
    // print(expireDate);
    // print(now);
    final diff = now.difference(expireDate).inDays;
    // print(diff);
    if (diff == 0) {
      return false;
    }
    return true;
  }

  //end

  //set user pass
  Future<bool> setUsername(String username) async {
    final _pref = await SharedPreferences.getInstance();
    return _pref.setString('username', username);
  }

  Future<bool> setPassword(String password) async {
    final _pref = await SharedPreferences.getInstance();
    return _pref.setString('password', password);
  }

  Future<String?> getUsername() async {
    final _pref = await SharedPreferences.getInstance();
    return _pref.getString('username');
  }

  Future<String?> getPassword() async {
    final _pref = await SharedPreferences.getInstance();
    return _pref.getString('password');
  }
  //end
}
