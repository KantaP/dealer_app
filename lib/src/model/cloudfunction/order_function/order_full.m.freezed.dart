// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_full.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestOrderFullModel _$RequestOrderFullModelFromJson(
    Map<String, dynamic> json) {
  return _RequestOrderFullModel.fromJson(json);
}

/// @nodoc
mixin _$RequestOrderFullModel {
  @JsonKey(name: 'id_order')
  int get idOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'refcode')
  String get ref => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestOrderFullModelCopyWith<RequestOrderFullModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestOrderFullModelCopyWith<$Res> {
  factory $RequestOrderFullModelCopyWith(RequestOrderFullModel value,
          $Res Function(RequestOrderFullModel) then) =
      _$RequestOrderFullModelCopyWithImpl<$Res, RequestOrderFullModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_order') int idOrder,
      @JsonKey(name: 'refcode') String ref});
}

/// @nodoc
class _$RequestOrderFullModelCopyWithImpl<$Res,
        $Val extends RequestOrderFullModel>
    implements $RequestOrderFullModelCopyWith<$Res> {
  _$RequestOrderFullModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idOrder = null,
    Object? ref = null,
  }) {
    return _then(_value.copyWith(
      idOrder: null == idOrder
          ? _value.idOrder
          : idOrder // ignore: cast_nullable_to_non_nullable
              as int,
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestOrderFullModelImplCopyWith<$Res>
    implements $RequestOrderFullModelCopyWith<$Res> {
  factory _$$RequestOrderFullModelImplCopyWith(
          _$RequestOrderFullModelImpl value,
          $Res Function(_$RequestOrderFullModelImpl) then) =
      __$$RequestOrderFullModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_order') int idOrder,
      @JsonKey(name: 'refcode') String ref});
}

/// @nodoc
class __$$RequestOrderFullModelImplCopyWithImpl<$Res>
    extends _$RequestOrderFullModelCopyWithImpl<$Res,
        _$RequestOrderFullModelImpl>
    implements _$$RequestOrderFullModelImplCopyWith<$Res> {
  __$$RequestOrderFullModelImplCopyWithImpl(_$RequestOrderFullModelImpl _value,
      $Res Function(_$RequestOrderFullModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idOrder = null,
    Object? ref = null,
  }) {
    return _then(_$RequestOrderFullModelImpl(
      idOrder: null == idOrder
          ? _value.idOrder
          : idOrder // ignore: cast_nullable_to_non_nullable
              as int,
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestOrderFullModelImpl implements _RequestOrderFullModel {
  const _$RequestOrderFullModelImpl(
      {@JsonKey(name: 'id_order') required this.idOrder,
      @JsonKey(name: 'refcode') required this.ref});

  factory _$RequestOrderFullModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestOrderFullModelImplFromJson(json);

  @override
  @JsonKey(name: 'id_order')
  final int idOrder;
  @override
  @JsonKey(name: 'refcode')
  final String ref;

  @override
  String toString() {
    return 'RequestOrderFullModel(idOrder: $idOrder, ref: $ref)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestOrderFullModelImpl &&
            (identical(other.idOrder, idOrder) || other.idOrder == idOrder) &&
            (identical(other.ref, ref) || other.ref == ref));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idOrder, ref);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestOrderFullModelImplCopyWith<_$RequestOrderFullModelImpl>
      get copyWith => __$$RequestOrderFullModelImplCopyWithImpl<
          _$RequestOrderFullModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestOrderFullModelImplToJson(
      this,
    );
  }
}

abstract class _RequestOrderFullModel implements RequestOrderFullModel {
  const factory _RequestOrderFullModel(
          {@JsonKey(name: 'id_order') required final int idOrder,
          @JsonKey(name: 'refcode') required final String ref}) =
      _$RequestOrderFullModelImpl;

  factory _RequestOrderFullModel.fromJson(Map<String, dynamic> json) =
      _$RequestOrderFullModelImpl.fromJson;

  @override
  @JsonKey(name: 'id_order')
  int get idOrder;
  @override
  @JsonKey(name: 'refcode')
  String get ref;
  @override
  @JsonKey(ignore: true)
  _$$RequestOrderFullModelImplCopyWith<_$RequestOrderFullModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ResponseOrderFullModel _$ResponseOrderFullModelFromJson(
    Map<String, dynamic> json) {
  return _ResponseOrderFullModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseOrderFullModel {
  @JsonKey(name: 'order')
  ResponseOrderGetModel? get order => throw _privateConstructorUsedError;
  @JsonKey(name: 'trxfiat')
  ResponseTrxFiatGetModel? get trxfiat => throw _privateConstructorUsedError;
  @JsonKey(name: 'trxdigitalasset')
  ResponseTrxDigitalAssetGetModel? get trxdigitalasset =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseOrderFullModelCopyWith<ResponseOrderFullModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseOrderFullModelCopyWith<$Res> {
  factory $ResponseOrderFullModelCopyWith(ResponseOrderFullModel value,
          $Res Function(ResponseOrderFullModel) then) =
      _$ResponseOrderFullModelCopyWithImpl<$Res, ResponseOrderFullModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'order') ResponseOrderGetModel? order,
      @JsonKey(name: 'trxfiat') ResponseTrxFiatGetModel? trxfiat,
      @JsonKey(name: 'trxdigitalasset')
      ResponseTrxDigitalAssetGetModel? trxdigitalasset});

  $ResponseOrderGetModelCopyWith<$Res>? get order;
  $ResponseTrxFiatGetModelCopyWith<$Res>? get trxfiat;
  $ResponseTrxDigitalAssetGetModelCopyWith<$Res>? get trxdigitalasset;
}

/// @nodoc
class _$ResponseOrderFullModelCopyWithImpl<$Res,
        $Val extends ResponseOrderFullModel>
    implements $ResponseOrderFullModelCopyWith<$Res> {
  _$ResponseOrderFullModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = freezed,
    Object? trxfiat = freezed,
    Object? trxdigitalasset = freezed,
  }) {
    return _then(_value.copyWith(
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as ResponseOrderGetModel?,
      trxfiat: freezed == trxfiat
          ? _value.trxfiat
          : trxfiat // ignore: cast_nullable_to_non_nullable
              as ResponseTrxFiatGetModel?,
      trxdigitalasset: freezed == trxdigitalasset
          ? _value.trxdigitalasset
          : trxdigitalasset // ignore: cast_nullable_to_non_nullable
              as ResponseTrxDigitalAssetGetModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResponseOrderGetModelCopyWith<$Res>? get order {
    if (_value.order == null) {
      return null;
    }

    return $ResponseOrderGetModelCopyWith<$Res>(_value.order!, (value) {
      return _then(_value.copyWith(order: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ResponseTrxFiatGetModelCopyWith<$Res>? get trxfiat {
    if (_value.trxfiat == null) {
      return null;
    }

    return $ResponseTrxFiatGetModelCopyWith<$Res>(_value.trxfiat!, (value) {
      return _then(_value.copyWith(trxfiat: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ResponseTrxDigitalAssetGetModelCopyWith<$Res>? get trxdigitalasset {
    if (_value.trxdigitalasset == null) {
      return null;
    }

    return $ResponseTrxDigitalAssetGetModelCopyWith<$Res>(
        _value.trxdigitalasset!, (value) {
      return _then(_value.copyWith(trxdigitalasset: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResponseOrderFullModelImplCopyWith<$Res>
    implements $ResponseOrderFullModelCopyWith<$Res> {
  factory _$$ResponseOrderFullModelImplCopyWith(
          _$ResponseOrderFullModelImpl value,
          $Res Function(_$ResponseOrderFullModelImpl) then) =
      __$$ResponseOrderFullModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'order') ResponseOrderGetModel? order,
      @JsonKey(name: 'trxfiat') ResponseTrxFiatGetModel? trxfiat,
      @JsonKey(name: 'trxdigitalasset')
      ResponseTrxDigitalAssetGetModel? trxdigitalasset});

  @override
  $ResponseOrderGetModelCopyWith<$Res>? get order;
  @override
  $ResponseTrxFiatGetModelCopyWith<$Res>? get trxfiat;
  @override
  $ResponseTrxDigitalAssetGetModelCopyWith<$Res>? get trxdigitalasset;
}

/// @nodoc
class __$$ResponseOrderFullModelImplCopyWithImpl<$Res>
    extends _$ResponseOrderFullModelCopyWithImpl<$Res,
        _$ResponseOrderFullModelImpl>
    implements _$$ResponseOrderFullModelImplCopyWith<$Res> {
  __$$ResponseOrderFullModelImplCopyWithImpl(
      _$ResponseOrderFullModelImpl _value,
      $Res Function(_$ResponseOrderFullModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = freezed,
    Object? trxfiat = freezed,
    Object? trxdigitalasset = freezed,
  }) {
    return _then(_$ResponseOrderFullModelImpl(
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as ResponseOrderGetModel?,
      trxfiat: freezed == trxfiat
          ? _value.trxfiat
          : trxfiat // ignore: cast_nullable_to_non_nullable
              as ResponseTrxFiatGetModel?,
      trxdigitalasset: freezed == trxdigitalasset
          ? _value.trxdigitalasset
          : trxdigitalasset // ignore: cast_nullable_to_non_nullable
              as ResponseTrxDigitalAssetGetModel?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ResponseOrderFullModelImpl implements _ResponseOrderFullModel {
  _$ResponseOrderFullModelImpl(
      {@JsonKey(name: 'order') this.order = null,
      @JsonKey(name: 'trxfiat') this.trxfiat = null,
      @JsonKey(name: 'trxdigitalasset') this.trxdigitalasset = null});

  factory _$ResponseOrderFullModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseOrderFullModelImplFromJson(json);

  @override
  @JsonKey(name: 'order')
  final ResponseOrderGetModel? order;
  @override
  @JsonKey(name: 'trxfiat')
  final ResponseTrxFiatGetModel? trxfiat;
  @override
  @JsonKey(name: 'trxdigitalasset')
  final ResponseTrxDigitalAssetGetModel? trxdigitalasset;

  @override
  String toString() {
    return 'ResponseOrderFullModel(order: $order, trxfiat: $trxfiat, trxdigitalasset: $trxdigitalasset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseOrderFullModelImpl &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.trxfiat, trxfiat) || other.trxfiat == trxfiat) &&
            (identical(other.trxdigitalasset, trxdigitalasset) ||
                other.trxdigitalasset == trxdigitalasset));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, order, trxfiat, trxdigitalasset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseOrderFullModelImplCopyWith<_$ResponseOrderFullModelImpl>
      get copyWith => __$$ResponseOrderFullModelImplCopyWithImpl<
          _$ResponseOrderFullModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseOrderFullModelImplToJson(
      this,
    );
  }
}

abstract class _ResponseOrderFullModel implements ResponseOrderFullModel {
  factory _ResponseOrderFullModel(
          {@JsonKey(name: 'order') final ResponseOrderGetModel? order,
          @JsonKey(name: 'trxfiat') final ResponseTrxFiatGetModel? trxfiat,
          @JsonKey(name: 'trxdigitalasset')
          final ResponseTrxDigitalAssetGetModel? trxdigitalasset}) =
      _$ResponseOrderFullModelImpl;

  factory _ResponseOrderFullModel.fromJson(Map<String, dynamic> json) =
      _$ResponseOrderFullModelImpl.fromJson;

  @override
  @JsonKey(name: 'order')
  ResponseOrderGetModel? get order;
  @override
  @JsonKey(name: 'trxfiat')
  ResponseTrxFiatGetModel? get trxfiat;
  @override
  @JsonKey(name: 'trxdigitalasset')
  ResponseTrxDigitalAssetGetModel? get trxdigitalasset;
  @override
  @JsonKey(ignore: true)
  _$$ResponseOrderFullModelImplCopyWith<_$ResponseOrderFullModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
