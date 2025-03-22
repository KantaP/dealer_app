import 'package:encrypt/encrypt.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

import '../../../constants/key.dart';

class KycInformationFormSubmitState
    implements IPageState<KycInformationFormSubmitState> {
  bool _canSubmit = false;

  KycInformationFormSubmitState({bool canSubmit = false}) {
    _canSubmit = canSubmit;
  }

  bool get canSubmit => _canSubmit;

  @override
  KycInformationFormSubmitState copyWith(Map<String, dynamic> value) {
    return KycInformationFormSubmitState(
      canSubmit: value['canSubmit'] ?? _canSubmit,
    );
  }
}

class KycInformationFormState implements IPageState<KycInformationFormState> {
  String _firstNameEng = '',
      _lastNameEng = '',
      _firstNameThai = '',
      _lastNameThai = '',
      _dateOfBirth = '',
      _gender = '',
      _idCard = '',
      _laserIdCard = '',
      _idCardExpireAt = '',
      _nationality = '',
      _nameTitle = '',
      _taxId = '',
      _userType = '';

  bool _hasError = false, _idCardLifetime = false;

  KycInformationFormState(
      {String firstNameEng = '',
      lastNameEng = '',
      firstNameThai = '',
      lastNameThai = '',
      dateofBirth = '',
      gender = '',
      idCard = '',
      laserIdCard = '',
      idCardExpireAt = '',
      userType = '',
      bool hasError = false,
      idCardLifetime = false}) {
    _firstNameEng = firstNameEng;
    _lastNameEng = lastNameEng;
    _firstNameThai = firstNameThai;
    _lastNameThai = lastNameThai;
    _dateOfBirth = dateofBirth;
    _gender = gender;
    _idCard = idCard;
    _laserIdCard = laserIdCard;
    _idCardExpireAt = idCardExpireAt;
    _hasError = hasError;
    _userType = userType;
    _idCardLifetime = idCardLifetime;
  }

  String get firstNameEng => _firstNameEng;
  String get lastNameEng => _lastNameEng;
  String get firstNameThai => _firstNameThai;
  String get lastNameThai => _lastNameThai;
  String get dateOfBirth => _dateOfBirth;
  String get gender => _gender;
  String get idCard => _idCard;
  String get laserIdCard => _laserIdCard;
  String get idCardExpireAt => _idCardExpireAt;
  String get userType => _userType;

  bool get hasError => _hasError;
  bool get idCardLifetime => _idCardLifetime;

  @override
  KycInformationFormState copyWith(Map<String, dynamic> value) {
    return KycInformationFormState(
      firstNameEng:
          value[KycInformationFormStateFields.firstNameEng] ?? _firstNameEng,
      lastNameEng:
          value[KycInformationFormStateFields.lastNameEng] ?? _lastNameEng,
      firstNameThai:
          value[KycInformationFormStateFields.firstNameThai] ?? _firstNameThai,
      lastNameThai:
          value[KycInformationFormStateFields.lastNameThai] ?? _lastNameThai,
      dateofBirth:
          value[KycInformationFormStateFields.dateOfBirth] ?? _dateOfBirth,
      gender: value[KycInformationFormStateFields.gender] ?? _gender,
      idCard: value[KycInformationFormStateFields.idCard] ?? _idCard,
      laserIdCard:
          value[KycInformationFormStateFields.laserIdCard] ?? _laserIdCard,
      idCardExpireAt: value[KycInformationFormStateFields.idCardExpireAt] ??
          _idCardExpireAt,
      hasError: value[KycInformationFormStateFields.hasError] ?? _hasError,
      userType: value[KycInformationFormStateFields.userType] ?? _userType,
      idCardLifetime: value[KycInformationFormStateFields.idCardLifetime] ??
          _idCardLifetime,
    );
  }
}

class KycInformationFormStateFields {
  KycInformationFormStateFields._();

  static const String firstNameEng = 'legal_firstname_EN';
  static const String lastNameEng = 'legal_lastname_EN';
  static const String firstNameThai = 'legal_firstname_TH';
  static const String lastNameThai = 'legal_lastname_TH';
  static const String dateOfBirth = 'date_of_birth';
  static const String gender = 'gender';
  static const String idCard = 'legal_id';
  static const String laserIdCard = 'legal_laser_id';
  static const String idCardExpireAt = 'id_card_expired_at';
  static const String hasError = 'hasError';
  static const String nameTitle = 'name_title';
  static const String idCardLifetime = 'id_card_lifetime';
  static const String nationality = 'nationality';
  static const String taxId = 'tax_id';
  static const String userType = 'user_type';
}

