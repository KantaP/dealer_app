import 'package:aconnec_1109_x/src/model/model.abs.dart';

class UtilityListAsParam implements Model<UtilityListAsParam> {
  String _serviceId = '';

  UtilityListAsParam({String serviceId = ''}) {
    _serviceId = serviceId;
  }

  String get serviceId => _serviceId;

  @override
  UtilityListAsParam copyWith(Map<String, dynamic> value) {
    return UtilityListAsParam(
      serviceId: value[UtilityListAsParamFields.serviceId] ?? _serviceId,
    );
  }
}

class UtilityListAsParamFields {
  UtilityListAsParamFields._();
  static const String serviceId = 'service_id';
}
