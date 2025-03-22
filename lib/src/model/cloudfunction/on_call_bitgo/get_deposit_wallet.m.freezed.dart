// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_deposit_wallet.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestGetDepositWalletModel _$RequestGetDepositWalletModelFromJson(
    Map<String, dynamic> json) {
  return _RequestGetDepositWalletModel.fromJson(json);
}

/// @nodoc
mixin _$RequestGetDepositWalletModel {
  @JsonKey(name: 'digitalasset_symbol')
  String get digitalAssetSymbol => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestGetDepositWalletModelCopyWith<RequestGetDepositWalletModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestGetDepositWalletModelCopyWith<$Res> {
  factory $RequestGetDepositWalletModelCopyWith(
          RequestGetDepositWalletModel value,
          $Res Function(RequestGetDepositWalletModel) then) =
      _$RequestGetDepositWalletModelCopyWithImpl<$Res,
          RequestGetDepositWalletModel>;
  @useResult
  $Res call({@JsonKey(name: 'digitalasset_symbol') String digitalAssetSymbol});
}

/// @nodoc
class _$RequestGetDepositWalletModelCopyWithImpl<$Res,
        $Val extends RequestGetDepositWalletModel>
    implements $RequestGetDepositWalletModelCopyWith<$Res> {
  _$RequestGetDepositWalletModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? digitalAssetSymbol = null,
  }) {
    return _then(_value.copyWith(
      digitalAssetSymbol: null == digitalAssetSymbol
          ? _value.digitalAssetSymbol
          : digitalAssetSymbol // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestGetDepositWalletModelImplCopyWith<$Res>
    implements $RequestGetDepositWalletModelCopyWith<$Res> {
  factory _$$RequestGetDepositWalletModelImplCopyWith(
          _$RequestGetDepositWalletModelImpl value,
          $Res Function(_$RequestGetDepositWalletModelImpl) then) =
      __$$RequestGetDepositWalletModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'digitalasset_symbol') String digitalAssetSymbol});
}

