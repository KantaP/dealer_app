import 'package:aconnec_1109_x/src/data/local/shared_preferences.dart';

class NdidServiceRepository {
  final String serviceId01;
  final String serviceId02;
  final SharedPreferencesHelper sharedPreferencesHelper;

  NdidServiceRepository(
      {required this.serviceId01,
      required this.serviceId02,
      required this.sharedPreferencesHelper});

  Future<bool> saveReferrence(String encodeJson) async {
    return sharedPreferencesHelper.setNdidRef(encodeJson);
  }

  Future<String?> getReferrence() async {
    return sharedPreferencesHelper.getNdidRef();
  }

  Future<bool> saveNdidAttempt(int count) async {
    return sharedPreferencesHelper.setNdidAttempt(count);
  }

  Future<int?> getNdidAttempt() async {
    return sharedPreferencesHelper.getNdidAttempt();
  }
}
