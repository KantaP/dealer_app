// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'open_check.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestOpenCheckModel _$RequestOpenCheckModelFromJson(
    Map<String, dynamic> json) {
  return _RequestOpenCheckModel.fromJson(json);
}

/// @nodoc
mixin _$RequestOpenCheckModel {
  @JsonKey(name: 'id_user')
  String get idUser => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestOpenCheckModelCopyWith<RequestOpenCheckModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestOpenCheckModelCopyWith<$Res> {
  factory $RequestOpenCheckModelCopyWith(RequestOpenCheckModel value,
          $Res Function(RequestOpenCheckModel) then) =
      _$RequestOpenCheckModelCopyWithImpl<$Res, RequestOpenCheckModel>;
  @useResult
  $Res call({@JsonKey(name: 'id_user') String idUser});
}

/// @nodoc
class _$RequestOpenCheckModelCopyWithImpl<$Res,
        $Val extends RequestOpenCheckModel>
    implements $RequestOpenCheckModelCopyWith<$Res> {
  _$RequestOpenCheckModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idUser = null,
  }) {
    return _then(_value.copyWith(
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestOpenCheckModelImplCopyWith<$Res>
    implements $RequestOpenCheckModelCopyWith<$Res> {
  factory _$$RequestOpenCheckModelImplCopyWith(
          _$RequestOpenCheckModelImpl value,
          $Res Function(_$RequestOpenCheckModelImpl) then) =
      __$$RequestOpenCheckModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'id_user') String idUser});
}

