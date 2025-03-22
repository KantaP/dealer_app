// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pure_fiat_cancel.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PureFiatCancelRequest _$PureFiatCancelRequestFromJson(
    Map<String, dynamic> json) {
  return _PureFiatCancelRequest.fromJson(json);
}

/// @nodoc
mixin _$PureFiatCancelRequest {
  @JsonKey(name: 'id_purefiat')
  int get idPureFiat => throw _privateConstructorUsedError;
  @JsonKey(name: 'cancel_reason')
  String get cancelReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'refcode')
  String get refcode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PureFiatCancelRequestCopyWith<PureFiatCancelRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PureFiatCancelRequestCopyWith<$Res> {
  factory $PureFiatCancelRequestCopyWith(PureFiatCancelRequest value,
          $Res Function(PureFiatCancelRequest) then) =
      _$PureFiatCancelRequestCopyWithImpl<$Res, PureFiatCancelRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_purefiat') int idPureFiat,
      @JsonKey(name: 'cancel_reason') String cancelReason,
      @JsonKey(name: 'refcode') String refcode});
}

/// @nodoc
class _$PureFiatCancelRequestCopyWithImpl<$Res,
        $Val extends PureFiatCancelRequest>
    implements $PureFiatCancelRequestCopyWith<$Res> {
  _$PureFiatCancelRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idPureFiat = null,
    Object? cancelReason = null,
    Object? refcode = null,
  }) {
    return _then(_value.copyWith(
      idPureFiat: null == idPureFiat
          ? _value.idPureFiat
          : idPureFiat // ignore: cast_nullable_to_non_nullable
              as int,
      cancelReason: null == cancelReason
          ? _value.cancelReason
          : cancelReason // ignore: cast_nullable_to_non_nullable
              as String,
      refcode: null == refcode
          ? _value.refcode
          : refcode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PureFiatCancelRequestImplCopyWith<$Res>
    implements $PureFiatCancelRequestCopyWith<$Res> {
  factory _$$PureFiatCancelRequestImplCopyWith(
          _$PureFiatCancelRequestImpl value,
          $Res Function(_$PureFiatCancelRequestImpl) then) =
      __$$PureFiatCancelRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_purefiat') int idPureFiat,
      @JsonKey(name: 'cancel_reason') String cancelReason,
      @JsonKey(name: 'refcode') String refcode});
}

/// @nodoc
class __$$PureFiatCancelRequestImplCopyWithImpl<$Res>
    extends _$PureFiatCancelRequestCopyWithImpl<$Res,
        _$PureFiatCancelRequestImpl>
    implements _$$PureFiatCancelRequestImplCopyWith<$Res> {
  __$$PureFiatCancelRequestImplCopyWithImpl(_$PureFiatCancelRequestImpl _value,
      $Res Function(_$PureFiatCancelRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idPureFiat = null,
    Object? cancelReason = null,
    Object? refcode = null,
  }) {
    return _then(_$PureFiatCancelRequestImpl(
      idPureFiat: null == idPureFiat
          ? _value.idPureFiat
          : idPureFiat // ignore: cast_nullable_to_non_nullable
              as int,
      cancelReason: null == cancelReason
          ? _value.cancelReason
          : cancelReason // ignore: cast_nullable_to_non_nullable
              as String,
      refcode: null == refcode
          ? _value.refcode
          : refcode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PureFiatCancelRequestImpl implements _PureFiatCancelRequest {
  const _$PureFiatCancelRequestImpl(
      {@JsonKey(name: 'id_purefiat') this.idPureFiat = 0,
      @JsonKey(name: 'cancel_reason') this.cancelReason = '',
      @JsonKey(name: 'refcode') this.refcode = ''});

  factory _$PureFiatCancelRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PureFiatCancelRequestImplFromJson(json);

  @override
  @JsonKey(name: 'id_purefiat')
  final int idPureFiat;
  @override
  @JsonKey(name: 'cancel_reason')
  final String cancelReason;
  @override
  @JsonKey(name: 'refcode')
  final String refcode;

  @override
  String toString() {
    return 'PureFiatCancelRequest(idPureFiat: $idPureFiat, cancelReason: $cancelReason, refcode: $refcode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PureFiatCancelRequestImpl &&
            (identical(other.idPureFiat, idPureFiat) ||
                other.idPureFiat == idPureFiat) &&
            (identical(other.cancelReason, cancelReason) ||
                other.cancelReason == cancelReason) &&
            (identical(other.refcode, refcode) || other.refcode == refcode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, idPureFiat, cancelReason, refcode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PureFiatCancelRequestImplCopyWith<_$PureFiatCancelRequestImpl>
      get copyWith => __$$PureFiatCancelRequestImplCopyWithImpl<
          _$PureFiatCancelRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PureFiatCancelRequestImplToJson(
      this,
    );
  }
}

abstract class _PureFiatCancelRequest implements PureFiatCancelRequest {
  const factory _PureFiatCancelRequest(
          {@JsonKey(name: 'id_purefiat') final int idPureFiat,
          @JsonKey(name: 'cancel_reason') final String cancelReason,
          @JsonKey(name: 'refcode') final String refcode}) =
      _$PureFiatCancelRequestImpl;

  factory _PureFiatCancelRequest.fromJson(Map<String, dynamic> json) =
      _$PureFiatCancelRequestImpl.fromJson;

  @override
  @JsonKey(name: 'id_purefiat')
  int get idPureFiat;
  @override
  @JsonKey(name: 'cancel_reason')
  String get cancelReason;
  @override
  @JsonKey(name: 'refcode')
  String get refcode;
  @override
  @JsonKey(ignore: true)
  _$$PureFiatCancelRequestImplCopyWith<_$PureFiatCancelRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
