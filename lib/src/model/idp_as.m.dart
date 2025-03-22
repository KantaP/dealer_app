import 'dart:convert';

import 'package:aconnec_1109_x/src/model/model.abs.dart';

class IdpAsModel implements Model<IdpAsModel> {
  String _nodeId = '';
  IdpAsNodeDetailModel _nodeDetail = IdpAsNodeDetailModel();

  IdpAsModel({
    String nodeId = '',
    IdpAsNodeDetailModel? nodeDetail,
  }) {
    _nodeId = nodeId;
    _nodeDetail = nodeDetail ?? IdpAsNodeDetailModel();
  }

  String get nodeId => _nodeId;
  IdpAsNodeDetailModel get nodeDetail => _nodeDetail;

  @override
  IdpAsModel copyWith(Map<String, dynamic> value) {
    return IdpAsModel(
      nodeDetail: value[IdpAsModelFields.nodeDetail] ?? _nodeDetail,
      nodeId: value[IdpAsModelFields.nodeId] ?? _nodeId,
    );
  }
}

class IdpAsModelFields {
  IdpAsModelFields._();

  static const String nodeId = 'node_id';
  static const String nodeDetail = 'node_name';
}

class IdpAsModelPersistence implements ModelJson<IdpAsModel> {
  @override
  List<IdpAsModel> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  IdpAsModel fromJson(Map<String, dynamic> json) {
    return IdpAsModel(
      nodeId: json[IdpAsModelFields.nodeId] ?? '',
      nodeDetail: IdpAsNodeDetailModelPersistence().fromJson(
        Map<String, dynamic>.from(json[IdpAsModelFields.nodeDetail]),
      ),
    );
  }

  @override
  Map<String, dynamic> toJson(IdpAsModel json) {
    return {
      IdpAsModelFields.nodeId: json.nodeId,
      IdpAsModelFields.nodeDetail:
          IdpAsNodeDetailModelPersistence().toJson(json.nodeDetail),
    };
  }

  Map<String, dynamic> toLocalData(IdpAsModel json) {
    return {
      IdpAsModelFields.nodeId: json.nodeId,
      IdpAsModelFields.nodeDetail:
          jsonEncode(IdpAsNodeDetailModelPersistence().toJson(json.nodeDetail)),
    };
  }

  IdpAsModel fromLocalData(Map<String, dynamic> json) {
    return IdpAsModel(
      nodeId: json[IdpAsModelFields.nodeId] ?? '',
      nodeDetail: IdpAsNodeDetailModelPersistence().fromJson(
        Map<String, dynamic>.from(
            jsonDecode(json[IdpAsModelFields.nodeDetail])),
      ),
    );
  }

  List<IdpAsModel> fromArrayLocalData(List arrJson) {
    return arrJson
        .map((e) => fromLocalData(Map<String, dynamic>.from(e)))
        .toList();
  }
}

class IdpAsNodeDetailModel implements Model<IdpAsNodeDetailModel> {
  String _industryCode = '';
  String _companyCode = '';
  String _marketingNameTh = '';
  String _marketingNameEn = '';

  IdpAsNodeDetailModel({
    String industryCode = '',
    String companyCode = '',
    String marketingNameTh = '',
    String marketingNameEn = '',
  }) {
    _industryCode = industryCode;
    _companyCode = companyCode;
    _marketingNameTh = marketingNameTh;
    _marketingNameEn = marketingNameEn;
  }

  String get industryCode => _industryCode;
  String get companyCode => _companyCode;
  String get marketingNameTh => _marketingNameTh;
  String get marketingNameEn => _marketingNameEn;

  @override
  IdpAsNodeDetailModel copyWith(Map<String, dynamic> value) {
    return IdpAsNodeDetailModel(
      industryCode:
          value[IdpAsNodeDetailModelFields.industryCode] ?? _industryCode,
      companyCode:
          value[IdpAsNodeDetailModelFields.companyCode] ?? _companyCode,
      marketingNameEn:
          value[IdpAsNodeDetailModelFields.marketingNameEn] ?? _marketingNameEn,
      marketingNameTh:
          value[IdpAsNodeDetailModelFields.marketingNameTh] ?? _marketingNameTh,
    );
  }
}

class IdpAsNodeDetailModelFields {
  IdpAsNodeDetailModelFields._();

  static const String industryCode = 'industry_code';
  static const String companyCode = 'company_code';
  static const String marketingNameTh = 'marketing_name_th';
  static const String marketingNameEn = 'marketing_name_en';
}

class IdpAsNodeDetailModelPersistence
    implements ModelJson<IdpAsNodeDetailModel> {
  @override
  List<IdpAsNodeDetailModel> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  IdpAsNodeDetailModel fromJson(Map<String, dynamic> json) {
    return IdpAsNodeDetailModel(
      companyCode: json[IdpAsNodeDetailModelFields.companyCode] ?? 0,
      industryCode: json[IdpAsNodeDetailModelFields.industryCode] ?? 0,
      marketingNameEn: json[IdpAsNodeDetailModelFields.marketingNameEn] ?? '',
      marketingNameTh: json[IdpAsNodeDetailModelFields.marketingNameTh] ?? '',
    );
  }

  @override
  Map<String, dynamic> toJson(IdpAsNodeDetailModel json) {
    return {
      IdpAsNodeDetailModelFields.companyCode: json.companyCode,
      IdpAsNodeDetailModelFields.industryCode: json.industryCode,
      IdpAsNodeDetailModelFields.marketingNameTh: json.marketingNameTh,
      IdpAsNodeDetailModelFields.marketingNameEn: json.marketingNameEn,
    };
  }
}
