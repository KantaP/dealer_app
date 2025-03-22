import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_rp_function/response_ndid_error.m.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';

class NdidCallbackResponseModel implements Model<NdidCallbackResponseModel> {
  String _status = '';
  bool _success = false;
  List<NdidErrorResponseModel> _errorResponseList = [];
  List<NdidErrorResponseModel> _asErrorResponseList = [];

  NdidCallbackResponseModel({
    String status = '',
    bool success = false,
    List<NdidErrorResponseModel> errorResponseList = const [],
    List<NdidErrorResponseModel> asErrorResponseList = const [],
  }) {
    _status = status;
    _success = success;
    _errorResponseList = errorResponseList;
    _asErrorResponseList = asErrorResponseList;
  }

  String get status => _status;
  bool get success => _success;
  List<NdidErrorResponseModel> get errorResponseList => _errorResponseList;
  List<NdidErrorResponseModel> get asErrorResponseList => _asErrorResponseList;

  @override
  NdidCallbackResponseModel copyWith(Map<String, dynamic> value) {
    return NdidCallbackResponseModel(
      status: value[NdidCallbackResponseModelFields.status] ?? _status,
      success: value[NdidCallbackResponseModelFields.success] ?? _success,
      errorResponseList:
          value[NdidCallbackResponseModelFields.responseList] ?? [],
      asErrorResponseList:
          value[NdidCallbackResponseModelFields.asResponseList] ?? [],
    );
  }
}

class NdidCallbackResponseModelFields {
  NdidCallbackResponseModelFields._();
  static const String status = 'status';
  static const String success = 'success';
  static const String responseList = 'response_list';
  static const String asResponseList = 'as_response_list';
  static const String dataRequestList = 'data_request_list';
}

class NdidCallbackResponseModelPersistence
    implements ModelJson<NdidCallbackResponseModel> {
  @override
  List<NdidCallbackResponseModel> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(Map<String, dynamic>.from(e))).toList();
  }

  @override
  NdidCallbackResponseModel fromJson(Map<String, dynamic> json) {
    final responseList =
        json[NdidCallbackResponseModelFields.responseList] as List? ?? [];
    final asErrorList = json[NdidCallbackResponseModelFields.dataRequestList][0]
            [NdidCallbackResponseModelFields.responseList] as List? ??
        [];
    return NdidCallbackResponseModel(
      status: json[NdidCallbackResponseModelFields.status] ?? '',
      success: json[NdidCallbackResponseModelFields.success] ?? false,
      errorResponseList:
          (json[NdidCallbackResponseModelFields.status] == 'errored')
              ? NdidErrorResponseModelPersistence().fromArrayJson(responseList)
              : [],
      asErrorResponseList:
          (json[NdidCallbackResponseModelFields.status] == 'errored')
              ? NdidErrorResponseModelPersistence().fromArrayJson(asErrorList)
              : [],
    );
  }

  @override
  Map<String, dynamic> toJson(NdidCallbackResponseModel json) {
    return {
      NdidCallbackResponseModelFields.status: json.status,
      NdidCallbackResponseModelFields.success: json.success,
      NdidCallbackResponseModelFields.responseList: (json.status == 'errored')
          ? json.errorResponseList
              .map((e) => NdidErrorResponseModelPersistence().toJson(e))
              .toList()
          : [],
      NdidCallbackResponseModelFields.asResponseList: (json.status == 'errored')
          ? json.asErrorResponseList
              .map((e) => NdidErrorResponseModelPersistence().toJson(e))
              .toList()
          : []
    };
  }
}
