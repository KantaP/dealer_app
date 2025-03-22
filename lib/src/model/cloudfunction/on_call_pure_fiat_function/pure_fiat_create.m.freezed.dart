// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pure_fiat_create.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PureFiatCreateRequestModel _$PureFiatCreateRequestModelFromJson(
    Map<String, dynamic> json) {
  return _PureFiatCreateRequestModel.fromJson(json);
}

/// @nodoc
mixin _$PureFiatCreateRequestModel {
  @JsonKey(name: 'id_user')
  String get idUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_channel')
  String get paymentChannel => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_autosettle')
  bool get autoSettle => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_currency')
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_type')
  String get paymentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_value_actual')
  double get paymentValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_account_des_actual')
  String get accountDestination => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_value_fee')
  double get valueFee => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_account_src_actual')
  String get accountSource => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_needapprove')
  bool get needApprove => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_needaudit')
  bool get needAudit => throw _privateConstructorUsedError;
  @JsonKey(name: 'refcode')
  String get refCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_qrdata')
  String get qrData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PureFiatCreateRequestModelCopyWith<PureFiatCreateRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PureFiatCreateRequestModelCopyWith<$Res> {
  factory $PureFiatCreateRequestModelCopyWith(PureFiatCreateRequestModel value,
          $Res Function(PureFiatCreateRequestModel) then) =
      _$PureFiatCreateRequestModelCopyWithImpl<$Res,
          PureFiatCreateRequestModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_user') String idUser,
      @JsonKey(name: 'payment_channel') String paymentChannel,
      @JsonKey(name: 'payment_autosettle') bool autoSettle,
      @JsonKey(name: 'payment_currency') String currency,
      @JsonKey(name: 'payment_type') String paymentType,
      @JsonKey(name: 'payment_value_actual') double paymentValue,
      @JsonKey(name: 'payment_account_des_actual') String accountDestination,
      @JsonKey(name: 'payment_value_fee') double valueFee,
      @JsonKey(name: 'payment_account_src_actual') String accountSource,
      @JsonKey(name: 'is_needapprove') bool needApprove,
      @JsonKey(name: 'is_needaudit') bool needAudit,
      @JsonKey(name: 'refcode') String refCode,
      @JsonKey(name: 'payment_qrdata') String qrData});
}

