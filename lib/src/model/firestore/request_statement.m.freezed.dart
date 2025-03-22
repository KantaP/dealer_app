// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_statement.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestStatementModel _$RequestStatementModelFromJson(
    Map<String, dynamic> json) {
  return _RequestStatementModel.fromJson(json);
}

/// @nodoc
mixin _$RequestStatementModel {
  @JsonKey(name: 'channel')
  String get channel => throw _privateConstructorUsedError;
  @JsonKey(name: 'fromDate')
  String get fromDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'toDate')
  String get toDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'userid')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'request_date')
  String get requestDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestStatementModelCopyWith<RequestStatementModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestStatementModelCopyWith<$Res> {
  factory $RequestStatementModelCopyWith(RequestStatementModel value,
          $Res Function(RequestStatementModel) then) =
      _$RequestStatementModelCopyWithImpl<$Res, RequestStatementModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'channel') String channel,
      @JsonKey(name: 'fromDate') String fromDate,
      @JsonKey(name: 'toDate') String toDate,
      @JsonKey(name: 'userid') String userId,
      @JsonKey(name: 'request_date') String requestDate,
      @JsonKey(name: 'email') String email});
}

/// @nodoc
class _$RequestStatementModelCopyWithImpl<$Res,
        $Val extends RequestStatementModel>
    implements $RequestStatementModelCopyWith<$Res> {
  _$RequestStatementModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channel = null,
    Object? fromDate = null,
    Object? toDate = null,
    Object? userId = null,
    Object? requestDate = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String,
      fromDate: null == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as String,
      toDate: null == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      requestDate: null == requestDate
          ? _value.requestDate
          : requestDate // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestStatementModelImplCopyWith<$Res>
    implements $RequestStatementModelCopyWith<$Res> {
  factory _$$RequestStatementModelImplCopyWith(
          _$RequestStatementModelImpl value,
          $Res Function(_$RequestStatementModelImpl) then) =
      __$$RequestStatementModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'channel') String channel,
      @JsonKey(name: 'fromDate') String fromDate,
      @JsonKey(name: 'toDate') String toDate,
      @JsonKey(name: 'userid') String userId,
      @JsonKey(name: 'request_date') String requestDate,
      @JsonKey(name: 'email') String email});
}

/// @nodoc
class __$$RequestStatementModelImplCopyWithImpl<$Res>
    extends _$RequestStatementModelCopyWithImpl<$Res,
        _$RequestStatementModelImpl>
    implements _$$RequestStatementModelImplCopyWith<$Res> {
  __$$RequestStatementModelImplCopyWithImpl(_$RequestStatementModelImpl _value,
      $Res Function(_$RequestStatementModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channel = null,
    Object? fromDate = null,
    Object? toDate = null,
    Object? userId = null,
    Object? requestDate = null,
    Object? email = null,
  }) {
    return _then(_$RequestStatementModelImpl(
      channel: null == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as String,
      fromDate: null == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as String,
      toDate: null == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      requestDate: null == requestDate
          ? _value.requestDate
          : requestDate // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestStatementModelImpl implements _RequestStatementModel {
  const _$RequestStatementModelImpl(
      {@JsonKey(name: 'channel') this.channel = '',
      @JsonKey(name: 'fromDate') this.fromDate = '',
      @JsonKey(name: 'toDate') this.toDate = '',
      @JsonKey(name: 'userid') this.userId = '',
      @JsonKey(name: 'request_date') this.requestDate = '',
      @JsonKey(name: 'email') this.email = ''});

  factory _$RequestStatementModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestStatementModelImplFromJson(json);

  @override
  @JsonKey(name: 'channel')
  final String channel;
  @override
  @JsonKey(name: 'fromDate')
  final String fromDate;
  @override
  @JsonKey(name: 'toDate')
  final String toDate;
  @override
  @JsonKey(name: 'userid')
  final String userId;
  @override
  @JsonKey(name: 'request_date')
  final String requestDate;
  @override
  @JsonKey(name: 'email')
  final String email;

  @override
  String toString() {
    return 'RequestStatementModel(channel: $channel, fromDate: $fromDate, toDate: $toDate, userId: $userId, requestDate: $requestDate, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestStatementModelImpl &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.fromDate, fromDate) ||
                other.fromDate == fromDate) &&
            (identical(other.toDate, toDate) || other.toDate == toDate) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.requestDate, requestDate) ||
                other.requestDate == requestDate) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, channel, fromDate, toDate, userId, requestDate, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestStatementModelImplCopyWith<_$RequestStatementModelImpl>
      get copyWith => __$$RequestStatementModelImplCopyWithImpl<
          _$RequestStatementModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestStatementModelImplToJson(
      this,
    );
  }
}

abstract class _RequestStatementModel implements RequestStatementModel {
  const factory _RequestStatementModel(
          {@JsonKey(name: 'channel') final String channel,
          @JsonKey(name: 'fromDate') final String fromDate,
          @JsonKey(name: 'toDate') final String toDate,
          @JsonKey(name: 'userid') final String userId,
          @JsonKey(name: 'request_date') final String requestDate,
          @JsonKey(name: 'email') final String email}) =
      _$RequestStatementModelImpl;

  factory _RequestStatementModel.fromJson(Map<String, dynamic> json) =
      _$RequestStatementModelImpl.fromJson;

  @override
  @JsonKey(name: 'channel')
  String get channel;
  @override
  @JsonKey(name: 'fromDate')
  String get fromDate;
  @override
  @JsonKey(name: 'toDate')
  String get toDate;
  @override
  @JsonKey(name: 'userid')
  String get userId;
  @override
  @JsonKey(name: 'request_date')
  String get requestDate;
  @override
  @JsonKey(name: 'email')
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$RequestStatementModelImplCopyWith<_$RequestStatementModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
