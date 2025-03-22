// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProfileData _$UserProfileDataFromJson(Map<String, dynamic> json) {
  return _UserProfileData.fromJson(json);
}

/// @nodoc
mixin _$UserProfileData {
  String get fullNameTh => throw _privateConstructorUsedError;
  String get fullNameEng => throw _privateConstructorUsedError;
  String get mobilePhone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileDataCopyWith<UserProfileData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileDataCopyWith<$Res> {
  factory $UserProfileDataCopyWith(
          UserProfileData value, $Res Function(UserProfileData) then) =
      _$UserProfileDataCopyWithImpl<$Res, UserProfileData>;
  @useResult
  $Res call({String fullNameTh, String fullNameEng, String mobilePhone});
}

/// @nodoc
class _$UserProfileDataCopyWithImpl<$Res, $Val extends UserProfileData>
    implements $UserProfileDataCopyWith<$Res> {
  _$UserProfileDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullNameTh = null,
    Object? fullNameEng = null,
    Object? mobilePhone = null,
  }) {
    return _then(_value.copyWith(
      fullNameTh: null == fullNameTh
          ? _value.fullNameTh
          : fullNameTh // ignore: cast_nullable_to_non_nullable
              as String,
      fullNameEng: null == fullNameEng
          ? _value.fullNameEng
          : fullNameEng // ignore: cast_nullable_to_non_nullable
              as String,
      mobilePhone: null == mobilePhone
          ? _value.mobilePhone
          : mobilePhone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfileDataImplCopyWith<$Res>
    implements $UserProfileDataCopyWith<$Res> {
  factory _$$UserProfileDataImplCopyWith(_$UserProfileDataImpl value,
          $Res Function(_$UserProfileDataImpl) then) =
      __$$UserProfileDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fullNameTh, String fullNameEng, String mobilePhone});
}

/// @nodoc
class __$$UserProfileDataImplCopyWithImpl<$Res>
    extends _$UserProfileDataCopyWithImpl<$Res, _$UserProfileDataImpl>
    implements _$$UserProfileDataImplCopyWith<$Res> {
  __$$UserProfileDataImplCopyWithImpl(
      _$UserProfileDataImpl _value, $Res Function(_$UserProfileDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullNameTh = null,
    Object? fullNameEng = null,
    Object? mobilePhone = null,
  }) {
    return _then(_$UserProfileDataImpl(
      fullNameTh: null == fullNameTh
          ? _value.fullNameTh
          : fullNameTh // ignore: cast_nullable_to_non_nullable
              as String,
      fullNameEng: null == fullNameEng
          ? _value.fullNameEng
          : fullNameEng // ignore: cast_nullable_to_non_nullable
              as String,
      mobilePhone: null == mobilePhone
          ? _value.mobilePhone
          : mobilePhone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileDataImpl implements _UserProfileData {
  const _$UserProfileDataImpl(
      {this.fullNameTh = '', this.fullNameEng = '', this.mobilePhone = ''});

  factory _$UserProfileDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileDataImplFromJson(json);

  @override
  @JsonKey()
  final String fullNameTh;
  @override
  @JsonKey()
  final String fullNameEng;
  @override
  @JsonKey()
  final String mobilePhone;

  @override
  String toString() {
    return 'UserProfileData(fullNameTh: $fullNameTh, fullNameEng: $fullNameEng, mobilePhone: $mobilePhone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileDataImpl &&
            (identical(other.fullNameTh, fullNameTh) ||
                other.fullNameTh == fullNameTh) &&
            (identical(other.fullNameEng, fullNameEng) ||
                other.fullNameEng == fullNameEng) &&
            (identical(other.mobilePhone, mobilePhone) ||
                other.mobilePhone == mobilePhone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fullNameTh, fullNameEng, mobilePhone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileDataImplCopyWith<_$UserProfileDataImpl> get copyWith =>
      __$$UserProfileDataImplCopyWithImpl<_$UserProfileDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileDataImplToJson(
      this,
    );
  }
}

abstract class _UserProfileData implements UserProfileData {
  const factory _UserProfileData(
      {final String fullNameTh,
      final String fullNameEng,
      final String mobilePhone}) = _$UserProfileDataImpl;

  factory _UserProfileData.fromJson(Map<String, dynamic> json) =
      _$UserProfileDataImpl.fromJson;

  @override
  String get fullNameTh;
  @override
  String get fullNameEng;
  @override
  String get mobilePhone;
  @override
  @JsonKey(ignore: true)
  _$$UserProfileDataImplCopyWith<_$UserProfileDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