/// @nodoc
class _$PureFiatCreateRequestModelCopyWithImpl<$Res,
        $Val extends PureFiatCreateRequestModel>
    implements $PureFiatCreateRequestModelCopyWith<$Res> {
  _$PureFiatCreateRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idUser = null,
    Object? paymentChannel = null,
    Object? autoSettle = null,
    Object? currency = null,
    Object? paymentType = null,
    Object? paymentValue = null,
    Object? accountDestination = null,
    Object? valueFee = null,
    Object? accountSource = null,
    Object? needApprove = null,
    Object? needAudit = null,
    Object? refCode = null,
    Object? qrData = null,
  }) {
    return _then(_value.copyWith(
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as String,
      paymentChannel: null == paymentChannel
          ? _value.paymentChannel
          : paymentChannel // ignore: cast_nullable_to_non_nullable
              as String,
      autoSettle: null == autoSettle
          ? _value.autoSettle
          : autoSettle // ignore: cast_nullable_to_non_nullable
              as bool,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String,
      paymentValue: null == paymentValue
          ? _value.paymentValue
          : paymentValue // ignore: cast_nullable_to_non_nullable
              as double,
      accountDestination: null == accountDestination
          ? _value.accountDestination
          : accountDestination // ignore: cast_nullable_to_non_nullable
              as String,
      valueFee: null == valueFee
          ? _value.valueFee
          : valueFee // ignore: cast_nullable_to_non_nullable
              as double,
      accountSource: null == accountSource
          ? _value.accountSource
          : accountSource // ignore: cast_nullable_to_non_nullable
              as String,
      needApprove: null == needApprove
          ? _value.needApprove
          : needApprove // ignore: cast_nullable_to_non_nullable
              as bool,
      needAudit: null == needAudit
          ? _value.needAudit
          : needAudit // ignore: cast_nullable_to_non_nullable
              as bool,
      refCode: null == refCode
          ? _value.refCode
          : refCode // ignore: cast_nullable_to_non_nullable
              as String,
      qrData: null == qrData
          ? _value.qrData
          : qrData // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PureFiatCreateRequestModelImplCopyWith<$Res>
    implements $PureFiatCreateRequestModelCopyWith<$Res> {
  factory _$$PureFiatCreateRequestModelImplCopyWith(
          _$PureFiatCreateRequestModelImpl value,
          $Res Function(_$PureFiatCreateRequestModelImpl) then) =
      __$$PureFiatCreateRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_user') String idUser,
      @JsonKey(name: 'payment_channel') String paymentChannel,
      @JsonKey(name: 'payment_autosettle') bool autoSettle,
      @JsonKey(name: 'payment_currency') String currency,
      @JsonKey(name: 'payment_type') String paymentType,
      @JsonKey(name: 'payment_value_actual') double paymentValue,
      @JsonKey(name: 'payment_account_des_actual') String accountDestination,
      @JsonKey(name: 'payment_value_fee') double valueFee,
      @JsonKey(name: 'payment_account_src_actual') String accountSource,
      @JsonKey(name: 'is_needapprove') bool needApprove,
      @JsonKey(name: 'is_needaudit') bool needAudit,
      @JsonKey(name: 'refcode') String refCode,
      @JsonKey(name: 'payment_qrdata') String qrData});
}

/// @nodoc
class __$$PureFiatCreateRequestModelImplCopyWithImpl<$Res>
    extends _$PureFiatCreateRequestModelCopyWithImpl<$Res,
        _$PureFiatCreateRequestModelImpl>
    implements _$$PureFiatCreateRequestModelImplCopyWith<$Res> {
  __$$PureFiatCreateRequestModelImplCopyWithImpl(
      _$PureFiatCreateRequestModelImpl _value,
      $Res Function(_$PureFiatCreateRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idUser = null,
    Object? paymentChannel = null,
    Object? autoSettle = null,
    Object? currency = null,
    Object? paymentType = null,
    Object? paymentValue = null,
    Object? accountDestination = null,
    Object? valueFee = null,
    Object? accountSource = null,
    Object? needApprove = null,
    Object? needAudit = null,
    Object? refCode = null,
    Object? qrData = null,
  }) {
    return _then(_$PureFiatCreateRequestModelImpl(
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as String,
      paymentChannel: null == paymentChannel
          ? _value.paymentChannel
          : paymentChannel // ignore: cast_nullable_to_non_nullable
              as String,
      autoSettle: null == autoSettle
          ? _value.autoSettle
          : autoSettle // ignore: cast_nullable_to_non_nullable
              as bool,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      paymentType: null == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String,
      paymentValue: null == paymentValue
          ? _value.paymentValue
          : paymentValue // ignore: cast_nullable_to_non_nullable
              as double,
      accountDestination: null == accountDestination
          ? _value.accountDestination
          : accountDestination // ignore: cast_nullable_to_non_nullable
              as String,
      valueFee: null == valueFee
          ? _value.valueFee
          : valueFee // ignore: cast_nullable_to_non_nullable
              as double,
      accountSource: null == accountSource
          ? _value.accountSource
          : accountSource // ignore: cast_nullable_to_non_nullable
              as String,
      needApprove: null == needApprove
          ? _value.needApprove
          : needApprove // ignore: cast_nullable_to_non_nullable
              as bool,
      needAudit: null == needAudit
          ? _value.needAudit
          : needAudit // ignore: cast_nullable_to_non_nullable
              as bool,
      refCode: null == refCode
          ? _value.refCode
          : refCode // ignore: cast_nullable_to_non_nullable
              as String,
      qrData: null == qrData
          ? _value.qrData
          : qrData // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PureFiatCreateRequestModelImpl implements _PureFiatCreateRequestModel {
  const _$PureFiatCreateRequestModelImpl(
      {@JsonKey(name: 'id_user') this.idUser = '',
      @JsonKey(name: 'payment_channel') this.paymentChannel = 'QR',
      @JsonKey(name: 'payment_autosettle') this.autoSettle = true,
      @JsonKey(name: 'payment_currency') this.currency = 'THB',
      @JsonKey(name: 'payment_type') this.paymentType = 'ndid',
      @JsonKey(name: 'payment_value_actual') this.paymentValue = 0,
      @JsonKey(name: 'payment_account_des_actual') this.accountDestination = '',
      @JsonKey(name: 'payment_value_fee') this.valueFee = 0,
      @JsonKey(name: 'payment_account_src_actual') this.accountSource = '',
      @JsonKey(name: 'is_needapprove') this.needApprove = true,
      @JsonKey(name: 'is_needaudit') this.needAudit = true,
      @JsonKey(name: 'refcode') this.refCode = '',
      @JsonKey(name: 'payment_qrdata') this.qrData = ''});

  factory _$PureFiatCreateRequestModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PureFiatCreateRequestModelImplFromJson(json);

  @override
  @JsonKey(name: 'id_user')
  final String idUser;
  @override
  @JsonKey(name: 'payment_channel')
  final String paymentChannel;
  @override
  @JsonKey(name: 'payment_autosettle')
  final bool autoSettle;
  @override
  @JsonKey(name: 'payment_currency')
  final String currency;
  @override
  @JsonKey(name: 'payment_type')
  final String paymentType;
  @override
  @JsonKey(name: 'payment_value_actual')
  final double paymentValue;
  @override
  @JsonKey(name: 'payment_account_des_actual')
  final String accountDestination;
  @override
  @JsonKey(name: 'payment_value_fee')
  final double valueFee;
  @override
  @JsonKey(name: 'payment_account_src_actual')
  final String accountSource;
  @override
  @JsonKey(name: 'is_needapprove')
  final bool needApprove;
  @override
  @JsonKey(name: 'is_needaudit')
  final bool needAudit;
  @override
  @JsonKey(name: 'refcode')
  final String refCode;
  @override
  @JsonKey(name: 'payment_qrdata')
  final String qrData;

  @override
  String toString() {
    return 'PureFiatCreateRequestModel(idUser: $idUser, paymentChannel: $paymentChannel, autoSettle: $autoSettle, currency: $currency, paymentType: $paymentType, paymentValue: $paymentValue, accountDestination: $accountDestination, valueFee: $valueFee, accountSource: $accountSource, needApprove: $needApprove, needAudit: $needAudit, refCode: $refCode, qrData: $qrData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PureFiatCreateRequestModelImpl &&
            (identical(other.idUser, idUser) || other.idUser == idUser) &&
            (identical(other.paymentChannel, paymentChannel) ||
                other.paymentChannel == paymentChannel) &&
            (identical(other.autoSettle, autoSettle) ||
                other.autoSettle == autoSettle) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.paymentValue, paymentValue) ||
                other.paymentValue == paymentValue) &&
            (identical(other.accountDestination, accountDestination) ||
                other.accountDestination == accountDestination) &&
            (identical(other.valueFee, valueFee) ||
                other.valueFee == valueFee) &&
            (identical(other.accountSource, accountSource) ||
                other.accountSource == accountSource) &&
            (identical(other.needApprove, needApprove) ||
                other.needApprove == needApprove) &&
            (identical(other.needAudit, needAudit) ||
                other.needAudit == needAudit) &&
            (identical(other.refCode, refCode) || other.refCode == refCode) &&
            (identical(other.qrData, qrData) || other.qrData == qrData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      idUser,
      paymentChannel,
      autoSettle,
      currency,
      paymentType,
      paymentValue,
      accountDestination,
      valueFee,
      accountSource,
      needApprove,
      needAudit,
      refCode,
      qrData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PureFiatCreateRequestModelImplCopyWith<_$PureFiatCreateRequestModelImpl>
      get copyWith => __$$PureFiatCreateRequestModelImplCopyWithImpl<
          _$PureFiatCreateRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PureFiatCreateRequestModelImplToJson(
      this,
    );
  }
}

abstract class _PureFiatCreateRequestModel
    implements PureFiatCreateRequestModel {
  const factory _PureFiatCreateRequestModel(
      {@JsonKey(name: 'id_user') final String idUser,
      @JsonKey(name: 'payment_channel') final String paymentChannel,
      @JsonKey(name: 'payment_autosettle') final bool autoSettle,
      @JsonKey(name: 'payment_currency') final String currency,
      @JsonKey(name: 'payment_type') final String paymentType,
      @JsonKey(name: 'payment_value_actual') final double paymentValue,
      @JsonKey(name: 'payment_account_des_actual')
      final String accountDestination,
      @JsonKey(name: 'payment_value_fee') final double valueFee,
      @JsonKey(name: 'payment_account_src_actual') final String accountSource,
      @JsonKey(name: 'is_needapprove') final bool needApprove,
      @JsonKey(name: 'is_needaudit') final bool needAudit,
      @JsonKey(name: 'refcode') final String refCode,
      @JsonKey(name: 'payment_qrdata')
      final String qrData}) = _$PureFiatCreateRequestModelImpl;

  factory _PureFiatCreateRequestModel.fromJson(Map<String, dynamic> json) =
      _$PureFiatCreateRequestModelImpl.fromJson;

  @override
  @JsonKey(name: 'id_user')
  String get idUser;
  @override
  @JsonKey(name: 'payment_channel')
  String get paymentChannel;
  @override
  @JsonKey(name: 'payment_autosettle')
  bool get autoSettle;
  @override
  @JsonKey(name: 'payment_currency')
  String get currency;
  @override
  @JsonKey(name: 'payment_type')
  String get paymentType;
  @override
  @JsonKey(name: 'payment_value_actual')
  double get paymentValue;
  @override
  @JsonKey(name: 'payment_account_des_actual')
  String get accountDestination;
  @override
  @JsonKey(name: 'payment_value_fee')
  double get valueFee;
  @override
  @JsonKey(name: 'payment_account_src_actual')
  String get accountSource;
  @override
  @JsonKey(name: 'is_needapprove')
  bool get needApprove;
  @override
  @JsonKey(name: 'is_needaudit')
  bool get needAudit;
  @override
  @JsonKey(name: 'refcode')
  String get refCode;
  @override
  @JsonKey(name: 'payment_qrdata')
  String get qrData;
  @override
  @JsonKey(ignore: true)
  _$$PureFiatCreateRequestModelImplCopyWith<_$PureFiatCreateRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PureFiatCreateResponseModel _$PureFiatCreateResponseModelFromJson(
    Map<String, dynamic> json) {
  return _PureFiatCreateResponseModel.fromJson(json);
}

/// @nodoc
mixin _$PureFiatCreateResponseModel {
  @JsonKey(name: 'id_purefiat')
  int get idPurefiat => throw _privateConstructorUsedError;
  @JsonKey(name: 'refcode')
  String get refcode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PureFiatCreateResponseModelCopyWith<PureFiatCreateResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PureFiatCreateResponseModelCopyWith<$Res> {
  factory $PureFiatCreateResponseModelCopyWith(
          PureFiatCreateResponseModel value,
          $Res Function(PureFiatCreateResponseModel) then) =
      _$PureFiatCreateResponseModelCopyWithImpl<$Res,
          PureFiatCreateResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_purefiat') int idPurefiat,
      @JsonKey(name: 'refcode') String refcode});
}

/// @nodoc
class _$PureFiatCreateResponseModelCopyWithImpl<$Res,
        $Val extends PureFiatCreateResponseModel>
    implements $PureFiatCreateResponseModelCopyWith<$Res> {
  _$PureFiatCreateResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idPurefiat = null,
    Object? refcode = null,
  }) {
    return _then(_value.copyWith(
      idPurefiat: null == idPurefiat
          ? _value.idPurefiat
          : idPurefiat // ignore: cast_nullable_to_non_nullable
              as int,
      refcode: null == refcode
          ? _value.refcode
          : refcode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PureFiatCreateResponseModelImplCopyWith<$Res>
    implements $PureFiatCreateResponseModelCopyWith<$Res> {
  factory _$$PureFiatCreateResponseModelImplCopyWith(
          _$PureFiatCreateResponseModelImpl value,
          $Res Function(_$PureFiatCreateResponseModelImpl) then) =
      __$$PureFiatCreateResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_purefiat') int idPurefiat,
      @JsonKey(name: 'refcode') String refcode});
}

/// @nodoc
class __$$PureFiatCreateResponseModelImplCopyWithImpl<$Res>
    extends _$PureFiatCreateResponseModelCopyWithImpl<$Res,
        _$PureFiatCreateResponseModelImpl>
    implements _$$PureFiatCreateResponseModelImplCopyWith<$Res> {
  __$$PureFiatCreateResponseModelImplCopyWithImpl(
      _$PureFiatCreateResponseModelImpl _value,
      $Res Function(_$PureFiatCreateResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idPurefiat = null,
    Object? refcode = null,
  }) {
    return _then(_$PureFiatCreateResponseModelImpl(
      idPurefiat: null == idPurefiat
          ? _value.idPurefiat
          : idPurefiat // ignore: cast_nullable_to_non_nullable
              as int,
      refcode: null == refcode
          ? _value.refcode
          : refcode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PureFiatCreateResponseModelImpl
    implements _PureFiatCreateResponseModel {
  const _$PureFiatCreateResponseModelImpl(
      {@JsonKey(name: 'id_purefiat') this.idPurefiat = 0,
      @JsonKey(name: 'refcode') this.refcode = ''});

  factory _$PureFiatCreateResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PureFiatCreateResponseModelImplFromJson(json);

  @override
  @JsonKey(name: 'id_purefiat')
  final int idPurefiat;
  @override
  @JsonKey(name: 'refcode')
  final String refcode;

  @override
  String toString() {
    return 'PureFiatCreateResponseModel(idPurefiat: $idPurefiat, refcode: $refcode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PureFiatCreateResponseModelImpl &&
            (identical(other.idPurefiat, idPurefiat) ||
                other.idPurefiat == idPurefiat) &&
            (identical(other.refcode, refcode) || other.refcode == refcode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idPurefiat, refcode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PureFiatCreateResponseModelImplCopyWith<_$PureFiatCreateResponseModelImpl>
      get copyWith => __$$PureFiatCreateResponseModelImplCopyWithImpl<
          _$PureFiatCreateResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PureFiatCreateResponseModelImplToJson(
      this,
    );
  }
}

abstract class _PureFiatCreateResponseModel
    implements PureFiatCreateResponseModel {
  const factory _PureFiatCreateResponseModel(
          {@JsonKey(name: 'id_purefiat') final int idPurefiat,
          @JsonKey(name: 'refcode') final String refcode}) =
      _$PureFiatCreateResponseModelImpl;

  factory _PureFiatCreateResponseModel.fromJson(Map<String, dynamic> json) =
      _$PureFiatCreateResponseModelImpl.fromJson;

  @override
  @JsonKey(name: 'id_purefiat')
  int get idPurefiat;
  @override
  @JsonKey(name: 'refcode')
  String get refcode;
  @override
  @JsonKey(ignore: true)
  _$$PureFiatCreateResponseModelImplCopyWith<_$PureFiatCreateResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
