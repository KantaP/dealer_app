import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/model/occupation.m.dart';

class OccupationModelPersistence implements ModelJson<OccupationModel> {
  @override
  List<OccupationModel> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(e)).toList();
  }

  @override
  OccupationModel fromJson(Map<String, dynamic> json) {
    return OccupationModel(
      id: json[OccupationModelFields.id],
      th: json[OccupationModelFields.th],
      en: json[OccupationModelFields.en],
      score: json[OccupationModelFields.score],
    );
  }

  @override
  Map<String, dynamic> toJson(OccupationModel json) {
    return {
      OccupationModelFields.id: json.id,
      OccupationModelFields.th: json.th,
      OccupationModelFields.en: json.en,
      OccupationModelFields.score: json.score,
    };
  }
}

class OccupationGroupModelPersistence
    implements ModelJson<OccupationGroupModel> {
  @override
  List<OccupationGroupModel> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(e)).toList();
  }

  @override
  OccupationGroupModel fromJson(Map<String, dynamic> json) {
    return OccupationGroupModel(
      id: json[OccupationGroupModelFields.id],
      groupName: json[OccupationGroupModelFields.groupName],
      score: json[OccupationGroupModelFields.score],
      hasSubOccupation: json[OccupationGroupModelFields.hasSubOccupation],
      autoReject: json[OccupationGroupModelFields.autoReject],
    );
  }

  @override
  Map<String, dynamic> toJson(OccupationGroupModel json) {
    return {
      OccupationGroupModelFields.id: json.id,
      OccupationGroupModelFields.groupName: json.groupName,
      OccupationGroupModelFields.score: json.score,
      OccupationGroupModelFields.hasSubOccupation: json.hasSubOccupation,
      OccupationGroupModelFields.autoReject: json.autoReject,
    };
  }
}

class OccupationListItemModelPersistence
    implements ModelJson<OccupationListItemModel> {
  @override
  List<OccupationListItemModel> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(e)).toList();
  }

  @override
  OccupationListItemModel fromJson(Map<String, dynamic> json) {
    return OccupationListItemModel(
      id: json[OccupationListItemModelFields.id],
      groupId: json[OccupationListItemModelFields.groupId],
      occupationName: json[OccupationListItemModelFields.occupationName],
      score: json[OccupationListItemModelFields.score],
      needInformation: json[OccupationListItemModelFields.needInformation],
    );
  }

  @override
  Map<String, dynamic> toJson(OccupationListItemModel json) {
    return {
      OccupationListItemModelFields.id: json.id,
      OccupationListItemModelFields.groupId: json.groupId,
      OccupationListItemModelFields.occupationName: json.occupationName,
      OccupationListItemModelFields.score: json.score,
      OccupationListItemModelFields.needInformation: json.needInformation,
    };
  }
}
