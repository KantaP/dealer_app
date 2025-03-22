import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_rp_function/public_idp_param.m.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';

class PublicIdpParamModelPersistence implements ModelJson<PublicIdpParamModel> {
  @override
  List<PublicIdpParamModel> fromArrayJson(List arrJson) {
    // TODO: implement fromArrayJson
    throw UnimplementedError();
  }

  @override
  PublicIdpParamModel fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson(PublicIdpParamModel json) {
    return {
      PublicIdpParamModelFields.identifier: json.identifier,
    };
  }
}
