import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_rp_function/response_on_call_rp.m.dart';
import 'package:aconnec_1109_x/src/model/idp.m.p.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';

class OnCallRpIdpListResponseModelPersistence
    implements ModelJson<OnCallRpIdpListResponseModel> {
  @override
  List<OnCallRpIdpListResponseModel> fromArrayJson(List arrJson) {
    // TODO: implement fromArrayJson
    throw UnimplementedError();
  }

  @override
  OnCallRpIdpListResponseModel fromJson(Map<String, dynamic> json) {
    return OnCallRpIdpListResponseModel(
      data: IdpModelPersistence().fromArrayJson(
        json[OnCallRpIdpListResponseModelFields.data] ?? [],
      ),
    );
  }

  @override
  Map<String, dynamic> toJson(OnCallRpIdpListResponseModel json) {
    return <String, dynamic>{
      OnCallRpIdpListResponseModelFields.data: json.data,
    };
  }
}