/// @nodoc
class __$$RequestOpenCheckModelImplCopyWithImpl<$Res>
    extends _$RequestOpenCheckModelCopyWithImpl<$Res,
        _$RequestOpenCheckModelImpl>
    implements _$$RequestOpenCheckModelImplCopyWith<$Res> {
  __$$RequestOpenCheckModelImplCopyWithImpl(_$RequestOpenCheckModelImpl _value,
      $Res Function(_$RequestOpenCheckModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idUser = null,
  }) {
    return _then(_$RequestOpenCheckModelImpl(
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestOpenCheckModelImpl implements _RequestOpenCheckModel {
  const _$RequestOpenCheckModelImpl(
      {@JsonKey(name: 'id_user') required this.idUser});

  factory _$RequestOpenCheckModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestOpenCheckModelImplFromJson(json);

  @override
  @JsonKey(name: 'id_user')
  final String idUser;

  @override
  String toString() {
    return 'RequestOpenCheckModel(idUser: $idUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestOpenCheckModelImpl &&
            (identical(other.idUser, idUser) || other.idUser == idUser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestOpenCheckModelImplCopyWith<_$RequestOpenCheckModelImpl>
      get copyWith => __$$RequestOpenCheckModelImplCopyWithImpl<
          _$RequestOpenCheckModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestOpenCheckModelImplToJson(
      this,
    );
  }
}

abstract class _RequestOpenCheckModel implements RequestOpenCheckModel {
  const factory _RequestOpenCheckModel(
          {@JsonKey(name: 'id_user') required final String idUser}) =
      _$RequestOpenCheckModelImpl;

  factory _RequestOpenCheckModel.fromJson(Map<String, dynamic> json) =
      _$RequestOpenCheckModelImpl.fromJson;

  @override
  @JsonKey(name: 'id_user')
  String get idUser;
  @override
  @JsonKey(ignore: true)
  _$$RequestOpenCheckModelImplCopyWith<_$RequestOpenCheckModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ResponseOpenCheckModel _$ResponseOpenCheckModelFromJson(
    Map<String, dynamic> json) {
  return _ResponseOpenCheckModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseOpenCheckModel {
  @JsonKey(name: 'id_order')
  int get idOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_status')
  String get orderStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_side')
  String get orderSide => throw _privateConstructorUsedError;
  @JsonKey(name: 'refcode')
  String get refcode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseOpenCheckModelCopyWith<ResponseOpenCheckModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseOpenCheckModelCopyWith<$Res> {
  factory $ResponseOpenCheckModelCopyWith(ResponseOpenCheckModel value,
          $Res Function(ResponseOpenCheckModel) then) =
      _$ResponseOpenCheckModelCopyWithImpl<$Res, ResponseOpenCheckModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_order') int idOrder,
      @JsonKey(name: 'order_status') String orderStatus,
      @JsonKey(name: 'order_side') String orderSide,
      @JsonKey(name: 'refcode') String refcode});
}

/// @nodoc
class _$ResponseOpenCheckModelCopyWithImpl<$Res,
        $Val extends ResponseOpenCheckModel>
    implements $ResponseOpenCheckModelCopyWith<$Res> {
  _$ResponseOpenCheckModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idOrder = null,
    Object? orderStatus = null,
    Object? orderSide = null,
    Object? refcode = null,
  }) {
    return _then(_value.copyWith(
      idOrder: null == idOrder
          ? _value.idOrder
          : idOrder // ignore: cast_nullable_to_non_nullable
              as int,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      orderSide: null == orderSide
          ? _value.orderSide
          : orderSide // ignore: cast_nullable_to_non_nullable
              as String,
      refcode: null == refcode
          ? _value.refcode
          : refcode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseOpenCheckModelImplCopyWith<$Res>
    implements $ResponseOpenCheckModelCopyWith<$Res> {
  factory _$$ResponseOpenCheckModelImplCopyWith(
          _$ResponseOpenCheckModelImpl value,
          $Res Function(_$ResponseOpenCheckModelImpl) then) =
      __$$ResponseOpenCheckModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_order') int idOrder,
      @JsonKey(name: 'order_status') String orderStatus,
      @JsonKey(name: 'order_side') String orderSide,
      @JsonKey(name: 'refcode') String refcode});
}

/// @nodoc
class __$$ResponseOpenCheckModelImplCopyWithImpl<$Res>
    extends _$ResponseOpenCheckModelCopyWithImpl<$Res,
        _$ResponseOpenCheckModelImpl>
    implements _$$ResponseOpenCheckModelImplCopyWith<$Res> {
  __$$ResponseOpenCheckModelImplCopyWithImpl(
      _$ResponseOpenCheckModelImpl _value,
      $Res Function(_$ResponseOpenCheckModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idOrder = null,
    Object? orderStatus = null,
    Object? orderSide = null,
    Object? refcode = null,
  }) {
    return _then(_$ResponseOpenCheckModelImpl(
      idOrder: null == idOrder
          ? _value.idOrder
          : idOrder // ignore: cast_nullable_to_non_nullable
              as int,
      orderStatus: null == orderStatus
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as String,
      orderSide: null == orderSide
          ? _value.orderSide
          : orderSide // ignore: cast_nullable_to_non_nullable
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
class _$ResponseOpenCheckModelImpl implements _ResponseOpenCheckModel {
  const _$ResponseOpenCheckModelImpl(
      {@JsonKey(name: 'id_order') this.idOrder = 0,
      @JsonKey(name: 'order_status') this.orderStatus = '',
      @JsonKey(name: 'order_side') this.orderSide = '',
      @JsonKey(name: 'refcode') this.refcode = ''});

  factory _$ResponseOpenCheckModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseOpenCheckModelImplFromJson(json);

  @override
  @JsonKey(name: 'id_order')
  final int idOrder;
  @override
  @JsonKey(name: 'order_status')
  final String orderStatus;
  @override
  @JsonKey(name: 'order_side')
  final String orderSide;
  @override
  @JsonKey(name: 'refcode')
  final String refcode;

  @override
  String toString() {
    return 'ResponseOpenCheckModel(idOrder: $idOrder, orderStatus: $orderStatus, orderSide: $orderSide, refcode: $refcode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseOpenCheckModelImpl &&
            (identical(other.idOrder, idOrder) || other.idOrder == idOrder) &&
            (identical(other.orderStatus, orderStatus) ||
                other.orderStatus == orderStatus) &&
            (identical(other.orderSide, orderSide) ||
                other.orderSide == orderSide) &&
            (identical(other.refcode, refcode) || other.refcode == refcode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, idOrder, orderStatus, orderSide, refcode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseOpenCheckModelImplCopyWith<_$ResponseOpenCheckModelImpl>
      get copyWith => __$$ResponseOpenCheckModelImplCopyWithImpl<
          _$ResponseOpenCheckModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseOpenCheckModelImplToJson(
      this,
    );
  }
}

abstract class _ResponseOpenCheckModel implements ResponseOpenCheckModel {
  const factory _ResponseOpenCheckModel(
          {@JsonKey(name: 'id_order') final int idOrder,
          @JsonKey(name: 'order_status') final String orderStatus,
          @JsonKey(name: 'order_side') final String orderSide,
          @JsonKey(name: 'refcode') final String refcode}) =
      _$ResponseOpenCheckModelImpl;

  factory _ResponseOpenCheckModel.fromJson(Map<String, dynamic> json) =
      _$ResponseOpenCheckModelImpl.fromJson;

  @override
  @JsonKey(name: 'id_order')
  int get idOrder;
  @override
  @JsonKey(name: 'order_status')
  String get orderStatus;
  @override
  @JsonKey(name: 'order_side')
  String get orderSide;
  @override
  @JsonKey(name: 'refcode')
  String get refcode;
  @override
  @JsonKey(ignore: true)
  _$$ResponseOpenCheckModelImplCopyWith<_$ResponseOpenCheckModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
