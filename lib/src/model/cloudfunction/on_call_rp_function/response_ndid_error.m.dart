import 'package:aconnec_1109_x/src/model/model.abs.dart';

class NdidErrorResponseModel implements Model<NdidErrorResponseModel> {
  int _errorCode = 0;
  String _idpId = '';

  NdidErrorResponseModel({int errorCode = 0, String idpId = ''}) {
    _errorCode = errorCode;
    _idpId = idpId;
  }

  int get errorCode => _errorCode;
  String get idpId => _idpId;

  @override
  NdidErrorResponseModel copyWith(Map<String, dynamic> value) {
    return NdidErrorResponseModel(
      errorCode: value[NdidErrorResponseModelFields.errorCode] ?? _errorCode,
      idpId: value[NdidErrorResponseModelFields.idpId] ?? _idpId,
    );
  }
}

class NdidErrorResponseModelFields {
  NdidErrorResponseModelFields._();

  static const String errorCode = 'error_code';
  static const String idpId = 'idp_id';
}

class NdidErrorResponseModelPersistence
    implements ModelJson<NdidErrorResponseModel> {
  @override
  List<NdidErrorResponseModel> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  NdidErrorResponseModel fromJson(Map<String, dynamic> json) {
    return NdidErrorResponseModel(
      errorCode: json[NdidErrorResponseModelFields.errorCode] ?? 0,
      idpId: json[NdidErrorResponseModelFields.idpId] ?? '',
    );
  }

  @override
  Map<String, dynamic> toJson(NdidErrorResponseModel json) {
    return {
      NdidErrorResponseModelFields.errorCode: json.errorCode,
      NdidErrorResponseModelFields.idpId: json.idpId,
    };
  }
}
