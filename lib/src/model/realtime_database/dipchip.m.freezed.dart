// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dipchip.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DipchipModel _$DipchipModelFromJson(Map<String, dynamic> json) {
  return _DipchipModel.fromJson(json);
}

/// @nodoc
mixin _$DipchipModel {
  @JsonKey(name: 'dipchip_status')
  dynamic get dipchipStatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'dipchip_check_date')
  dynamic get dipchipCheckDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DipchipModelCopyWith<DipchipModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DipchipModelCopyWith<$Res> {
  factory $DipchipModelCopyWith(
          DipchipModel value, $Res Function(DipchipModel) then) =
      _$DipchipModelCopyWithImpl<$Res, DipchipModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'dipchip_status') dynamic dipchipStatus,
      @JsonKey(name: 'dipchip_check_date') dynamic dipchipCheckDate});
}

/// @nodoc
class _$DipchipModelCopyWithImpl<$Res, $Val extends DipchipModel>
    implements $DipchipModelCopyWith<$Res> {
  _$DipchipModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dipchipStatus = freezed,
    Object? dipchipCheckDate = freezed,
  }) {
    return _then(_value.copyWith(
      dipchipStatus: freezed == dipchipStatus
          ? _value.dipchipStatus
          : dipchipStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dipchipCheckDate: freezed == dipchipCheckDate
          ? _value.dipchipCheckDate
          : dipchipCheckDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DipchipModelImplCopyWith<$Res>
    implements $DipchipModelCopyWith<$Res> {
  factory _$$DipchipModelImplCopyWith(
          _$DipchipModelImpl value, $Res Function(_$DipchipModelImpl) then) =
      __$$DipchipModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'dipchip_status') dynamic dipchipStatus,
      @JsonKey(name: 'dipchip_check_date') dynamic dipchipCheckDate});
}

/// @nodoc
class __$$DipchipModelImplCopyWithImpl<$Res>
    extends _$DipchipModelCopyWithImpl<$Res, _$DipchipModelImpl>
    implements _$$DipchipModelImplCopyWith<$Res> {
  __$$DipchipModelImplCopyWithImpl(
      _$DipchipModelImpl _value, $Res Function(_$DipchipModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dipchipStatus = freezed,
    Object? dipchipCheckDate = freezed,
  }) {
    return _then(_$DipchipModelImpl(
      dipchipStatus:
          freezed == dipchipStatus ? _value.dipchipStatus! : dipchipStatus,
      dipchipCheckDate: freezed == dipchipCheckDate
          ? _value.dipchipCheckDate!
          : dipchipCheckDate,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DipchipModelImpl implements _DipchipModel {
  const _$DipchipModelImpl(
      {@JsonKey(name: 'dipchip_status') this.dipchipStatus = false,
      @JsonKey(name: 'dipchip_check_date') this.dipchipCheckDate = ''});

  factory _$DipchipModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DipchipModelImplFromJson(json);

  @override
  @JsonKey(name: 'dipchip_status')
  final dynamic dipchipStatus;
  @override
  @JsonKey(name: 'dipchip_check_date')
  final dynamic dipchipCheckDate;

  @override
  String toString() {
    return 'DipchipModel(dipchipStatus: $dipchipStatus, dipchipCheckDate: $dipchipCheckDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DipchipModelImpl &&
            const DeepCollectionEquality()
                .equals(other.dipchipStatus, dipchipStatus) &&
            const DeepCollectionEquality()
                .equals(other.dipchipCheckDate, dipchipCheckDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(dipchipStatus),
      const DeepCollectionEquality().hash(dipchipCheckDate));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DipchipModelImplCopyWith<_$DipchipModelImpl> get copyWith =>
      __$$DipchipModelImplCopyWithImpl<_$DipchipModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DipchipModelImplToJson(
      this,
    );
  }
}

abstract class _DipchipModel implements DipchipModel {
  const factory _DipchipModel(
      {@JsonKey(name: 'dipchip_status') final dynamic dipchipStatus,
      @JsonKey(name: 'dipchip_check_date')
      final dynamic dipchipCheckDate}) = _$DipchipModelImpl;

  factory _DipchipModel.fromJson(Map<String, dynamic> json) =
      _$DipchipModelImpl.fromJson;

  @override
  @JsonKey(name: 'dipchip_status')
  dynamic get dipchipStatus;
  @override
  @JsonKey(name: 'dipchip_check_date')
  dynamic get dipchipCheckDate;
  @override
  @JsonKey(ignore: true)
  _$$DipchipModelImplCopyWith<_$DipchipModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
