// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_update_topending.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestOrderUpdateTopendingModel _$RequestOrderUpdateTopendingModelFromJson(
    Map<String, dynamic> json) {
  return _RequestOrderUpdateTopendingModel.fromJson(json);
}

/// @nodoc
mixin _$RequestOrderUpdateTopendingModel {
  @JsonKey(name: 'id_order')
  int get idOrder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestOrderUpdateTopendingModelCopyWith<RequestOrderUpdateTopendingModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestOrderUpdateTopendingModelCopyWith<$Res> {
  factory $RequestOrderUpdateTopendingModelCopyWith(
          RequestOrderUpdateTopendingModel value,
          $Res Function(RequestOrderUpdateTopendingModel) then) =
      _$RequestOrderUpdateTopendingModelCopyWithImpl<$Res,
          RequestOrderUpdateTopendingModel>;
  @useResult
  $Res call({@JsonKey(name: 'id_order') int idOrder});
}

/// @nodoc
class _$RequestOrderUpdateTopendingModelCopyWithImpl<$Res,
        $Val extends RequestOrderUpdateTopendingModel>
    implements $RequestOrderUpdateTopendingModelCopyWith<$Res> {
  _$RequestOrderUpdateTopendingModelCopyWithImpl(this._value, this._then);

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
abstract class _$$RequestOrderUpdateTopendingModelImplCopyWith<$Res>
    implements $RequestOrderUpdateTopendingModelCopyWith<$Res> {
  factory _$$RequestOrderUpdateTopendingModelImplCopyWith(
          _$RequestOrderUpdateTopendingModelImpl value,
          $Res Function(_$RequestOrderUpdateTopendingModelImpl) then) =
      __$$RequestOrderUpdateTopendingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'id_order') int idOrder});
}

