// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_update_toreceive.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestOrderUpdateToreceiveModel _$RequestOrderUpdateToreceiveModelFromJson(
    Map<String, dynamic> json) {
  return _RequestOrderUpdateToreceiveModel.fromJson(json);
}

/// @nodoc
mixin _$RequestOrderUpdateToreceiveModel {
  @JsonKey(name: 'id_order')
  int get idOrder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestOrderUpdateToreceiveModelCopyWith<RequestOrderUpdateToreceiveModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestOrderUpdateToreceiveModelCopyWith<$Res> {
  factory $RequestOrderUpdateToreceiveModelCopyWith(
          RequestOrderUpdateToreceiveModel value,
          $Res Function(RequestOrderUpdateToreceiveModel) then) =
      _$RequestOrderUpdateToreceiveModelCopyWithImpl<$Res,
          RequestOrderUpdateToreceiveModel>;
  @useResult
  $Res call({@JsonKey(name: 'id_order') int idOrder});
}

/// @nodoc
class _$RequestOrderUpdateToreceiveModelCopyWithImpl<$Res,
        $Val extends RequestOrderUpdateToreceiveModel>
    implements $RequestOrderUpdateToreceiveModelCopyWith<$Res> {
  _$RequestOrderUpdateToreceiveModelCopyWithImpl(this._value, this._then);

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
abstract class _$$RequestOrderUpdateToreceiveModelImplCopyWith<$Res>
    implements $RequestOrderUpdateToreceiveModelCopyWith<$Res> {
  factory _$$RequestOrderUpdateToreceiveModelImplCopyWith(
          _$RequestOrderUpdateToreceiveModelImpl value,
          $Res Function(_$RequestOrderUpdateToreceiveModelImpl) then) =
      __$$RequestOrderUpdateToreceiveModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'id_order') int idOrder});
}

