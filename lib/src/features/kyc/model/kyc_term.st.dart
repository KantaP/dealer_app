import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class KycTermPageState implements IPageState<KycTermPageState> {
  bool _isAccept = false;

  bool _acceptAconnec = false;
  bool _acceptRisk = false;
  bool _acceptCollectData = false;
  bool _acceptToUseMarketing = false;
  bool _acceptToUseFinancial = false;
  bool _acceptToUseDevelopment = false;

  KycTermPageState({
    bool isAccept = false,
    bool acceptAconnec = false,
    bool acceptRisk = false,
    bool acceptCollectData = false,
    bool acceptToUseMarketing = false,
    bool acceptToUseFinancial = false,
    bool acceptToUseDevelopment = false,
  }) {
    _isAccept = isAccept;
    _acceptAconnec = acceptAconnec;
    _acceptRisk = acceptRisk;
    _acceptCollectData = acceptCollectData;
    _acceptToUseMarketing = acceptToUseMarketing;
    _acceptToUseFinancial = acceptToUseFinancial;
    _acceptToUseDevelopment = acceptToUseDevelopment;
  }

  bool get isAccept => _isAccept;

  bool get acceptAconnec => _acceptAconnec;
  bool get acceptRisk => _acceptRisk;
  bool get acceptCollectData => _acceptCollectData;
  bool get acceptToUseMarketing => _acceptToUseMarketing;
  bool get acceptToUseFinancial => _acceptToUseFinancial;
  bool get acceptToUseDevelopment => _acceptToUseDevelopment;

  @override
  KycTermPageState copyWith(Map<String, dynamic> value) {
    return KycTermPageState(
      isAccept: value[KycTermPageStateFields.isAccept] ?? _isAccept,
      acceptAconnec:
          value[KycTermPageStateFields.acceptAconnec] ?? _acceptAconnec,
      acceptRisk: value[KycTermPageStateFields.acceptRisk] ?? _acceptRisk,
      acceptCollectData:
          value[KycTermPageStateFields.acceptCollectData] ?? _acceptCollectData,
      acceptToUseMarketing:
          value[KycTermPageStateFields.acceptToUseMarketing] ??
              _acceptToUseMarketing,
      acceptToUseFinancial:
          value[KycTermPageStateFields.acceptToUseFinancial] ??
              _acceptToUseFinancial,
      acceptToUseDevelopment:
          value[KycTermPageStateFields.acceptToDevelopment] ??
              _acceptToUseDevelopment,
    );
  }
}

class KycTermPageStateFields {
  KycTermPageStateFields._();
  static const String isAccept = 'isAccept';

  static const String acceptAconnec = 'accept_aconnec';
  static const String acceptRisk = 'accept_risk';
  static const String acceptCollectData = 'accept_collect_data';
  static const String acceptToUseMarketing = 'accept_to_use_marketing';
  static const String acceptToUseFinancial = 'accept_to_use_financial';
  static const String acceptToDevelopment = 'accept_to_development';
}

class KycTermPageStatePersistence implements ModelJson<KycTermPageState> {
  @override
  List<KycTermPageState> fromArrayJson(List arrJson) {
    // TODO: implement fromArrayJson
    throw UnimplementedError();
  }

  @override
  KycTermPageState fromJson(Map<String, dynamic> json) {
    return KycTermPageState(
      acceptAconnec: json[KycTermPageStateFields.acceptAconnec] ?? false,
      acceptRisk: json[KycTermPageStateFields.acceptRisk] ?? false,
      acceptCollectData:
          json[KycTermPageStateFields.acceptCollectData] ?? false,
      acceptToUseMarketing:
          json[KycTermPageStateFields.acceptToUseMarketing] ?? false,
      acceptToUseFinancial:
          json[KycTermPageStateFields.acceptToUseFinancial] ?? false,
      acceptToUseDevelopment:
          json[KycTermPageStateFields.acceptToDevelopment] ?? false,
    );
  }

  @override
  Map<String, dynamic> toJson(KycTermPageState json) {
    return {
      KycTermPageStateFields.acceptAconnec: json.acceptAconnec,
      KycTermPageStateFields.acceptRisk: json.acceptRisk,
      KycTermPageStateFields.acceptCollectData: json.acceptCollectData,
      KycTermPageStateFields.acceptToUseMarketing: json.acceptToUseMarketing,
      KycTermPageStateFields.acceptToUseFinancial: json.acceptToUseFinancial,
      KycTermPageStateFields.acceptToDevelopment: json.acceptToUseDevelopment,
    };
  }
}
