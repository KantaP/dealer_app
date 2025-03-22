// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_bay_qr.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BayQrResponseModel _$BayQrResponseModelFromJson(Map<String, dynamic> json) {
  return _BayQrResponseModel.fromJson(json);
}

/// @nodoc
mixin _$BayQrResponseModel {
  @JsonKey(name: 'amount')
  String get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'content')
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'channel')
  String get channel => throw _privateConstructorUsedError;
  @JsonKey(name: 'bizMchId')
  String get bizMchId => throw _privateConstructorUsedError;
  @JsonKey(name: 'remark')
  String get remark => throw _privateConstructorUsedError;
  @JsonKey(name: 'success')
  bool get success => throw _privateConstructorUsedError;
  @JsonKey(name: 'ref1')
  String get ref1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'ref2')
  String get ref2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'billerId')
  String get billerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'terminalId')
  String get terminalId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BayQrResponseModelCopyWith<BayQrResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BayQrResponseModelCopyWith<$Res> {
  factory $BayQrResponseModelCopyWith(
          BayQrResponseModel value, $Res Function(BayQrResponseModel) then) =
      _$BayQrResponseModelCopyWithImpl<$Res, BayQrResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'amount') String amount,
      @JsonKey(name: 'content') String content,
      @JsonKey(name: 'channel') String channel,
      @JsonKey(name: 'bizMchId') String bizMchId,
      @JsonKey(name: 'remark') String remark,
      @JsonKey(name: 'success') bool success,
      @JsonKey(name: 'ref1') String ref1,
      @JsonKey(name: 'ref2') String ref2,
      @JsonKey(name: 'billerId') String billerId,
      @JsonKey(name: 'terminalId') String terminalId});
}

/// @nodoc
class _$BayQrResponseModelCopyWithImpl<$Res, $Val extends BayQrResponseModel>
    implements $BayQrResponseModelCopyWith<$Res> {
  _$BayQrResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? content = null,
    Object? channel = null,
    Object? bizMchId = null,
    Object? remark = null,
    Object? success = null,
    Object? ref1 = null,
    Object? ref2 = null,
    Object? billerId = null,
    Object? terminalId = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String,
      bizMchId: null == bizMchId
          ? _value.bizMchId
          : bizMchId // ignore: cast_nullable_to_non_nullable
              as String,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      ref1: null == ref1
          ? _value.ref1
          : ref1 // ignore: cast_nullable_to_non_nullable
              as String,
      ref2: null == ref2
          ? _value.ref2
          : ref2 // ignore: cast_nullable_to_non_nullable
              as String,
      billerId: null == billerId
          ? _value.billerId
          : billerId // ignore: cast_nullable_to_non_nullable
              as String,
      terminalId: null == terminalId
          ? _value.terminalId
          : terminalId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BayQrResponseModelImplCopyWith<$Res>
    implements $BayQrResponseModelCopyWith<$Res> {
  factory _$$BayQrResponseModelImplCopyWith(_$BayQrResponseModelImpl value,
          $Res Function(_$BayQrResponseModelImpl) then) =
      __$$BayQrResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'amount') String amount,
      @JsonKey(name: 'content') String content,
      @JsonKey(name: 'channel') String channel,
      @JsonKey(name: 'bizMchId') String bizMchId,
      @JsonKey(name: 'remark') String remark,
      @JsonKey(name: 'success') bool success,
      @JsonKey(name: 'ref1') String ref1,
      @JsonKey(name: 'ref2') String ref2,
      @JsonKey(name: 'billerId') String billerId,
      @JsonKey(name: 'terminalId') String terminalId});
}