/// @nodoc
class __$$RequestOrderUpdateToreceiveModelImplCopyWithImpl<$Res>
    extends _$RequestOrderUpdateToreceiveModelCopyWithImpl<$Res,
        _$RequestOrderUpdateToreceiveModelImpl>
    implements _$$RequestOrderUpdateToreceiveModelImplCopyWith<$Res> {
  __$$RequestOrderUpdateToreceiveModelImplCopyWithImpl(
      _$RequestOrderUpdateToreceiveModelImpl _value,
      $Res Function(_$RequestOrderUpdateToreceiveModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idOrder = null,
  }) {
    return _then(_$RequestOrderUpdateToreceiveModelImpl(
      idOrder: null == idOrder
          ? _value.idOrder
          : idOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestOrderUpdateToreceiveModelImpl
    implements _RequestOrderUpdateToreceiveModel {
  const _$RequestOrderUpdateToreceiveModelImpl(
      {@JsonKey(name: 'id_order') required this.idOrder});

  factory _$RequestOrderUpdateToreceiveModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$RequestOrderUpdateToreceiveModelImplFromJson(json);

  @override
  @JsonKey(name: 'id_order')
  final int idOrder;

  @override
  String toString() {
    return 'RequestOrderUpdateToreceiveModel(idOrder: $idOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestOrderUpdateToreceiveModelImpl &&
            (identical(other.idOrder, idOrder) || other.idOrder == idOrder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestOrderUpdateToreceiveModelImplCopyWith<
          _$RequestOrderUpdateToreceiveModelImpl>
      get copyWith => __$$RequestOrderUpdateToreceiveModelImplCopyWithImpl<
          _$RequestOrderUpdateToreceiveModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestOrderUpdateToreceiveModelImplToJson(
      this,
    );
  }
}

abstract class _RequestOrderUpdateToreceiveModel
    implements RequestOrderUpdateToreceiveModel {
  const factory _RequestOrderUpdateToreceiveModel(
          {@JsonKey(name: 'id_order') required final int idOrder}) =
      _$RequestOrderUpdateToreceiveModelImpl;

  factory _RequestOrderUpdateToreceiveModel.fromJson(
          Map<String, dynamic> json) =
      _$RequestOrderUpdateToreceiveModelImpl.fromJson;

  @override
  @JsonKey(name: 'id_order')
  int get idOrder;
  @override
  @JsonKey(ignore: true)
  _$$RequestOrderUpdateToreceiveModelImplCopyWith<
          _$RequestOrderUpdateToreceiveModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ResponseOrderUpdateToreceiveModel _$ResponseOrderUpdateToreceiveModelFromJson(
    Map<String, dynamic> json) {
  return _ResponseOrderUpdateToreceiveModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseOrderUpdateToreceiveModel {
  @JsonKey(name: 'id_order')
  int get idOrder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseOrderUpdateToreceiveModelCopyWith<ResponseOrderUpdateToreceiveModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseOrderUpdateToreceiveModelCopyWith<$Res> {
  factory $ResponseOrderUpdateToreceiveModelCopyWith(
          ResponseOrderUpdateToreceiveModel value,
          $Res Function(ResponseOrderUpdateToreceiveModel) then) =
      _$ResponseOrderUpdateToreceiveModelCopyWithImpl<$Res,
          ResponseOrderUpdateToreceiveModel>;
  @useResult
  $Res call({@JsonKey(name: 'id_order') int idOrder});
}

/// @nodoc
class _$ResponseOrderUpdateToreceiveModelCopyWithImpl<$Res,
        $Val extends ResponseOrderUpdateToreceiveModel>
    implements $ResponseOrderUpdateToreceiveModelCopyWith<$Res> {
  _$ResponseOrderUpdateToreceiveModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ResponseOrderUpdateToreceiveModelImplCopyWith<$Res>
    implements $ResponseOrderUpdateToreceiveModelCopyWith<$Res> {
  factory _$$ResponseOrderUpdateToreceiveModelImplCopyWith(
          _$ResponseOrderUpdateToreceiveModelImpl value,
          $Res Function(_$ResponseOrderUpdateToreceiveModelImpl) then) =
      __$$ResponseOrderUpdateToreceiveModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'id_order') int idOrder});
}

/// @nodoc
class __$$ResponseOrderUpdateToreceiveModelImplCopyWithImpl<$Res>
    extends _$ResponseOrderUpdateToreceiveModelCopyWithImpl<$Res,
        _$ResponseOrderUpdateToreceiveModelImpl>
    implements _$$ResponseOrderUpdateToreceiveModelImplCopyWith<$Res> {
  __$$ResponseOrderUpdateToreceiveModelImplCopyWithImpl(
      _$ResponseOrderUpdateToreceiveModelImpl _value,
      $Res Function(_$ResponseOrderUpdateToreceiveModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idOrder = null,
  }) {
    return _then(_$ResponseOrderUpdateToreceiveModelImpl(
      idOrder: null == idOrder
          ? _value.idOrder
          : idOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseOrderUpdateToreceiveModelImpl
    implements _ResponseOrderUpdateToreceiveModel {
  const _$ResponseOrderUpdateToreceiveModelImpl(
      {@JsonKey(name: 'id_order') required this.idOrder});

  factory _$ResponseOrderUpdateToreceiveModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ResponseOrderUpdateToreceiveModelImplFromJson(json);

  @override
  @JsonKey(name: 'id_order')
  final int idOrder;

  @override
  String toString() {
    return 'ResponseOrderUpdateToreceiveModel(idOrder: $idOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseOrderUpdateToreceiveModelImpl &&
            (identical(other.idOrder, idOrder) || other.idOrder == idOrder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseOrderUpdateToreceiveModelImplCopyWith<
          _$ResponseOrderUpdateToreceiveModelImpl>
      get copyWith => __$$ResponseOrderUpdateToreceiveModelImplCopyWithImpl<
          _$ResponseOrderUpdateToreceiveModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseOrderUpdateToreceiveModelImplToJson(
      this,
    );
  }
}

abstract class _ResponseOrderUpdateToreceiveModel
    implements ResponseOrderUpdateToreceiveModel {
  const factory _ResponseOrderUpdateToreceiveModel(
          {@JsonKey(name: 'id_order') required final int idOrder}) =
      _$ResponseOrderUpdateToreceiveModelImpl;

  factory _ResponseOrderUpdateToreceiveModel.fromJson(
          Map<String, dynamic> json) =
      _$ResponseOrderUpdateToreceiveModelImpl.fromJson;

  @override
  @JsonKey(name: 'id_order')
  int get idOrder;
  @override
  @JsonKey(ignore: true)
  _$$ResponseOrderUpdateToreceiveModelImplCopyWith<
          _$ResponseOrderUpdateToreceiveModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