class KycInformationFormStatePersistence
    implements ModelJson<KycInformationFormState> {
  @override
  List<KycInformationFormState> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(e)).toList();
  }

  @override
  KycInformationFormState fromJson(Map<String, dynamic> json) {
    return KycInformationFormState(
      firstNameEng: json[KycInformationFormStateFields.firstNameEng],
      firstNameThai: json[KycInformationFormStateFields.firstNameThai],
      lastNameEng: json[KycInformationFormStateFields.lastNameEng],
      lastNameThai: json[KycInformationFormStateFields.lastNameThai],
      dateofBirth: json[KycInformationFormStateFields.dateOfBirth],
      gender: json[KycInformationFormStateFields.gender],
      idCard: json[KycInformationFormStateFields.idCard],
      laserIdCard: json[KycInformationFormStateFields.laserIdCard],
      idCardExpireAt: json[KycInformationFormStateFields.idCardExpireAt],
      idCardLifetime: json[KycInformationFormStateFields.idCardLifetime],
    );
  }

  @override
  Map<String, dynamic> toJson(KycInformationFormState json) {
    return <String, dynamic>{
      KycInformationFormStateFields.firstNameEng: json.firstNameEng,
      KycInformationFormStateFields.lastNameEng: json.lastNameEng,
      KycInformationFormStateFields.firstNameThai: json.firstNameThai,
      KycInformationFormStateFields.lastNameThai: json.lastNameThai,
      KycInformationFormStateFields.gender: json.gender,
      KycInformationFormStateFields.dateOfBirth: json.dateOfBirth,
      KycInformationFormStateFields.idCard: json.idCard,
      KycInformationFormStateFields.laserIdCard: json.laserIdCard,
      KycInformationFormStateFields.idCardExpireAt: json.idCardExpireAt,
      KycInformationFormStateFields.idCardLifetime: json.idCardLifetime,
    };
  }

  Map<String, dynamic> toJsonSecure(KycInformationFormState json) {
    final key = Key.fromUtf8(AppKey.aesKey);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    // print(iv);
    final idCardEncrypted = encrypter.encrypt(json.idCard, iv: iv);
    final laserIdCardEncrypted = encrypter.encrypt(json.laserIdCard, iv: iv);
    // print(idCardEncrypted);
    return <String, dynamic>{
      KycInformationFormStateFields.firstNameEng: json.firstNameEng,
      KycInformationFormStateFields.lastNameEng: json.lastNameEng,
      KycInformationFormStateFields.firstNameThai: json.firstNameThai,
      KycInformationFormStateFields.lastNameThai: json.lastNameThai,
      KycInformationFormStateFields.gender: json.gender,
      KycInformationFormStateFields.dateOfBirth: json.dateOfBirth,
      KycInformationFormStateFields.idCard: idCardEncrypted.base64,
      KycInformationFormStateFields.laserIdCard: laserIdCardEncrypted.base64,
      KycInformationFormStateFields.idCardExpireAt: json.idCardExpireAt,
      KycInformationFormStateFields.idCardLifetime: json.idCardLifetime,
    };
  }
}

class KycInformationFormErrorState
    implements IPageState<KycInformationFormErrorState> {
  bool _hasError = false;
  String? _firstNameEng,
      _lastNameEng,
      _firstNameThai,
      _lastNameThai,
      _dateOfBirth,
      _gender,
      _idCard,
      _laserIdCard,
      _idCardExpireAt;

  KycInformationFormErrorState({
    bool hasError = false,
    String? firstNameEng,
    lastNameEng,
    firstNameThai,
    lastNameThai,
    dateofBirth,
    gender,
    idCard,
    laserIdCard,
    idCardExpireAt,
  }) {
    _hasError = hasError;
    _firstNameEng = firstNameEng;
    _lastNameEng = lastNameEng;
    _firstNameThai = firstNameThai;
    _lastNameThai = lastNameThai;
    _dateOfBirth = dateofBirth;
    _gender = gender;
    _idCard = idCard;
    _laserIdCard = laserIdCard;
    _idCardExpireAt = idCardExpireAt;
  }

  bool get hasError => _hasError;

  String? get firstNameEng => _firstNameEng;
  String? get lastNameEng => _lastNameEng;
  String? get firstNameThai => _firstNameThai;
  String? get lastNameThai => _lastNameThai;
  String? get dateOfBirth => _dateOfBirth;
  String? get gender => _gender;
  String? get idCard => _idCard;
  String? get laserIdCard => _laserIdCard;
  String? get idCardExpireAt => _idCardExpireAt;

  @override
  KycInformationFormErrorState copyWith(Map<String, dynamic> value) {
    return KycInformationFormErrorState(
      hasError: value[KycInformationFormErrorStateFields.hasError] ?? _hasError,
      firstNameEng:
          value[KycInformationFormStateFields.firstNameEng] ?? _firstNameEng,
      lastNameEng:
          value[KycInformationFormStateFields.lastNameEng] ?? _lastNameEng,
      firstNameThai:
          value[KycInformationFormStateFields.firstNameThai] ?? _firstNameThai,
      lastNameThai:
          value[KycInformationFormStateFields.lastNameThai] ?? _lastNameThai,
      dateofBirth:
          value[KycInformationFormStateFields.dateOfBirth] ?? _dateOfBirth,
      gender: value[KycInformationFormStateFields.gender] ?? _gender,
      idCard: value[KycInformationFormStateFields.idCard] ?? _idCard,
      laserIdCard:
          value[KycInformationFormStateFields.laserIdCard] ?? _laserIdCard,
      idCardExpireAt: value[KycInformationFormStateFields.idCardExpireAt] ??
          _idCardExpireAt,
    );
  }
}

class KycInformationFormErrorStateFields {
  KycInformationFormErrorStateFields._();

  static const String hasError = 'hasError';
}
