// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_download.st.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionDownloadPageState _$TransactionDownloadPageStateFromJson(
    Map<String, dynamic> json) {
  return _TransactionDownloadPageState.fromJson(json);
}

/// @nodoc
mixin _$TransactionDownloadPageState {
  String? get docType => throw _privateConstructorUsedError;
  String? get startDate => throw _privateConstructorUsedError;
  String? get endDate => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  bool get canSubmit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionDownloadPageStateCopyWith<TransactionDownloadPageState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionDownloadPageStateCopyWith<$Res> {
  factory $TransactionDownloadPageStateCopyWith(
          TransactionDownloadPageState value,
          $Res Function(TransactionDownloadPageState) then) =
      _$TransactionDownloadPageStateCopyWithImpl<$Res,
          TransactionDownloadPageState>;
  @useResult
  $Res call(
      {String? docType,
      String? startDate,
      String? endDate,
      String? email,
      bool canSubmit});
}

/// @nodoc
class _$TransactionDownloadPageStateCopyWithImpl<$Res,
        $Val extends TransactionDownloadPageState>
    implements $TransactionDownloadPageStateCopyWith<$Res> {
  _$TransactionDownloadPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docType = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? email = freezed,
    Object? canSubmit = null,
  }) {
    return _then(_value.copyWith(
      docType: freezed == docType
          ? _value.docType
          : docType // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      canSubmit: null == canSubmit
          ? _value.canSubmit
          : canSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionDownloadPageStateImplCopyWith<$Res>
    implements $TransactionDownloadPageStateCopyWith<$Res> {
  factory _$$TransactionDownloadPageStateImplCopyWith(
          _$TransactionDownloadPageStateImpl value,
          $Res Function(_$TransactionDownloadPageStateImpl) then) =
      __$$TransactionDownloadPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? docType,
      String? startDate,
      String? endDate,
      String? email,
      bool canSubmit});
}

/// @nodoc
class __$$TransactionDownloadPageStateImplCopyWithImpl<$Res>
    extends _$TransactionDownloadPageStateCopyWithImpl<$Res,
        _$TransactionDownloadPageStateImpl>
    implements _$$TransactionDownloadPageStateImplCopyWith<$Res> {
  __$$TransactionDownloadPageStateImplCopyWithImpl(
      _$TransactionDownloadPageStateImpl _value,
      $Res Function(_$TransactionDownloadPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? docType = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? email = freezed,
    Object? canSubmit = null,
  }) {
    return _then(_$TransactionDownloadPageStateImpl(
      docType: freezed == docType
          ? _value.docType
          : docType // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      canSubmit: null == canSubmit
          ? _value.canSubmit
          : canSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionDownloadPageStateImpl
    implements _TransactionDownloadPageState {
  const _$TransactionDownloadPageStateImpl(
      {this.docType,
      this.startDate,
      this.endDate,
      this.email,
      this.canSubmit = false});

  factory _$TransactionDownloadPageStateImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TransactionDownloadPageStateImplFromJson(json);

  @override
  final String? docType;
  @override
  final String? startDate;
  @override
  final String? endDate;
  @override
  final String? email;
  @override
  @JsonKey()
  final bool canSubmit;

  @override
  String toString() {
    return 'TransactionDownloadPageState(docType: $docType, startDate: $startDate, endDate: $endDate, email: $email, canSubmit: $canSubmit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionDownloadPageStateImpl &&
            (identical(other.docType, docType) || other.docType == docType) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.canSubmit, canSubmit) ||
                other.canSubmit == canSubmit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, docType, startDate, endDate, email, canSubmit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionDownloadPageStateImplCopyWith<
          _$TransactionDownloadPageStateImpl>
      get copyWith => __$$TransactionDownloadPageStateImplCopyWithImpl<
          _$TransactionDownloadPageStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionDownloadPageStateImplToJson(
      this,
    );
  }
}

abstract class _TransactionDownloadPageState
    implements TransactionDownloadPageState {
  const factory _TransactionDownloadPageState(
      {final String? docType,
      final String? startDate,
      final String? endDate,
      final String? email,
      final bool canSubmit}) = _$TransactionDownloadPageStateImpl;

  factory _TransactionDownloadPageState.fromJson(Map<String, dynamic> json) =
      _$TransactionDownloadPageStateImpl.fromJson;

  @override
  String? get docType;
  @override
  String? get startDate;
  @override
  String? get endDate;
  @override
  String? get email;
  @override
  bool get canSubmit;
  @override
  @JsonKey(ignore: true)
  _$$TransactionDownloadPageStateImplCopyWith<
          _$TransactionDownloadPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
