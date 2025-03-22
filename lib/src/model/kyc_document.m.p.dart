import 'package:aconnec_1109_x/src/model/model.abs.dart';

import 'kyc_document.m.dart';

class KycDocumentsModelPersistence implements ModelJson<KycDocumentsModel> {
  @override
  List<KycDocumentsModel> fromArrayJson(List arrJson) {
    // TODO: implement fromArrayJson
    throw UnimplementedError();
  }

  @override
  KycDocumentsModel fromJson(Map<String, dynamic> json) {
    return KycDocumentsModel(
      frontIdCardPath: json[KycDocumentsModelFields.frontIdCardPath],
      backIdCardPath: json[KycDocumentsModelFields.backIdCardPath],
      selfiePath: json[KycDocumentsModelFields.selfiePath],
    );
  }

  @override
  Map<String, dynamic> toJson(KycDocumentsModel json) {
    return {
      KycDocumentsModelFields.frontIdCardPath: json.frontIdCardPath,
      KycDocumentsModelFields.backIdCardPath: json.backIdCardPath,
      KycDocumentsModelFields.selfiePath: json.selfiePath,
    };
  }
}
