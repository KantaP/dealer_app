import 'dart:convert';

import 'package:aconnec_1109_x/src/model/idp_as.m.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_rp_function/utility_idp_identifier.m.dart';

class UtilityIdpIdentifierModelPersistence
    implements ModelJson<UtilityIdpIdentifierModel> {
  @override
  List<UtilityIdpIdentifierModel> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  UtilityIdpIdentifierModel fromJson(Map<String, dynamic> json) {
    return UtilityIdpIdentifierModel(
      nodeId: json[UtilityIdpIdentifierModelFields.nodeId] ?? '',
      onTheFlySupport:
          json[UtilityIdpIdentifierModelFields.onTheFlySupport] ?? false,
      nodeDetail: IdpAsNodeDetailModelPersistence().fromJson(
          Map<String, dynamic>.from(
              json[UtilityIdpIdentifierModelFields.nodeDetail])),
    );
  }

  @override
  Map<String, dynamic> toJson(UtilityIdpIdentifierModel json) {
    return {
      UtilityIdpIdentifierModelFields.nodeId: json.nodeId,
      UtilityIdpIdentifierModelFields.onTheFlySupport: json.onTheFlySupport,
      UtilityIdpIdentifierModelFields.nodeDetail:
          IdpAsNodeDetailModelPersistence().toJson(json.nodeDetail),
    };
  }

  Map<String, dynamic> toLocalData(UtilityIdpIdentifierModel json) {
    return {
      UtilityIdpIdentifierModelFields.nodeId: json.nodeId,
      UtilityIdpIdentifierModelFields.onTheFlySupport:
          (json.onTheFlySupport == true) ? 1 : 0,
      UtilityIdpIdentifierModelFields.nodeDetail:
          jsonEncode(IdpAsNodeDetailModelPersistence().toJson(json.nodeDetail)),
    };
  }

  UtilityIdpIdentifierModel fromLocalData(Map<String, dynamic> json) {
    print('on the fly');
    print(json[UtilityIdpIdentifierModelFields.onTheFlySupport]);
    return UtilityIdpIdentifierModel(
      nodeId: json[UtilityIdpIdentifierModelFields.nodeId] ?? '',
      nodeDetail: IdpAsNodeDetailModelPersistence().fromJson(
        Map<String, dynamic>.from(
            jsonDecode(json[IdpAsModelFields.nodeDetail])),
      ),
      onTheFlySupport:
          (json[UtilityIdpIdentifierModelFields.onTheFlySupport] == 1)
              ? true
              : false,
    );
  }

  List<UtilityIdpIdentifierModel> fromArrayLocalData(List arrJson) {
    return arrJson
        .map((e) => fromLocalData(Map<String, dynamic>.from(e)))
        .toList();
  }
}
