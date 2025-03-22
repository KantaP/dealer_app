// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthCheckRequest _$AuthCheckRequestFromJson(Map<String, dynamic> json) {
  return _AuthCheckRequest.fromJson(json);
}

/// @nodoc
mixin _$AuthCheckRequest {
  @JsonKey(name: 'phone_number')
  String get phoneNumber => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthCheckRequestCopyWith<AuthCheckRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthCheckRequestCopyWith<$Res> {
  factory $AuthCheckRequestCopyWith(
          AuthCheckRequest value, $Res Function(AuthCheckRequest) then) =
      _$AuthCheckRequestCopyWithImpl<$Res, AuthCheckRequest>;
  @useResult
  $Res call({@JsonKey(name: 'phone_number') String phoneNumber});
}

/// @nodoc
class _$AuthCheckRequestCopyWithImpl<$Res, $Val extends AuthCheckRequest>
    implements $AuthCheckRequestCopyWith<$Res> {
  _$AuthCheckRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_value.copyWith(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthCheckRequestImplCopyWith<$Res>
    implements $AuthCheckRequestCopyWith<$Res> {
  factory _$$AuthCheckRequestImplCopyWith(_$AuthCheckRequestImpl value,
          $Res Function(_$AuthCheckRequestImpl) then) =
      __$$AuthCheckRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'phone_number') String phoneNumber});
}

/// @nodoc
class __$$AuthCheckRequestImplCopyWithImpl<$Res>
    extends _$AuthCheckRequestCopyWithImpl<$Res, _$AuthCheckRequestImpl>
    implements _$$AuthCheckRequestImplCopyWith<$Res> {
  __$$AuthCheckRequestImplCopyWithImpl(_$AuthCheckRequestImpl _value,
      $Res Function(_$AuthCheckRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_$AuthCheckRequestImpl(
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthCheckRequestImpl implements _AuthCheckRequest {
  const _$AuthCheckRequestImpl(
      {@JsonKey(name: 'phone_number') this.phoneNumber = ''});

  factory _$AuthCheckRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthCheckRequestImplFromJson(json);

  @override
  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  @override
  String toString() {
    return 'AuthCheckRequest(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthCheckRequestImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthCheckRequestImplCopyWith<_$AuthCheckRequestImpl> get copyWith =>
      __$$AuthCheckRequestImplCopyWithImpl<_$AuthCheckRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthCheckRequestImplToJson(
      this,
    );
  }
}

abstract class _AuthCheckRequest implements AuthCheckRequest {
  const factory _AuthCheckRequest(
          {@JsonKey(name: 'phone_number') final String phoneNumber}) =
      _$AuthCheckRequestImpl;

  factory _AuthCheckRequest.fromJson(Map<String, dynamic> json) =
      _$AuthCheckRequestImpl.fromJson;

  @override
  @JsonKey(name: 'phone_number')
  String get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$AuthCheckRequestImplCopyWith<_$AuthCheckRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
