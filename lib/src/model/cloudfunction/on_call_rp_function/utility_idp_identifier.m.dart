import 'package:aconnec_1109_x/src/model/idp_as.m.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';

class UtilityIdpIdentifierModel implements Model<UtilityIdpIdentifierModel> {
  bool _onTheFlySupport = false;
  String _nodeId = '';
  IdpAsNodeDetailModel _nodeDetail = IdpAsNodeDetailModel();

  UtilityIdpIdentifierModel({
    bool onTheFlySupport = false,
    String nodeId = '',
    IdpAsNodeDetailModel? nodeDetail,
  }) {
    _onTheFlySupport = onTheFlySupport;
    _nodeId = nodeId;
    _nodeDetail = nodeDetail ?? IdpAsNodeDetailModel();
  }

  bool get onTheFlySupport => _onTheFlySupport;
  String get nodeId => _nodeId;
  IdpAsNodeDetailModel get nodeDetail => _nodeDetail;

  @override
  UtilityIdpIdentifierModel copyWith(Map<String, dynamic> value) {
    return UtilityIdpIdentifierModel(
      nodeId: value[UtilityIdpIdentifierModelFields.nodeId] ?? _nodeId,
      onTheFlySupport: value[UtilityIdpIdentifierModelFields.onTheFlySupport] ??
          _onTheFlySupport,
      nodeDetail:
          value[UtilityIdpIdentifierModelFields.nodeDetail] ?? _nodeDetail,
    );
  }
}

class UtilityIdpIdentifierModelFields {
  UtilityIdpIdentifierModelFields._();

  static const String nodeId = 'node_id';
  static const String onTheFlySupport = 'on_the_fly_support';
  static const String nodeDetail = 'node_name';
}
