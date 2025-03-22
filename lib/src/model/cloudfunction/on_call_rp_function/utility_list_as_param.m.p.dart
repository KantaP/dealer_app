import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_rp_function/utility_list_as_param.m.dart';

class UtilityListAsParamPersistence implements ModelJson<UtilityListAsParam> {
  @override
  List<UtilityListAsParam> fromArrayJson(List arrJson) {
    // TODO: implement fromArrayJson
    throw UnimplementedError();
  }

  @override
  UtilityListAsParam fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson(UtilityListAsParam json) {
    return {
      UtilityListAsParamFields.serviceId: json.serviceId,
    };
  }
}
