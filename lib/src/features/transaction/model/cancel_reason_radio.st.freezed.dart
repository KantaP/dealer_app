// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cancel_reason_radio.st.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CancelReasonRadio _$CancelReasonRadioFromJson(Map<String, dynamic> json) {
  return _CancelReasonRadio.fromJson(json);
}

/// @nodoc
mixin _$CancelReasonRadio {
  String? get selectedChoice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CancelReasonRadioCopyWith<CancelReasonRadio> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CancelReasonRadioCopyWith<$Res> {
  factory $CancelReasonRadioCopyWith(
          CancelReasonRadio value, $Res Function(CancelReasonRadio) then) =
      _$CancelReasonRadioCopyWithImpl<$Res, CancelReasonRadio>;
  @useResult
  $Res call({String? selectedChoice});
}

/// @nodoc
class _$CancelReasonRadioCopyWithImpl<$Res, $Val extends CancelReasonRadio>
    implements $CancelReasonRadioCopyWith<$Res> {
  _$CancelReasonRadioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedChoice = freezed,
  }) {
    return _then(_value.copyWith(
      selectedChoice: freezed == selectedChoice
          ? _value.selectedChoice
          : selectedChoice // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CancelReasonRadioImplCopyWith<$Res>
    implements $CancelReasonRadioCopyWith<$Res> {
  factory _$$CancelReasonRadioImplCopyWith(_$CancelReasonRadioImpl value,
          $Res Function(_$CancelReasonRadioImpl) then) =
      __$$CancelReasonRadioImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? selectedChoice});
}

/// @nodoc
class __$$CancelReasonRadioImplCopyWithImpl<$Res>
    extends _$CancelReasonRadioCopyWithImpl<$Res, _$CancelReasonRadioImpl>
    implements _$$CancelReasonRadioImplCopyWith<$Res> {
  __$$CancelReasonRadioImplCopyWithImpl(_$CancelReasonRadioImpl _value,
      $Res Function(_$CancelReasonRadioImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedChoice = freezed,
  }) {
    return _then(_$CancelReasonRadioImpl(
      selectedChoice: freezed == selectedChoice
          ? _value.selectedChoice
          : selectedChoice // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CancelReasonRadioImpl implements _CancelReasonRadio {
  const _$CancelReasonRadioImpl({this.selectedChoice = ''});

  factory _$CancelReasonRadioImpl.fromJson(Map<String, dynamic> json) =>
      _$$CancelReasonRadioImplFromJson(json);

  @override
  @JsonKey()
  final String? selectedChoice;

  @override
  String toString() {
    return 'CancelReasonRadio(selectedChoice: $selectedChoice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelReasonRadioImpl &&
            (identical(other.selectedChoice, selectedChoice) ||
                other.selectedChoice == selectedChoice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, selectedChoice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelReasonRadioImplCopyWith<_$CancelReasonRadioImpl> get copyWith =>
      __$$CancelReasonRadioImplCopyWithImpl<_$CancelReasonRadioImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CancelReasonRadioImplToJson(
      this,
    );
  }
}

abstract class _CancelReasonRadio implements CancelReasonRadio {
  const factory _CancelReasonRadio({final String? selectedChoice}) =
      _$CancelReasonRadioImpl;

  factory _CancelReasonRadio.fromJson(Map<String, dynamic> json) =
      _$CancelReasonRadioImpl.fromJson;

  @override
  String? get selectedChoice;
  @override
  @JsonKey(ignore: true)
  _$$CancelReasonRadioImplCopyWith<_$CancelReasonRadioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
