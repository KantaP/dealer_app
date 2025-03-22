// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_finish.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestOrderFinishModel _$RequestOrderFinishModelFromJson(
    Map<String, dynamic> json) {
  return _RequestOrderFinishModel.fromJson(json);
}

/// @nodoc
mixin _$RequestOrderFinishModel {
  @JsonKey(name: 'id_order')
  int get idOrder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestOrderFinishModelCopyWith<RequestOrderFinishModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestOrderFinishModelCopyWith<$Res> {
  factory $RequestOrderFinishModelCopyWith(RequestOrderFinishModel value,
          $Res Function(RequestOrderFinishModel) then) =
      _$RequestOrderFinishModelCopyWithImpl<$Res, RequestOrderFinishModel>;
  @useResult
  $Res call({@JsonKey(name: 'id_order') int idOrder});
}

/// @nodoc
class _$RequestOrderFinishModelCopyWithImpl<$Res,
        $Val extends RequestOrderFinishModel>
    implements $RequestOrderFinishModelCopyWith<$Res> {
  _$RequestOrderFinishModelCopyWithImpl(this._value, this._then);

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
abstract class _$$RequestOrderFinishModelImplCopyWith<$Res>
    implements $RequestOrderFinishModelCopyWith<$Res> {
  factory _$$RequestOrderFinishModelImplCopyWith(
          _$RequestOrderFinishModelImpl value,
          $Res Function(_$RequestOrderFinishModelImpl) then) =
      __$$RequestOrderFinishModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'id_order') int idOrder});
}

/// @nodoc
class __$$RequestOrderFinishModelImplCopyWithImpl<$Res>
    extends _$RequestOrderFinishModelCopyWithImpl<$Res,
        _$RequestOrderFinishModelImpl>
    implements _$$RequestOrderFinishModelImplCopyWith<$Res> {
  __$$RequestOrderFinishModelImplCopyWithImpl(
      _$RequestOrderFinishModelImpl _value,
      $Res Function(_$RequestOrderFinishModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idOrder = null,
  }) {
    return _then(_$RequestOrderFinishModelImpl(
      idOrder: null == idOrder
          ? _value.idOrder
          : idOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestOrderFinishModelImpl implements _RequestOrderFinishModel {
  const _$RequestOrderFinishModelImpl(
      {@JsonKey(name: 'id_order') required this.idOrder});

  factory _$RequestOrderFinishModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestOrderFinishModelImplFromJson(json);

  @override
  @JsonKey(name: 'id_order')
  final int idOrder;

  @override
  String toString() {
    return 'RequestOrderFinishModel(idOrder: $idOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestOrderFinishModelImpl &&
            (identical(other.idOrder, idOrder) || other.idOrder == idOrder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestOrderFinishModelImplCopyWith<_$RequestOrderFinishModelImpl>
      get copyWith => __$$RequestOrderFinishModelImplCopyWithImpl<
          _$RequestOrderFinishModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestOrderFinishModelImplToJson(
      this,
    );
  }
}

abstract class _RequestOrderFinishModel implements RequestOrderFinishModel {
  const factory _RequestOrderFinishModel(
          {@JsonKey(name: 'id_order') required final int idOrder}) =
      _$RequestOrderFinishModelImpl;

  factory _RequestOrderFinishModel.fromJson(Map<String, dynamic> json) =
      _$RequestOrderFinishModelImpl.fromJson;

  @override
  @JsonKey(name: 'id_order')
  int get idOrder;
  @override
  @JsonKey(ignore: true)
  _$$RequestOrderFinishModelImplCopyWith<_$RequestOrderFinishModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ResponseOrderFinishModel _$ResponseOrderFinishModelFromJson(
    Map<String, dynamic> json) {
  return _ResponseOrderFinishModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseOrderFinishModel {
  @JsonKey(name: 'id_order')
  int get idOrder => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseOrderFinishModelCopyWith<ResponseOrderFinishModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseOrderFinishModelCopyWith<$Res> {
  factory $ResponseOrderFinishModelCopyWith(ResponseOrderFinishModel value,
          $Res Function(ResponseOrderFinishModel) then) =
      _$ResponseOrderFinishModelCopyWithImpl<$Res, ResponseOrderFinishModel>;
  @useResult
  $Res call({@JsonKey(name: 'id_order') int idOrder});
}

/// @nodoc
class _$ResponseOrderFinishModelCopyWithImpl<$Res,
        $Val extends ResponseOrderFinishModel>
    implements $ResponseOrderFinishModelCopyWith<$Res> {
  _$ResponseOrderFinishModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ResponseOrderFinishModelImplCopyWith<$Res>
    implements $ResponseOrderFinishModelCopyWith<$Res> {
  factory _$$ResponseOrderFinishModelImplCopyWith(
          _$ResponseOrderFinishModelImpl value,
          $Res Function(_$ResponseOrderFinishModelImpl) then) =
      __$$ResponseOrderFinishModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'id_order') int idOrder});
}

/// @nodoc
class __$$ResponseOrderFinishModelImplCopyWithImpl<$Res>
    extends _$ResponseOrderFinishModelCopyWithImpl<$Res,
        _$ResponseOrderFinishModelImpl>
    implements _$$ResponseOrderFinishModelImplCopyWith<$Res> {
  __$$ResponseOrderFinishModelImplCopyWithImpl(
      _$ResponseOrderFinishModelImpl _value,
      $Res Function(_$ResponseOrderFinishModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idOrder = null,
  }) {
    return _then(_$ResponseOrderFinishModelImpl(
      idOrder: null == idOrder
          ? _value.idOrder
          : idOrder // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseOrderFinishModelImpl implements _ResponseOrderFinishModel {
  const _$ResponseOrderFinishModelImpl(
      {@JsonKey(name: 'id_order') required this.idOrder});

  factory _$ResponseOrderFinishModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseOrderFinishModelImplFromJson(json);

  @override
  @JsonKey(name: 'id_order')
  final int idOrder;

  @override
  String toString() {
    return 'ResponseOrderFinishModel(idOrder: $idOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseOrderFinishModelImpl &&
            (identical(other.idOrder, idOrder) || other.idOrder == idOrder));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idOrder);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseOrderFinishModelImplCopyWith<_$ResponseOrderFinishModelImpl>
      get copyWith => __$$ResponseOrderFinishModelImplCopyWithImpl<
          _$ResponseOrderFinishModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseOrderFinishModelImplToJson(
      this,
    );
  }
}

abstract class _ResponseOrderFinishModel implements ResponseOrderFinishModel {
  const factory _ResponseOrderFinishModel(
          {@JsonKey(name: 'id_order') required final int idOrder}) =
      _$ResponseOrderFinishModelImpl;

  factory _ResponseOrderFinishModel.fromJson(Map<String, dynamic> json) =
      _$ResponseOrderFinishModelImpl.fromJson;

  @override
  @JsonKey(name: 'id_order')
  int get idOrder;
  @override
  @JsonKey(ignore: true)
  _$$ResponseOrderFinishModelImplCopyWith<_$ResponseOrderFinishModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
