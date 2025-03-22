import 'package:aconnec_1109_x/src/model/model.abs.dart';

class NdidRefResponseModel implements Model<NdidRefResponseModel> {
  String _refId = '';
  String _asDataRef = '';
  String _callbackRef = '';
  String _requestId = '';
  String _type = '';
  String _idpName = '';
  String _createdAt = '';

  NdidRefResponseModel(
      {String refId = '',
      String asDataRef = '',
      String callbackRef = '',
      String requestId = '',
      String type = '',
      String idpName = '',
      String createdAt = ''}) {
    _refId = refId;
    _asDataRef = asDataRef;
    _callbackRef = callbackRef;
    _requestId = requestId;
    _type = type;
    _idpName = idpName;
    _createdAt = createdAt;
  }

  String get refId => _refId;
  String get asDataRef => _asDataRef;
  String get callbackRef => _callbackRef;
  String get requestId => _requestId;
  String get type => _type;
  String get idpName => _idpName;
  String get createdAt => _createdAt;

  @override
  NdidRefResponseModel copyWith(Map<String, dynamic> value) {
    return NdidRefResponseModel(
      refId: value[NdidRefResponseModelFields.refId] ?? _refId,
      asDataRef: value[NdidRefResponseModelFields.asDataRef] ?? _asDataRef,
      callbackRef:
          value[NdidRefResponseModelFields.callbackRef] ?? _callbackRef,
      requestId: value[NdidRefResponseModelFields.requestId] ?? _requestId,
      type: value[NdidRefResponseModelFields.type] ?? _type,
      idpName: value[NdidRefResponseModelFields.idpName] ?? _idpName,
      createdAt: value[NdidRefResponseModelFields.createdAt] ?? _createdAt,
    );
  }
}

class NdidRefResponseModelFields {
  NdidRefResponseModelFields._();

  static const String refId = 'reference_id';
  static const String asDataRef = 'asdata_ref';
  static const String callbackRef = 'callback_ref';
  static const String requestId = 'request_id';
  static const String type = 'type';
  static const String idpName = 'idpName';
  static const String createdAt = 'created_at';
}

class NdidRefResponseModelPersistence
    implements ModelJson<NdidRefResponseModel> {
  @override
  List<NdidRefResponseModel> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  NdidRefResponseModel fromJson(Map<String, dynamic> json) {
    return NdidRefResponseModel(
      refId: json[NdidRefResponseModelFields.refId] ?? '',
      asDataRef: json[NdidRefResponseModelFields.asDataRef] ?? '',
      callbackRef: json[NdidRefResponseModelFields.callbackRef] ?? '',
      requestId: json[NdidRefResponseModelFields.requestId] ?? '',
      type: json[NdidRefResponseModelFields.type] ?? '',
      idpName: json[NdidRefResponseModelFields.idpName] ?? '',
      createdAt: json[NdidRefResponseModelFields.createdAt] ?? '',
    );
  }

  @override
  Map<String, dynamic> toJson(NdidRefResponseModel json) {
    return {
      NdidRefResponseModelFields.refId: json.refId,
      NdidRefResponseModelFields.asDataRef: json.asDataRef,
      NdidRefResponseModelFields.callbackRef: json.callbackRef,
      NdidRefResponseModelFields.requestId: json.requestId,
      NdidRefResponseModelFields.type: json.type,
      NdidRefResponseModelFields.idpName: json.idpName,
      NdidRefResponseModelFields.createdAt: json.createdAt,
    };
  }
}
