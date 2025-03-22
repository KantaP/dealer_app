import 'package:aconnec_1109_x/src/model/model.abs.dart';

class RpCreateRequestModel implements Model<RpCreateRequestModel> {
  String _identifier = '';
  List<String> _idpIdList = [];
  List<DataRequestListModel> _dataRequestList = [];
  String _requestMessage = '';
  bool _byPass = false;

  RpCreateRequestModel({
    String identifier = '',
    List<String> idpIdList = const [],
    List<DataRequestListModel> dataRequestList = const [],
    String requestMessage = '',
    bool byPass = false,
  }) {
    _identifier = identifier;
    _idpIdList = idpIdList;
    _dataRequestList = dataRequestList;
    _requestMessage = requestMessage;
    _byPass = byPass;
  }

  String get identifier => _identifier;
  List<String> get idpIdList => _idpIdList;
  List<DataRequestListModel> get dataRequestList => _dataRequestList;
  String get requestMessage => _requestMessage;
  bool get byPass => _byPass;

  @override
  RpCreateRequestModel copyWith(Map<String, dynamic> value) {
    return RpCreateRequestModel(
      identifier: value[RpCreateRequestModelFields.identifier] ?? _identifier,
      idpIdList: value[RpCreateRequestModelFields.idpIdList] ?? _idpIdList,
      dataRequestList:
          value[RpCreateRequestModelFields.dataRequestList] ?? _dataRequestList,
      requestMessage:
          value[RpCreateRequestModelFields.requestMessage] ?? _requestMessage,
      byPass: value[RpCreateRequestModelFields.byPass] ?? _byPass,
    );
  }
}

class RpCreateRequestModelFields {
  RpCreateRequestModelFields._();
  static const String identifier = 'identifier';
  static const String idpIdList = 'idp_id_list';
  static const String dataRequestList = 'data_request_list';
  static const String requestMessage = 'request_message';

  static const String byPass = 'bypass_identity_check';
}

class RpCreateRequestModelPersistence
    implements ModelJson<RpCreateRequestModel> {
  @override
  List<RpCreateRequestModel> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  RpCreateRequestModel fromJson(Map<String, dynamic> json) {
    return RpCreateRequestModel(
      identifier: json[RpCreateRequestModelFields.identifier] ?? '',
      idpIdList: json[RpCreateRequestModelFields.idpIdList] ?? [],
      dataRequestList: json[RpCreateRequestModelFields.dataRequestList] ?? [],
      requestMessage: json[RpCreateRequestModelFields.requestMessage] ?? '',
      byPass: json[RpCreateRequestModelFields.byPass] ?? false,
    );
  }

  @override
  Map<String, dynamic> toJson(RpCreateRequestModel json) {
    return {
      RpCreateRequestModelFields.identifier: json.identifier,
      RpCreateRequestModelFields.idpIdList: json.idpIdList,
      RpCreateRequestModelFields.dataRequestList:
          DataRequestListModelPersistence().toArrayJson(json.dataRequestList),
      RpCreateRequestModelFields.requestMessage: json.requestMessage,
      RpCreateRequestModelFields.byPass: json.byPass,
    };
  }
}

class DataRequestListModel implements Model<DataRequestListModel> {
  int _minAs = 1;
  List<String> _asIdList = [];
  String _serviceId = '';

  DataRequestListModel({
    int minAs = 1,
    List<String> asIdList = const [],
    String serviceId = '',
    bool byPass = false,
  }) {
    _minAs = minAs;
    _asIdList = asIdList;
    _serviceId = serviceId;
  }

  int get minAs => _minAs;
  List<String> get asIdList => _asIdList;
  String get serviceId => _serviceId;

  @override
  DataRequestListModel copyWith(Map<String, dynamic> value) {
    return DataRequestListModel(
      minAs: value[DataRequestListModelFields.minAs] ?? _minAs,
      asIdList: value[DataRequestListModelFields.asIdList] ?? _asIdList,
      serviceId: value[DataRequestListModelFields.serviceId] ?? _serviceId,
    );
  }
}

class DataRequestListModelFields {
  DataRequestListModelFields._();
  static const String minAs = 'min_as';
  static const String asIdList = 'as_id_list';
  static const String serviceId = 'service_id';
}

class DataRequestListModelPersistence
    implements ModelJson<DataRequestListModel> {
  @override
  List<DataRequestListModel> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  DataRequestListModel fromJson(Map<String, dynamic> json) {
    return DataRequestListModel(
      minAs: json[DataRequestListModelFields.minAs] ?? 1,
      asIdList: json[DataRequestListModelFields.asIdList] ?? [],
      serviceId: json[DataRequestListModelFields.serviceId] ?? '',
    );
  }

  @override
  Map<String, dynamic> toJson(DataRequestListModel json) {
    return {
      DataRequestListModelFields.minAs: json.minAs,
      DataRequestListModelFields.asIdList: json.asIdList,
      DataRequestListModelFields.serviceId: json.serviceId,
    };
  }

  List<Map<String, dynamic>> toArrayJson(List<DataRequestListModel> arr) {
    return arr.map((e) => toJson(e)).toList();
  }
}
