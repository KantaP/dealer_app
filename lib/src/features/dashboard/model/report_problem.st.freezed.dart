// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_problem.st.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReportProblemPageState _$ReportProblemPageStateFromJson(
    Map<String, dynamic> json) {
  return _ReportProblemPageState.fromJson(json);
}

/// @nodoc
mixin _$ReportProblemPageState {
  bool get isLoading => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportProblemPageStateCopyWith<ReportProblemPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportProblemPageStateCopyWith<$Res> {
  factory $ReportProblemPageStateCopyWith(ReportProblemPageState value,
          $Res Function(ReportProblemPageState) then) =
      _$ReportProblemPageStateCopyWithImpl<$Res, ReportProblemPageState>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$ReportProblemPageStateCopyWithImpl<$Res,
        $Val extends ReportProblemPageState>
    implements $ReportProblemPageStateCopyWith<$Res> {
  _$ReportProblemPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReportProblemPageStateImplCopyWith<$Res>
    implements $ReportProblemPageStateCopyWith<$Res> {
  factory _$$ReportProblemPageStateImplCopyWith(
          _$ReportProblemPageStateImpl value,
          $Res Function(_$ReportProblemPageStateImpl) then) =
      __$$ReportProblemPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$ReportProblemPageStateImplCopyWithImpl<$Res>
    extends _$ReportProblemPageStateCopyWithImpl<$Res,
        _$ReportProblemPageStateImpl>
    implements _$$ReportProblemPageStateImplCopyWith<$Res> {
  __$$ReportProblemPageStateImplCopyWithImpl(
      _$ReportProblemPageStateImpl _value,
      $Res Function(_$ReportProblemPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$ReportProblemPageStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReportProblemPageStateImpl implements _ReportProblemPageState {
  const _$ReportProblemPageStateImpl({this.isLoading = false});

  factory _$ReportProblemPageStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReportProblemPageStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'ReportProblemPageState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReportProblemPageStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReportProblemPageStateImplCopyWith<_$ReportProblemPageStateImpl>
      get copyWith => __$$ReportProblemPageStateImplCopyWithImpl<
          _$ReportProblemPageStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReportProblemPageStateImplToJson(
      this,
    );
  }
}

abstract class _ReportProblemPageState implements ReportProblemPageState {
  const factory _ReportProblemPageState({final bool isLoading}) =
      _$ReportProblemPageStateImpl;

  factory _ReportProblemPageState.fromJson(Map<String, dynamic> json) =
      _$ReportProblemPageStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$ReportProblemPageStateImplCopyWith<_$ReportProblemPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
