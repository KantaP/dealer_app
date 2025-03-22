// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_cancel.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestOrderCancelModel _$RequestOrderCancelModelFromJson(
    Map<String, dynamic> json) {
  return _RequestOrderCancelModel.fromJson(json);
}

/// @nodoc
mixin _$RequestOrderCancelModel {
  @JsonKey(name: 'id_order')
  int get idOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'cancel_reason')
  String get cancelReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'refcode')
  String get ref => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestOrderCancelModelCopyWith<RequestOrderCancelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestOrderCancelModelCopyWith<$Res> {
  factory $RequestOrderCancelModelCopyWith(RequestOrderCancelModel value,
          $Res Function(RequestOrderCancelModel) then) =
      _$RequestOrderCancelModelCopyWithImpl<$Res, RequestOrderCancelModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_order') int idOrder,
      @JsonKey(name: 'cancel_reason') String cancelReason,
      @JsonKey(name: 'refcode') String ref});
}

/// @nodoc
class _$RequestOrderCancelModelCopyWithImpl<$Res,
        $Val extends RequestOrderCancelModel>
    implements $RequestOrderCancelModelCopyWith<$Res> {
  _$RequestOrderCancelModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idOrder = null,
    Object? cancelReason = null,
    Object? ref = null,
  }) {
    return _then(_value.copyWith(
      idOrder: null == idOrder
          ? _value.idOrder
          : idOrder // ignore: cast_nullable_to_non_nullable
              as int,
      cancelReason: null == cancelReason
          ? _value.cancelReason
          : cancelReason // ignore: cast_nullable_to_non_nullable
              as String,
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestOrderCancelModelImplCopyWith<$Res>
    implements $RequestOrderCancelModelCopyWith<$Res> {
  factory _$$RequestOrderCancelModelImplCopyWith(
          _$RequestOrderCancelModelImpl value,
          $Res Function(_$RequestOrderCancelModelImpl) then) =
      __$$RequestOrderCancelModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_order') int idOrder,
      @JsonKey(name: 'cancel_reason') String cancelReason,
      @JsonKey(name: 'refcode') String ref});
}

/// @nodoc
class __$$RequestOrderCancelModelImplCopyWithImpl<$Res>
    extends _$RequestOrderCancelModelCopyWithImpl<$Res,
        _$RequestOrderCancelModelImpl>
    implements _$$RequestOrderCancelModelImplCopyWith<$Res> {
  __$$RequestOrderCancelModelImplCopyWithImpl(
      _$RequestOrderCancelModelImpl _value,
      $Res Function(_$RequestOrderCancelModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idOrder = null,
    Object? cancelReason = null,
    Object? ref = null,
  }) {
    return _then(_$RequestOrderCancelModelImpl(
      idOrder: null == idOrder
          ? _value.idOrder
          : idOrder // ignore: cast_nullable_to_non_nullable
              as int,
      cancelReason: null == cancelReason
          ? _value.cancelReason
          : cancelReason // ignore: cast_nullable_to_non_nullable
              as String,
      ref: null == ref
          ? _value.ref
          : ref // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestOrderCancelModelImpl implements _RequestOrderCancelModel {
  const _$RequestOrderCancelModelImpl(
      {@JsonKey(name: 'id_order') required this.idOrder,
      @JsonKey(name: 'cancel_reason') required this.cancelReason,
      @JsonKey(name: 'refcode') required this.ref});

  factory _$RequestOrderCancelModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestOrderCancelModelImplFromJson(json);

  @override
  @JsonKey(name: 'id_order')
  final int idOrder;
  @override
  @JsonKey(name: 'cancel_reason')
  final String cancelReason;
  @override
  @JsonKey(name: 'refcode')
  final String ref;

  @override
  String toString() {
    return 'RequestOrderCancelModel(idOrder: $idOrder, cancelReason: $cancelReason, ref: $ref)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestOrderCancelModelImpl &&
            (identical(other.idOrder, idOrder) || other.idOrder == idOrder) &&
            (identical(other.cancelReason, cancelReason) ||
                other.cancelReason == cancelReason) &&
            (identical(other.ref, ref) || other.ref == ref));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idOrder, cancelReason, ref);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestOrderCancelModelImplCopyWith<_$RequestOrderCancelModelImpl>
      get copyWith => __$$RequestOrderCancelModelImplCopyWithImpl<
          _$RequestOrderCancelModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestOrderCancelModelImplToJson(
      this,
    );
  }
}

abstract class _RequestOrderCancelModel implements RequestOrderCancelModel {
  const factory _RequestOrderCancelModel(
          {@JsonKey(name: 'id_order') required final int idOrder,
          @JsonKey(name: 'cancel_reason') required final String cancelReason,
          @JsonKey(name: 'refcode') required final String ref}) =
      _$RequestOrderCancelModelImpl;

  factory _RequestOrderCancelModel.fromJson(Map<String, dynamic> json) =
      _$RequestOrderCancelModelImpl.fromJson;

  @override
  @JsonKey(name: 'id_order')
  int get idOrder;
  @override
  @JsonKey(name: 'cancel_reason')
  String get cancelReason;
  @override
  @JsonKey(name: 'refcode')
  String get ref;
  @override
  @JsonKey(ignore: true)
  _$$RequestOrderCancelModelImplCopyWith<_$RequestOrderCancelModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ResponseOrderCancelModel _$ResponseOrderCancelModelFromJson(
    Map<String, dynamic> json) {
  return _ResponseOrderCancelModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseOrderCancelModel {
  @JsonKey(name: 'id_order')
  int get idOrder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseOrderCancelModelCopyWith<ResponseOrderCancelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseOrderCancelModelCopyWith<$Res> {
  factory $ResponseOrderCancelModelCopyWith(ResponseOrderCancelModel value,
          $Res Function(ResponseOrderCancelModel) then) =
      _$ResponseOrderCancelModelCopyWithImpl<$Res, ResponseOrderCancelModel>;
  @useResult
  $Res call({@JsonKey(name: 'id_order') int idOrder});
}

/// @nodoc
class _$ResponseOrderCancelModelCopyWithImpl<$Res,
        $Val extends ResponseOrderCancelModel>
    implements $ResponseOrderCancelModelCopyWith<$Res> {
  _$ResponseOrderCancelModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idOrder = null,
  }) {
    return _then(_value.copyWith(
      idOrder: null == idOrder
          ? _value.idOrder
          : idOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseOrderCancelModelImplCopyWith<$Res>
    implements $ResponseOrderCancelModelCopyWith<$Res> {
  factory _$$ResponseOrderCancelModelImplCopyWith(
          _$ResponseOrderCancelModelImpl value,
          $Res Function(_$ResponseOrderCancelModelImpl) then) =
      __$$ResponseOrderCancelModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'id_order') int idOrder});
}

/// @nodoc
class __$$ResponseOrderCancelModelImplCopyWithImpl<$Res>
    extends _$ResponseOrderCancelModelCopyWithImpl<$Res,
        _$ResponseOrderCancelModelImpl>
    implements _$$ResponseOrderCancelModelImplCopyWith<$Res> {
  __$$ResponseOrderCancelModelImplCopyWithImpl(
      _$ResponseOrderCancelModelImpl _value,
      $Res Function(_$ResponseOrderCancelModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idOrder = null,
  }) {
    return _then(_$ResponseOrderCancelModelImpl(
      idOrder: null == idOrder
          ? _value.idOrder
          : idOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseOrderCancelModelImpl implements _ResponseOrderCancelModel {
  const _$ResponseOrderCancelModelImpl(
      {@JsonKey(name: 'id_order') required this.idOrder});

  factory _$ResponseOrderCancelModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseOrderCancelModelImplFromJson(json);

  @override
  @JsonKey(name: 'id_order')
  final int idOrder;

  @override
  String toString() {
    return 'ResponseOrderCancelModel(idOrder: $idOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseOrderCancelModelImpl &&
            (identical(other.idOrder, idOrder) || other.idOrder == idOrder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseOrderCancelModelImplCopyWith<_$ResponseOrderCancelModelImpl>
      get copyWith => __$$ResponseOrderCancelModelImplCopyWithImpl<
          _$ResponseOrderCancelModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseOrderCancelModelImplToJson(
      this,
    );
  }
}

abstract class _ResponseOrderCancelModel implements ResponseOrderCancelModel {
  const factory _ResponseOrderCancelModel(
          {@JsonKey(name: 'id_order') required final int idOrder}) =
      _$ResponseOrderCancelModelImpl;

  factory _ResponseOrderCancelModel.fromJson(Map<String, dynamic> json) =
      _$ResponseOrderCancelModelImpl.fromJson;

  @override
  @JsonKey(name: 'id_order')
  int get idOrder;
  @override
  @JsonKey(ignore: true)
  _$$ResponseOrderCancelModelImplCopyWith<_$ResponseOrderCancelModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
