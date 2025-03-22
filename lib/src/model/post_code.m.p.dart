import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/model/post_code.m.dart';

class PostCodeModelPersistence implements ModelJson<PostCodeModel> {
  @override
  List<PostCodeModel> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(e)).toList();
  }

  @override
  PostCodeModel fromJson(Map<String, dynamic> json) {
    return PostCodeModel(
      postCode: json[PostCodeModelFields.postCode],
      districtId: json[PostCodeModelFields.districtId],
      provinceId: json[PostCodeModelFields.provinceId],
      subDistrictId: json[PostCodeModelFields.subDistrictId],
    );
  }

  @override
  Map<String, dynamic> toJson(PostCodeModel json) {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
