import 'package:aconnec_1109_x/src/model/model.abs.dart';

class NdidTermModel implements Model<NdidTermModel> {
  bool _accepted = false;

  NdidTermModel({final bool accepted = false}) {
    _accepted = accepted;
  }

  bool get accepted => _accepted;

  @override
  NdidTermModel copyWith(Map<String, dynamic> value) {
    return NdidTermModel(
      accepted: value[NdidTermModelFields.accepted] ?? _accepted,
    );
  }
}

class NdidTermModelFields {
  NdidTermModelFields._();
  static const String accepted = 'accepted';
}

class NdidTermModelPersistence implements ModelJson<NdidTermModel> {
  @override
  List<NdidTermModel> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(e)).toList();
  }

  @override
  NdidTermModel fromJson(Map<String, dynamic> json) {
    return NdidTermModel(
      accepted: json[NdidTermModelFields.accepted],
    );
  }

  @override
  Map<String, dynamic> toJson(NdidTermModel json) {
    return {
      NdidTermModelFields.accepted: json.accepted,
    };
  }
}
