import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class KycAddressFormState implements IPageState<KycAddressFormState> {
  int _provinceId = 0;
  int _districtId = 0;
  int _subDistrictId = 0;
  String _postCode = '';
  int _currentAddressIndex = 0;
  int _workingPlaceAddressIndex = 0;

  String _houseNumber = '';
  String _moo = '';
  String _soi = '';
  String _road = '';
  String _houseName = '';

  bool _isSubmit = false;

  String _province = '';
  String _district = '';
  String _subDistrict = '';

  KycAddressFormState({
    int provinceId = 0,
    int districtId = 0,
    int subDistrictId = 0,
    String postCode = '',
    int currentAddressIndex = 0,
    String houseNumber = '',
    String moo = '',
    String soi = '',
    String road = '',
    String houseName = '',
    bool isSubmit = false,
    String province = '',
    String district = '',
    String subDistrict = '',
    int workingPlaceAddressIndex = 0,
  }) {
    _provinceId = provinceId;
    _districtId = districtId;
    _subDistrictId = subDistrictId;
    _postCode = postCode;
    _currentAddressIndex = currentAddressIndex;

    _houseNumber = houseNumber;
    _moo = moo;
    _soi = soi;
    _road = road;
    _houseName = houseName;

    _isSubmit = isSubmit;

    _province = province;
    _district = district;
    _subDistrict = subDistrict;

    _workingPlaceAddressIndex = workingPlaceAddressIndex;
  }

  int get provinceId => _provinceId;
  int get districtId => _districtId;
  int get subDistrictId => _subDistrictId;
  String get postCode => _postCode;
  int get currentAddressIndex => _currentAddressIndex;

  String get houseNumber => _houseNumber;
  String get moo => _moo;
  String get soi => _soi;
  String get road => _road;
  String get houseName => _houseName;

  bool get isSubmit => _isSubmit;

  String get province => _province;
  String get district => _district;
  String get subDistrict => _subDistrict;

  int get workingPlaceAddressIndex => _workingPlaceAddressIndex;

  @override
  KycAddressFormState copyWith(Map<String, dynamic> value) {
    final copyValue = KycAddressFormState(
      provinceId: value[KycAddressFormStateFields.provinceId] ?? _provinceId,
      districtId: value[KycAddressFormStateFields.districtId] ?? _districtId,
      subDistrictId:
          value[KycAddressFormStateFields.subDistrictId] ?? _subDistrictId,
      postCode: value[KycAddressFormStateFields.postCode] ?? _postCode,
      currentAddressIndex:
          value[KycAddressFormStateFields.currentAddressIndex] ??
              _currentAddressIndex,
      houseNumber: value[KycAddressFormStateFields.houseNumber] ?? _houseNumber,
      moo: value[KycAddressFormStateFields.moo] ?? _moo,
      soi: value[KycAddressFormStateFields.soi] ?? _soi,
      road: value[KycAddressFormStateFields.road] ?? _road,
      houseName: value[KycAddressFormStateFields.houseName] ?? _houseName,
      isSubmit: value[KycAddressFormStateFields.isSubmit] ?? _isSubmit,
      province: value[KycAddressFormStateFields.province] ?? _province,
      district: value[KycAddressFormStateFields.district] ?? _district,
      subDistrict: value[KycAddressFormStateFields.subDistrict] ?? _subDistrict,
      workingPlaceAddressIndex:
          value[KycAddressFormStateFields.workingPlaceAddressIndex] ??
              _workingPlaceAddressIndex,
    );
    return copyValue;
  }
}

class KycAddressFormStateFields {
  KycAddressFormStateFields._();

  static const String provinceId = 'province_id';
  static const String districtId = 'district_id';
  static const String subDistrictId = 'sub_district_id';
  static const String postCode = 'post_code';
  static const String currentAddressIndex = 'current_address_index';

  static const String houseNumber = 'house_number';
  static const String moo = 'moo';
  static const String soi = 'soi';
  static const String road = 'road';
  static const String houseName = 'house_name';

  static const String isSubmit = 'is_submit';
  static const String province = 'province';
  static const String district = 'district';
  static const String subDistrict = 'sub_district';

  static const String workingPlaceAddressIndex = 'working_place_address_index';
}

class KycAddressFormStatePersistence implements ModelJson<KycAddressFormState> {
  @override
  List<KycAddressFormState> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(e)).toList();
  }

  @override
  KycAddressFormState fromJson(Map<String, dynamic> json) {
    return KycAddressFormState(
      houseName: json[KycAddressFormStateFields.houseName],
      moo: json[KycAddressFormStateFields.moo],
      road: json[KycAddressFormStateFields.road],
      houseNumber: json[KycAddressFormStateFields.houseNumber],
      soi: json[KycAddressFormStateFields.soi],
      provinceId: json[KycAddressFormStateFields.provinceId],
      districtId: json[KycAddressFormStateFields.districtId],
      subDistrictId: json[KycAddressFormStateFields.subDistrictId],
      postCode: json[KycAddressFormStateFields.postCode],
      province: json[KycAddressFormStateFields.province],
      district: json[KycAddressFormStateFields.district],
      subDistrict: json[KycAddressFormStateFields.subDistrict],
    );
  }

  @override
  Map<String, dynamic> toJson(KycAddressFormState json) {
    return <String, dynamic>{
      KycAddressFormStateFields.houseName: json.houseName,
      KycAddressFormStateFields.moo: json.moo,
      KycAddressFormStateFields.road: json.road,
      KycAddressFormStateFields.houseNumber: json.houseNumber,
      KycAddressFormStateFields.soi: json.soi,
      KycAddressFormStateFields.provinceId: json.provinceId,
      KycAddressFormStateFields.districtId: json.districtId,
      KycAddressFormStateFields.subDistrictId: json.subDistrictId,
      KycAddressFormStateFields.postCode: json.postCode,
      KycAddressFormStateFields.province: json.province,
      KycAddressFormStateFields.district: json.district,
      KycAddressFormStateFields.subDistrict: json.subDistrict,
    };
  }
}

class KycAddressFormErrorState implements IPageState<KycAddressFormErrorState> {
  bool _hasError = true;

  KycAddressFormErrorState({
    bool hasError = true,
  }) {
    _hasError = hasError;
  }

  bool get hasError => _hasError;

  @override
  KycAddressFormErrorState copyWith(Map<String, dynamic> value) {
    return KycAddressFormErrorState(
      hasError: value[KycAddressFormErrorStateFields.hasError] ?? _hasError,
    );
  }
}

class KycAddressFormErrorStateFields {
  KycAddressFormErrorStateFields._();

  static const String hasError = 'hasError';
}
