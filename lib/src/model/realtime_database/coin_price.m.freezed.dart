// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_price.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CoinPriceModel _$CoinPriceModelFromJson(Map<String, dynamic> json) {
  return _CoinPriceModel.fromJson(json);
}

/// @nodoc
mixin _$CoinPriceModel {
  @JsonKey(name: 'buy')
  double get buy => throw _privateConstructorUsedError;
  @JsonKey(name: 'sell')
  double get sell => throw _privateConstructorUsedError;
  @JsonKey(name: 'symbol')
  String get symbol => throw _privateConstructorUsedError;
  @JsonKey(name: 'fee')
  double get fee => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoinPriceModelCopyWith<CoinPriceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinPriceModelCopyWith<$Res> {
  factory $CoinPriceModelCopyWith(
          CoinPriceModel value, $Res Function(CoinPriceModel) then) =
      _$CoinPriceModelCopyWithImpl<$Res, CoinPriceModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'buy') double buy,
      @JsonKey(name: 'sell') double sell,
      @JsonKey(name: 'symbol') String symbol,
      @JsonKey(name: 'fee') double fee});
}

/// @nodoc
class _$CoinPriceModelCopyWithImpl<$Res, $Val extends CoinPriceModel>
    implements $CoinPriceModelCopyWith<$Res> {
  _$CoinPriceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? buy = null,
    Object? sell = null,
    Object? symbol = null,
    Object? fee = null,
  }) {
    return _then(_value.copyWith(
      buy: null == buy
          ? _value.buy
          : buy // ignore: cast_nullable_to_non_nullable
              as double,
      sell: null == sell
          ? _value.sell
          : sell // ignore: cast_nullable_to_non_nullable
              as double,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      fee: null == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoinPriceModelImplCopyWith<$Res>
    implements $CoinPriceModelCopyWith<$Res> {
  factory _$$CoinPriceModelImplCopyWith(_$CoinPriceModelImpl value,
          $Res Function(_$CoinPriceModelImpl) then) =
      __$$CoinPriceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'buy') double buy,
      @JsonKey(name: 'sell') double sell,
      @JsonKey(name: 'symbol') String symbol,
      @JsonKey(name: 'fee') double fee});
}

/// @nodoc
class __$$CoinPriceModelImplCopyWithImpl<$Res>
    extends _$CoinPriceModelCopyWithImpl<$Res, _$CoinPriceModelImpl>
    implements _$$CoinPriceModelImplCopyWith<$Res> {
  __$$CoinPriceModelImplCopyWithImpl(
      _$CoinPriceModelImpl _value, $Res Function(_$CoinPriceModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? buy = null,
    Object? sell = null,
    Object? symbol = null,
    Object? fee = null,
  }) {
    return _then(_$CoinPriceModelImpl(
      buy: null == buy
          ? _value.buy
          : buy // ignore: cast_nullable_to_non_nullable
              as double,
      sell: null == sell
          ? _value.sell
          : sell // ignore: cast_nullable_to_non_nullable
              as double,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      fee: null == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoinPriceModelImpl extends _CoinPriceModel {
  const _$CoinPriceModelImpl(
      {@JsonKey(name: 'buy') this.buy = 0,
      @JsonKey(name: 'sell') this.sell = 0,
      @JsonKey(name: 'symbol') this.symbol = '',
      @JsonKey(name: 'fee') this.fee = 0})
      : super._();

  factory _$CoinPriceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoinPriceModelImplFromJson(json);

  @override
  @JsonKey(name: 'buy')
  final double buy;
  @override
  @JsonKey(name: 'sell')
  final double sell;
  @override
  @JsonKey(name: 'symbol')
  final String symbol;
  @override
  @JsonKey(name: 'fee')
  final double fee;

  @override
  String toString() {
    return 'CoinPriceModel(buy: $buy, sell: $sell, symbol: $symbol, fee: $fee)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoinPriceModelImpl &&
            (identical(other.buy, buy) || other.buy == buy) &&
            (identical(other.sell, sell) || other.sell == sell) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.fee, fee) || other.fee == fee));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, buy, sell, symbol, fee);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoinPriceModelImplCopyWith<_$CoinPriceModelImpl> get copyWith =>
      __$$CoinPriceModelImplCopyWithImpl<_$CoinPriceModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoinPriceModelImplToJson(
      this,
    );
  }
}

abstract class _CoinPriceModel extends CoinPriceModel {
  const factory _CoinPriceModel(
      {@JsonKey(name: 'buy') final double buy,
      @JsonKey(name: 'sell') final double sell,
      @JsonKey(name: 'symbol') final String symbol,
      @JsonKey(name: 'fee') final double fee}) = _$CoinPriceModelImpl;
  const _CoinPriceModel._() : super._();

  factory _CoinPriceModel.fromJson(Map<String, dynamic> json) =
      _$CoinPriceModelImpl.fromJson;

  @override
  @JsonKey(name: 'buy')
  double get buy;
  @override
  @JsonKey(name: 'sell')
  double get sell;
  @override
  @JsonKey(name: 'symbol')
  String get symbol;
  @override
  @JsonKey(name: 'fee')
  double get fee;
  @override
  @JsonKey(ignore: true)
  _$$CoinPriceModelImplCopyWith<_$CoinPriceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
