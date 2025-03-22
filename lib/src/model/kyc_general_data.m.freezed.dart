// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kyc_general_data.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KycGeneralDataModel _$KycGeneralDataModelFromJson(Map<String, dynamic> json) {
  return _KycGeneralDataModel.fromJson(json);
}

/// @nodoc
mixin _$KycGeneralDataModel {
  @JsonKey(name: 'user_type')
  String get userType => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_thai_nationality')
  bool get isThaiNationality => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_risk_type')
  String get userRiskType => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_risk_score')
  int get userRiskScore => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KycGeneralDataModelCopyWith<KycGeneralDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KycGeneralDataModelCopyWith<$Res> {
  factory $KycGeneralDataModelCopyWith(
          KycGeneralDataModel value, $Res Function(KycGeneralDataModel) then) =
      _$KycGeneralDataModelCopyWithImpl<$Res, KycGeneralDataModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_type') String userType,
      @JsonKey(name: 'is_thai_nationality') bool isThaiNationality,
      @JsonKey(name: 'user_risk_type') String userRiskType,
      @JsonKey(name: 'user_risk_score') int userRiskScore});
}

/// @nodoc
class _$KycGeneralDataModelCopyWithImpl<$Res, $Val extends KycGeneralDataModel>
    implements $KycGeneralDataModelCopyWith<$Res> {
  _$KycGeneralDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userType = null,
    Object? isThaiNationality = null,
    Object? userRiskType = null,
    Object? userRiskScore = null,
  }) {
    return _then(_value.copyWith(
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
      isThaiNationality: null == isThaiNationality
          ? _value.isThaiNationality
          : isThaiNationality // ignore: cast_nullable_to_non_nullable
              as bool,
      userRiskType: null == userRiskType
          ? _value.userRiskType
          : userRiskType // ignore: cast_nullable_to_non_nullable
              as String,
      userRiskScore: null == userRiskScore
          ? _value.userRiskScore
          : userRiskScore // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KycGeneralDataModelImplCopyWith<$Res>
    implements $KycGeneralDataModelCopyWith<$Res> {
  factory _$$KycGeneralDataModelImplCopyWith(_$KycGeneralDataModelImpl value,
          $Res Function(_$KycGeneralDataModelImpl) then) =
      __$$KycGeneralDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_type') String userType,
      @JsonKey(name: 'is_thai_nationality') bool isThaiNationality,
      @JsonKey(name: 'user_risk_type') String userRiskType,
      @JsonKey(name: 'user_risk_score') int userRiskScore});
}

/// @nodoc
class __$$KycGeneralDataModelImplCopyWithImpl<$Res>
    extends _$KycGeneralDataModelCopyWithImpl<$Res, _$KycGeneralDataModelImpl>
    implements _$$KycGeneralDataModelImplCopyWith<$Res> {
  __$$KycGeneralDataModelImplCopyWithImpl(_$KycGeneralDataModelImpl _value,
      $Res Function(_$KycGeneralDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userType = null,
    Object? isThaiNationality = null,
    Object? userRiskType = null,
    Object? userRiskScore = null,
  }) {
    return _then(_$KycGeneralDataModelImpl(
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
      isThaiNationality: null == isThaiNationality
          ? _value.isThaiNationality
          : isThaiNationality // ignore: cast_nullable_to_non_nullable
              as bool,
      userRiskType: null == userRiskType
          ? _value.userRiskType
          : userRiskType // ignore: cast_nullable_to_non_nullable
              as String,
      userRiskScore: null == userRiskScore
          ? _value.userRiskScore
          : userRiskScore // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KycGeneralDataModelImpl implements _KycGeneralDataModel {
  const _$KycGeneralDataModelImpl(
      {@JsonKey(name: 'user_type') this.userType = '',
      @JsonKey(name: 'is_thai_nationality') this.isThaiNationality = true,
      @JsonKey(name: 'user_risk_type') this.userRiskType = '',
      @JsonKey(name: 'user_risk_score') this.userRiskScore = 0});

  factory _$KycGeneralDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$KycGeneralDataModelImplFromJson(json);

  @override
  @JsonKey(name: 'user_type')
  final String userType;
  @override
  @JsonKey(name: 'is_thai_nationality')
  final bool isThaiNationality;
  @override
  @JsonKey(name: 'user_risk_type')
  final String userRiskType;
  @override
  @JsonKey(name: 'user_risk_score')
  final int userRiskScore;

  @override
  String toString() {
    return 'KycGeneralDataModel(userType: $userType, isThaiNationality: $isThaiNationality, userRiskType: $userRiskType, userRiskScore: $userRiskScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KycGeneralDataModelImpl &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.isThaiNationality, isThaiNationality) ||
                other.isThaiNationality == isThaiNationality) &&
            (identical(other.userRiskType, userRiskType) ||
                other.userRiskType == userRiskType) &&
            (identical(other.userRiskScore, userRiskScore) ||
                other.userRiskScore == userRiskScore));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, userType, isThaiNationality, userRiskType, userRiskScore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KycGeneralDataModelImplCopyWith<_$KycGeneralDataModelImpl> get copyWith =>
      __$$KycGeneralDataModelImplCopyWithImpl<_$KycGeneralDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KycGeneralDataModelImplToJson(
      this,
    );
  }
}

abstract class _KycGeneralDataModel implements KycGeneralDataModel {
  const factory _KycGeneralDataModel(
          {@JsonKey(name: 'user_type') final String userType,
          @JsonKey(name: 'is_thai_nationality') final bool isThaiNationality,
          @JsonKey(name: 'user_risk_type') final String userRiskType,
          @JsonKey(name: 'user_risk_score') final int userRiskScore}) =
      _$KycGeneralDataModelImpl;

  factory _KycGeneralDataModel.fromJson(Map<String, dynamic> json) =
      _$KycGeneralDataModelImpl.fromJson;

  @override
  @JsonKey(name: 'user_type')
  String get userType;
  @override
  @JsonKey(name: 'is_thai_nationality')
  bool get isThaiNationality;
  @override
  @JsonKey(name: 'user_risk_type')
  String get userRiskType;
  @override
  @JsonKey(name: 'user_risk_score')
  int get userRiskScore;
  @override
  @JsonKey(ignore: true)
  _$$KycGeneralDataModelImplCopyWith<_$KycGeneralDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