/// @nodoc
class __$$RequestOrderUpdateTopendingModelImplCopyWithImpl<$Res>
    extends _$RequestOrderUpdateTopendingModelCopyWithImpl<$Res,
        _$RequestOrderUpdateTopendingModelImpl>
    implements _$$RequestOrderUpdateTopendingModelImplCopyWith<$Res> {
  __$$RequestOrderUpdateTopendingModelImplCopyWithImpl(
      _$RequestOrderUpdateTopendingModelImpl _value,
      $Res Function(_$RequestOrderUpdateTopendingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idOrder = null,
  }) {
    return _then(_$RequestOrderUpdateTopendingModelImpl(
      idOrder: null == idOrder
          ? _value.idOrder
          : idOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestOrderUpdateTopendingModelImpl
    implements _RequestOrderUpdateTopendingModel {
  const _$RequestOrderUpdateTopendingModelImpl(
      {@JsonKey(name: 'id_order') required this.idOrder});

  factory _$RequestOrderUpdateTopendingModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RequestOrderUpdateTopendingModelImplFromJson(json);

  @override
  @JsonKey(name: 'id_order')
  final int idOrder;

  @override
  String toString() {
    return 'RequestOrderUpdateTopendingModel(idOrder: $idOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestOrderUpdateTopendingModelImpl &&
            (identical(other.idOrder, idOrder) || other.idOrder == idOrder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestOrderUpdateTopendingModelImplCopyWith<
          _$RequestOrderUpdateTopendingModelImpl>
      get copyWith => __$$RequestOrderUpdateTopendingModelImplCopyWithImpl<
          _$RequestOrderUpdateTopendingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestOrderUpdateTopendingModelImplToJson(
      this,
    );
  }
}

abstract class _RequestOrderUpdateTopendingModel
    implements RequestOrderUpdateTopendingModel {
  const factory _RequestOrderUpdateTopendingModel(
          {@JsonKey(name: 'id_order') required final int idOrder}) =
      _$RequestOrderUpdateTopendingModelImpl;

  factory _RequestOrderUpdateTopendingModel.fromJson(
          Map<String, dynamic> json) =
      _$RequestOrderUpdateTopendingModelImpl.fromJson;

  @override
  @JsonKey(name: 'id_order')
  int get idOrder;
  @override
  @JsonKey(ignore: true)
  _$$RequestOrderUpdateTopendingModelImplCopyWith<
          _$RequestOrderUpdateTopendingModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ResponseOrderUpdateTopendingModel _$ResponseOrderUpdateTopendingModelFromJson(
    Map<String, dynamic> json) {
  return _ResponseOrderUpdateTopendingModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseOrderUpdateTopendingModel {
  @JsonKey(name: 'id_order')
  int get idOrder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseOrderUpdateTopendingModelCopyWith<ResponseOrderUpdateTopendingModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseOrderUpdateTopendingModelCopyWith<$Res> {
  factory $ResponseOrderUpdateTopendingModelCopyWith(
          ResponseOrderUpdateTopendingModel value,
          $Res Function(ResponseOrderUpdateTopendingModel) then) =
      _$ResponseOrderUpdateTopendingModelCopyWithImpl<$Res,
          ResponseOrderUpdateTopendingModel>;
  @useResult
  $Res call({@JsonKey(name: 'id_order') int idOrder});
}

/// @nodoc
class _$ResponseOrderUpdateTopendingModelCopyWithImpl<$Res,
        $Val extends ResponseOrderUpdateTopendingModel>
    implements $ResponseOrderUpdateTopendingModelCopyWith<$Res> {
  _$ResponseOrderUpdateTopendingModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ResponseOrderUpdateTopendingModelImplCopyWith<$Res>
    implements $ResponseOrderUpdateTopendingModelCopyWith<$Res> {
  factory _$$ResponseOrderUpdateTopendingModelImplCopyWith(
          _$ResponseOrderUpdateTopendingModelImpl value,
          $Res Function(_$ResponseOrderUpdateTopendingModelImpl) then) =
      __$$ResponseOrderUpdateTopendingModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'id_order') int idOrder});
}

/// @nodoc
class __$$ResponseOrderUpdateTopendingModelImplCopyWithImpl<$Res>
    extends _$ResponseOrderUpdateTopendingModelCopyWithImpl<$Res,
        _$ResponseOrderUpdateTopendingModelImpl>
    implements _$$ResponseOrderUpdateTopendingModelImplCopyWith<$Res> {
  __$$ResponseOrderUpdateTopendingModelImplCopyWithImpl(
      _$ResponseOrderUpdateTopendingModelImpl _value,
      $Res Function(_$ResponseOrderUpdateTopendingModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idOrder = null,
  }) {
    return _then(_$ResponseOrderUpdateTopendingModelImpl(
      idOrder: null == idOrder
          ? _value.idOrder
          : idOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseOrderUpdateTopendingModelImpl
    implements _ResponseOrderUpdateTopendingModel {
  const _$ResponseOrderUpdateTopendingModelImpl(
      {@JsonKey(name: 'id_order') required this.idOrder});

  factory _$ResponseOrderUpdateTopendingModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ResponseOrderUpdateTopendingModelImplFromJson(json);

  @override
  @JsonKey(name: 'id_order')
  final int idOrder;

  @override
  String toString() {
    return 'ResponseOrderUpdateTopendingModel(idOrder: $idOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseOrderUpdateTopendingModelImpl &&
            (identical(other.idOrder, idOrder) || other.idOrder == idOrder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseOrderUpdateTopendingModelImplCopyWith<
          _$ResponseOrderUpdateTopendingModelImpl>
      get copyWith => __$$ResponseOrderUpdateTopendingModelImplCopyWithImpl<
          _$ResponseOrderUpdateTopendingModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseOrderUpdateTopendingModelImplToJson(
      this,
    );
  }
}

abstract class _ResponseOrderUpdateTopendingModel
    implements ResponseOrderUpdateTopendingModel {
  const factory _ResponseOrderUpdateTopendingModel(
          {@JsonKey(name: 'id_order') required final int idOrder}) =
      _$ResponseOrderUpdateTopendingModelImpl;

  factory _ResponseOrderUpdateTopendingModel.fromJson(
          Map<String, dynamic> json) =
      _$ResponseOrderUpdateTopendingModelImpl.fromJson;

  @override
  @JsonKey(name: 'id_order')
  int get idOrder;
  @override
  @JsonKey(ignore: true)
  _$$ResponseOrderUpdateTopendingModelImplCopyWith<
          _$ResponseOrderUpdateTopendingModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