/// @nodoc
class __$$RequestGetDepositWalletModelImplCopyWithImpl<$Res>
    extends _$RequestGetDepositWalletModelCopyWithImpl<$Res,
        _$RequestGetDepositWalletModelImpl>
    implements _$$RequestGetDepositWalletModelImplCopyWith<$Res> {
  __$$RequestGetDepositWalletModelImplCopyWithImpl(
      _$RequestGetDepositWalletModelImpl _value,
      $Res Function(_$RequestGetDepositWalletModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? digitalAssetSymbol = null,
  }) {
    return _then(_$RequestGetDepositWalletModelImpl(
      digitalAssetSymbol: null == digitalAssetSymbol
          ? _value.digitalAssetSymbol
          : digitalAssetSymbol // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestGetDepositWalletModelImpl
    implements _RequestGetDepositWalletModel {
  const _$RequestGetDepositWalletModelImpl(
      {@JsonKey(name: 'digitalasset_symbol') required this.digitalAssetSymbol});

  factory _$RequestGetDepositWalletModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RequestGetDepositWalletModelImplFromJson(json);

  @override
  @JsonKey(name: 'digitalasset_symbol')
  final String digitalAssetSymbol;

  @override
  String toString() {
    return 'RequestGetDepositWalletModel(digitalAssetSymbol: $digitalAssetSymbol)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestGetDepositWalletModelImpl &&
            (identical(other.digitalAssetSymbol, digitalAssetSymbol) ||
                other.digitalAssetSymbol == digitalAssetSymbol));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, digitalAssetSymbol);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestGetDepositWalletModelImplCopyWith<
          _$RequestGetDepositWalletModelImpl>
      get copyWith => __$$RequestGetDepositWalletModelImplCopyWithImpl<
          _$RequestGetDepositWalletModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestGetDepositWalletModelImplToJson(
      this,
    );
  }
}

abstract class _RequestGetDepositWalletModel
    implements RequestGetDepositWalletModel {
  const factory _RequestGetDepositWalletModel(
          {@JsonKey(name: 'digitalasset_symbol')
          required final String digitalAssetSymbol}) =
      _$RequestGetDepositWalletModelImpl;

  factory _RequestGetDepositWalletModel.fromJson(Map<String, dynamic> json) =
      _$RequestGetDepositWalletModelImpl.fromJson;

  @override
  @JsonKey(name: 'digitalasset_symbol')
  String get digitalAssetSymbol;
  @override
  @JsonKey(ignore: true)
  _$$RequestGetDepositWalletModelImplCopyWith<
          _$RequestGetDepositWalletModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ResponseGetDepositWalletModel _$ResponseGetDepositWalletModelFromJson(
    Map<String, dynamic> json) {
  return _ResponseGetDepositWalletModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseGetDepositWalletModel {
  @JsonKey(name: 'deposit_address')
  String get depositAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_channel')
  String get paymentChannel => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseGetDepositWalletModelCopyWith<ResponseGetDepositWalletModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseGetDepositWalletModelCopyWith<$Res> {
  factory $ResponseGetDepositWalletModelCopyWith(
          ResponseGetDepositWalletModel value,
          $Res Function(ResponseGetDepositWalletModel) then) =
      _$ResponseGetDepositWalletModelCopyWithImpl<$Res,
          ResponseGetDepositWalletModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'deposit_address') String depositAddress,
      @JsonKey(name: 'payment_channel') String paymentChannel});
}

/// @nodoc
class _$ResponseGetDepositWalletModelCopyWithImpl<$Res,
        $Val extends ResponseGetDepositWalletModel>
    implements $ResponseGetDepositWalletModelCopyWith<$Res> {
  _$ResponseGetDepositWalletModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? depositAddress = null,
    Object? paymentChannel = null,
  }) {
    return _then(_value.copyWith(
      depositAddress: null == depositAddress
          ? _value.depositAddress
          : depositAddress // ignore: cast_nullable_to_non_nullable
              as String,
      paymentChannel: null == paymentChannel
          ? _value.paymentChannel
          : paymentChannel // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseGetDepositWalletModelImplCopyWith<$Res>
    implements $ResponseGetDepositWalletModelCopyWith<$Res> {
  factory _$$ResponseGetDepositWalletModelImplCopyWith(
          _$ResponseGetDepositWalletModelImpl value,
          $Res Function(_$ResponseGetDepositWalletModelImpl) then) =
      __$$ResponseGetDepositWalletModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'deposit_address') String depositAddress,
      @JsonKey(name: 'payment_channel') String paymentChannel});
}

/// @nodoc
class __$$ResponseGetDepositWalletModelImplCopyWithImpl<$Res>
    extends _$ResponseGetDepositWalletModelCopyWithImpl<$Res,
        _$ResponseGetDepositWalletModelImpl>
    implements _$$ResponseGetDepositWalletModelImplCopyWith<$Res> {
  __$$ResponseGetDepositWalletModelImplCopyWithImpl(
      _$ResponseGetDepositWalletModelImpl _value,
      $Res Function(_$ResponseGetDepositWalletModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? depositAddress = null,
    Object? paymentChannel = null,
  }) {
    return _then(_$ResponseGetDepositWalletModelImpl(
      depositAddress: null == depositAddress
          ? _value.depositAddress
          : depositAddress // ignore: cast_nullable_to_non_nullable
              as String,
      paymentChannel: null == paymentChannel
          ? _value.paymentChannel
          : paymentChannel // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseGetDepositWalletModelImpl
    implements _ResponseGetDepositWalletModel {
  const _$ResponseGetDepositWalletModelImpl(
      {@JsonKey(name: 'deposit_address') this.depositAddress = '',
      @JsonKey(name: 'payment_channel') this.paymentChannel = ''});

  factory _$ResponseGetDepositWalletModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ResponseGetDepositWalletModelImplFromJson(json);

  @override
  @JsonKey(name: 'deposit_address')
  final String depositAddress;
  @override
  @JsonKey(name: 'payment_channel')
  final String paymentChannel;

  @override
  String toString() {
    return 'ResponseGetDepositWalletModel(depositAddress: $depositAddress, paymentChannel: $paymentChannel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseGetDepositWalletModelImpl &&
            (identical(other.depositAddress, depositAddress) ||
                other.depositAddress == depositAddress) &&
            (identical(other.paymentChannel, paymentChannel) ||
                other.paymentChannel == paymentChannel));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, depositAddress, paymentChannel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseGetDepositWalletModelImplCopyWith<
          _$ResponseGetDepositWalletModelImpl>
      get copyWith => __$$ResponseGetDepositWalletModelImplCopyWithImpl<
          _$ResponseGetDepositWalletModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseGetDepositWalletModelImplToJson(
      this,
    );
  }
}

abstract class _ResponseGetDepositWalletModel
    implements ResponseGetDepositWalletModel {
  const factory _ResponseGetDepositWalletModel(
          {@JsonKey(name: 'deposit_address') final String depositAddress,
          @JsonKey(name: 'payment_channel') final String paymentChannel}) =
      _$ResponseGetDepositWalletModelImpl;

  factory _ResponseGetDepositWalletModel.fromJson(Map<String, dynamic> json) =
      _$ResponseGetDepositWalletModelImpl.fromJson;

  @override
  @JsonKey(name: 'deposit_address')
  String get depositAddress;
  @override
  @JsonKey(name: 'payment_channel')
  String get paymentChannel;
  @override
  @JsonKey(ignore: true)
  _$$ResponseGetDepositWalletModelImplCopyWith<
          _$ResponseGetDepositWalletModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
