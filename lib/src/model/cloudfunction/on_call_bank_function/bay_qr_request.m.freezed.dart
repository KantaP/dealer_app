// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bay_qr_request.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BayQrRequestModel _$BayQrRequestModelFromJson(Map<String, dynamic> json) {
  return _BayQrRequestModel.fromJson(json);
}

/// @nodoc
mixin _$BayQrRequestModel {
  @JsonKey(name: 'ref1')
  String get ref1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'ref2')
  String get ref2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  String get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'remark')
  String get remark => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'terminalId')
  String get terminalId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BayQrRequestModelCopyWith<BayQrRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BayQrRequestModelCopyWith<$Res> {
  factory $BayQrRequestModelCopyWith(
          BayQrRequestModel value, $Res Function(BayQrRequestModel) then) =
      _$BayQrRequestModelCopyWithImpl<$Res, BayQrRequestModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'ref1') String ref1,
      @JsonKey(name: 'ref2') String ref2,
      @JsonKey(name: 'amount') String amount,
      @JsonKey(name: 'remark') String remark,
      @JsonKey(name: 'type') String type,
      @JsonKey(name: 'terminalId') String terminalId});
}

/// @nodoc
class _$BayQrRequestModelCopyWithImpl<$Res, $Val extends BayQrRequestModel>
    implements $BayQrRequestModelCopyWith<$Res> {
  _$BayQrRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref1 = null,
    Object? ref2 = null,
    Object? amount = null,
    Object? remark = null,
    Object? type = null,
    Object? terminalId = null,
  }) {
    return _then(_value.copyWith(
      ref1: null == ref1
          ? _value.ref1
          : ref1 // ignore: cast_nullable_to_non_nullable
              as String,
      ref2: null == ref2
          ? _value.ref2
          : ref2 // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      terminalId: null == terminalId
          ? _value.terminalId
          : terminalId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BayQrRequestModelImplCopyWith<$Res>
    implements $BayQrRequestModelCopyWith<$Res> {
  factory _$$BayQrRequestModelImplCopyWith(_$BayQrRequestModelImpl value,
          $Res Function(_$BayQrRequestModelImpl) then) =
      __$$BayQrRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'ref1') String ref1,
      @JsonKey(name: 'ref2') String ref2,
      @JsonKey(name: 'amount') String amount,
      @JsonKey(name: 'remark') String remark,
      @JsonKey(name: 'type') String type,
      @JsonKey(name: 'terminalId') String terminalId});
}

/// @nodoc
class __$$BayQrRequestModelImplCopyWithImpl<$Res>
    extends _$BayQrRequestModelCopyWithImpl<$Res, _$BayQrRequestModelImpl>
    implements _$$BayQrRequestModelImplCopyWith<$Res> {
  __$$BayQrRequestModelImplCopyWithImpl(_$BayQrRequestModelImpl _value,
      $Res Function(_$BayQrRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ref1 = null,
    Object? ref2 = null,
    Object? amount = null,
    Object? remark = null,
    Object? type = null,
    Object? terminalId = null,
  }) {
    return _then(_$BayQrRequestModelImpl(
      ref1: null == ref1
          ? _value.ref1
          : ref1 // ignore: cast_nullable_to_non_nullable
              as String,
      ref2: null == ref2
          ? _value.ref2
          : ref2 // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      terminalId: null == terminalId
          ? _value.terminalId
          : terminalId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BayQrRequestModelImpl implements _BayQrRequestModel {
  const _$BayQrRequestModelImpl(
      {@JsonKey(name: 'ref1') this.ref1 = '',
      @JsonKey(name: 'ref2') this.ref2 = '',
      @JsonKey(name: 'amount') this.amount = '',
      @JsonKey(name: 'remark') this.remark = '',
      @JsonKey(name: 'type') this.type = '',
      @JsonKey(name: 'terminalId') this.terminalId = ''});

  factory _$BayQrRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BayQrRequestModelImplFromJson(json);

  @override
  @JsonKey(name: 'ref1')
  final String ref1;
  @override
  @JsonKey(name: 'ref2')
  final String ref2;
  @override
  @JsonKey(name: 'amount')
  final String amount;
  @override
  @JsonKey(name: 'remark')
  final String remark;
  @override
  @JsonKey(name: 'type')
  final String type;
  @override
  @JsonKey(name: 'terminalId')
  final String terminalId;

  @override
  String toString() {
    return 'BayQrRequestModel(ref1: $ref1, ref2: $ref2, amount: $amount, remark: $remark, type: $type, terminalId: $terminalId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BayQrRequestModelImpl &&
            (identical(other.ref1, ref1) || other.ref1 == ref1) &&
            (identical(other.ref2, ref2) || other.ref2 == ref2) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.terminalId, terminalId) ||
                other.terminalId == terminalId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, ref1, ref2, amount, remark, type, terminalId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BayQrRequestModelImplCopyWith<_$BayQrRequestModelImpl> get copyWith =>
      __$$BayQrRequestModelImplCopyWithImpl<_$BayQrRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BayQrRequestModelImplToJson(
      this,
    );
  }
}

abstract class _BayQrRequestModel implements BayQrRequestModel {
  const factory _BayQrRequestModel(
          {@JsonKey(name: 'ref1') final String ref1,
          @JsonKey(name: 'ref2') final String ref2,
          @JsonKey(name: 'amount') final String amount,
          @JsonKey(name: 'remark') final String remark,
          @JsonKey(name: 'type') final String type,
          @JsonKey(name: 'terminalId') final String terminalId}) =
      _$BayQrRequestModelImpl;

  factory _BayQrRequestModel.fromJson(Map<String, dynamic> json) =
      _$BayQrRequestModelImpl.fromJson;

  @override
  @JsonKey(name: 'ref1')
  String get ref1;
  @override
  @JsonKey(name: 'ref2')
  String get ref2;
  @override
  @JsonKey(name: 'amount')
  String get amount;
  @override
  @JsonKey(name: 'remark')
  String get remark;
  @override
  @JsonKey(name: 'type')
  String get type;
  @override
  @JsonKey(name: 'terminalId')
  String get terminalId;
  @override
  @JsonKey(ignore: true)
  _$$BayQrRequestModelImplCopyWith<_$BayQrRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
