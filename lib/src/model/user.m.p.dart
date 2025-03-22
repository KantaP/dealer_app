import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/model/user.m.dart';

class UserModelPersistence implements ModelJson<UserModel> {
  @override
  List<UserModel> fromArrayJson(List<dynamic> arrJson) {
    return arrJson.map((e) => fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  UserModel fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson(UserModel json) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
