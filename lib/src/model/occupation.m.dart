import 'package:aconnec_1109_x/src/model/model.abs.dart';

class OccupationModel implements Model<OccupationModel> {
  int _id = 0;
  String _th = '';
  String _en = '';
  int _score = 0;

  OccupationModel({
    final int id = 0,
    final String th = '',
    final String en = '',
    final int score = 0,
  }) {
    _id = id;
    _th = th;
    _en = en;
    _score = score;
  }

  int get id => _id;
  String get th => _th;
  String get en => _en;
  int get score => _score;

  @override
  OccupationModel copyWith(Map<String, dynamic> value) {
    return OccupationModel(
      id: value[OccupationModelFields.id] ?? _id,
      th: value[OccupationModelFields.th] ?? _th,
      en: value[OccupationModelFields.en] ?? _en,
      score: value[OccupationModelFields.score] ?? _score,
    );
  }
}

class OccupationModelFields {
  OccupationModelFields._();

  static const String id = 'id';
  static const String th = 'th';
  static const String en = 'en';
  static const String score = 'score';
}

class OccupationGroupModel implements Model<OccupationGroupModel> {
  int _id = 0;
  String _groupName = '';
  int _score = 0;
  bool _hasSubOccupation = false;
  bool _autoReject = false;

  OccupationGroupModel({
    int id = 0,
    String groupName = '',
    int score = 0,
    bool hasSubOccupation = false,
    bool autoReject = false,
  }) {
    _id = id;
    _groupName = groupName;
    _score = score;
    _hasSubOccupation = hasSubOccupation;
    _autoReject = autoReject;
  }

  int get id => _id;
  String get groupName => _groupName;
  int get score => _score;
  bool get hasSubOccupation => _hasSubOccupation;
  bool get autoReject => _autoReject;

  @override
  OccupationGroupModel copyWith(Map<String, dynamic> value) {
    return OccupationGroupModel(
      id: value[OccupationGroupModelFields.id] ?? _id,
      groupName: value[OccupationGroupModelFields.groupName] ?? _groupName,
      score: value[OccupationGroupModelFields.score] ?? _score,
      hasSubOccupation: value[OccupationGroupModelFields.hasSubOccupation] ??
          _hasSubOccupation,
      autoReject: value[OccupationGroupModelFields.autoReject] ?? _autoReject,
    );
  }
}

class OccupationGroupModelFields {
  OccupationGroupModelFields._();
  static const String id = 'id';
  static const String groupName = 'group_name';
  static const String score = 'score';
  static const String hasSubOccupation = 'has_sub_occupation';
  static const String autoReject = 'auto_reject';
}

class OccupationListItemModel implements Model<OccupationListItemModel> {
  int _id = 0;
  int _groupId = 0;
  String _occupationName = '';
  int _score = 0;
  bool _needInformation = false;

  OccupationListItemModel({
    int id = 0,
    int groupId = 0,
    String occupationName = '',
    int score = 0,
    bool needInformation = false,
  }) {
    _id = id;
    _groupId = groupId;
    _occupationName = occupationName;
    _score = score;
    _needInformation = needInformation;
  }

  int get id => _id;
  int get groupId => _groupId;
  String get occupationName => _occupationName;
  int get score => _score;
  bool get needInformation => _needInformation;

  @override
  OccupationListItemModel copyWith(Map<String, dynamic> value) {
    return OccupationListItemModel(
      id: value[OccupationListItemModelFields.id] ?? _id,
      groupId: value[OccupationListItemModelFields.groupId] ?? _groupId,
      occupationName: value[OccupationListItemModelFields.occupationName] ??
          _occupationName,
      score: value[OccupationListItemModelFields.score] ?? _score,
      needInformation: value[OccupationListItemModelFields.needInformation] ??
          _needInformation,
    );
  }
}

class OccupationListItemModelFields {
  OccupationListItemModelFields._();
  static const String id = 'id';
  static const String groupId = 'group_id';
  static const String occupationName = 'occupation_name';
  static const String score = 'score';
  static const String needInformation = 'need_information';
}