/// @nodoc
class __$$BayQrResponseModelImplCopyWithImpl<$Res>
    extends _$BayQrResponseModelCopyWithImpl<$Res, _$BayQrResponseModelImpl>
    implements _$$BayQrResponseModelImplCopyWith<$Res> {
  __$$BayQrResponseModelImplCopyWithImpl(_$BayQrResponseModelImpl _value,
      $Res Function(_$BayQrResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? content = null,
    Object? channel = null,
    Object? bizMchId = null,
    Object? remark = null,
    Object? success = null,
    Object? ref1 = null,
    Object? ref2 = null,
    Object? billerId = null,
    Object? terminalId = null,
  }) {
    return _then(_$BayQrResponseModelImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String,
      bizMchId: null == bizMchId
          ? _value.bizMchId
          : bizMchId // ignore: cast_nullable_to_non_nullable
              as String,
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      ref1: null == ref1
          ? _value.ref1
          : ref1 // ignore: cast_nullable_to_non_nullable
              as String,
      ref2: null == ref2
          ? _value.ref2
          : ref2 // ignore: cast_nullable_to_non_nullable
              as String,
      billerId: null == billerId
          ? _value.billerId
          : billerId // ignore: cast_nullable_to_non_nullable
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
class _$BayQrResponseModelImpl implements _BayQrResponseModel {
  const _$BayQrResponseModelImpl(
      {@JsonKey(name: 'amount') this.amount = '',
      @JsonKey(name: 'content') this.content = '',
      @JsonKey(name: 'channel') this.channel = '',
      @JsonKey(name: 'bizMchId') this.bizMchId = '',
      @JsonKey(name: 'remark') this.remark = '',
      @JsonKey(name: 'success') this.success = false,
      @JsonKey(name: 'ref1') this.ref1 = '',
      @JsonKey(name: 'ref2') this.ref2 = '',
      @JsonKey(name: 'billerId') this.billerId = '',
      @JsonKey(name: 'terminalId') this.terminalId = ''});

  factory _$BayQrResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BayQrResponseModelImplFromJson(json);

  @override
  @JsonKey(name: 'amount')
  final String amount;
  @override
  @JsonKey(name: 'content')
  final String content;
  @override
  @JsonKey(name: 'channel')
  final String channel;
  @override
  @JsonKey(name: 'bizMchId')
  final String bizMchId;
  @override
  @JsonKey(name: 'remark')
  final String remark;
  @override
  @JsonKey(name: 'success')
  final bool success;
  @override
  @JsonKey(name: 'ref1')
  final String ref1;
  @override
  @JsonKey(name: 'ref2')
  final String ref2;
  @override
  @JsonKey(name: 'billerId')
  final String billerId;
  @override
  @JsonKey(name: 'terminalId')
  final String terminalId;

  @override
  String toString() {
    return 'BayQrResponseModel(amount: $amount, content: $content, channel: $channel, bizMchId: $bizMchId, remark: $remark, success: $success, ref1: $ref1, ref2: $ref2, billerId: $billerId, terminalId: $terminalId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BayQrResponseModelImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.bizMchId, bizMchId) ||
                other.bizMchId == bizMchId) &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.ref1, ref1) || other.ref1 == ref1) &&
            (identical(other.ref2, ref2) || other.ref2 == ref2) &&
            (identical(other.billerId, billerId) ||
                other.billerId == billerId) &&
            (identical(other.terminalId, terminalId) ||
                other.terminalId == terminalId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, amount, content, channel,
      bizMchId, remark, success, ref1, ref2, billerId, terminalId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BayQrResponseModelImplCopyWith<_$BayQrResponseModelImpl> get copyWith =>
      __$$BayQrResponseModelImplCopyWithImpl<_$BayQrResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BayQrResponseModelImplToJson(
      this,
    );
  }
}

abstract class _BayQrResponseModel implements BayQrResponseModel {
  const factory _BayQrResponseModel(
          {@JsonKey(name: 'amount') final String amount,
          @JsonKey(name: 'content') final String content,
          @JsonKey(name: 'channel') final String channel,
          @JsonKey(name: 'bizMchId') final String bizMchId,
          @JsonKey(name: 'remark') final String remark,
          @JsonKey(name: 'success') final bool success,
          @JsonKey(name: 'ref1') final String ref1,
          @JsonKey(name: 'ref2') final String ref2,
          @JsonKey(name: 'billerId') final String billerId,
          @JsonKey(name: 'terminalId') final String terminalId}) =
      _$BayQrResponseModelImpl;

  factory _BayQrResponseModel.fromJson(Map<String, dynamic> json) =
      _$BayQrResponseModelImpl.fromJson;

  @override
  @JsonKey(name: 'amount')
  String get amount;
  @override
  @JsonKey(name: 'content')
  String get content;
  @override
  @JsonKey(name: 'channel')
  String get channel;
  @override
  @JsonKey(name: 'bizMchId')
  String get bizMchId;
  @override
  @JsonKey(name: 'remark')
  String get remark;
  @override
  @JsonKey(name: 'success')
  bool get success;
  @override
  @JsonKey(name: 'ref1')
  String get ref1;
  @override
  @JsonKey(name: 'ref2')
  String get ref2;
  @override
  @JsonKey(name: 'billerId')
  String get billerId;
  @override
  @JsonKey(name: 'terminalId')
  String get terminalId;
  @override
  @JsonKey(ignore: true)
  _$$BayQrResponseModelImplCopyWith<_$BayQrResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
