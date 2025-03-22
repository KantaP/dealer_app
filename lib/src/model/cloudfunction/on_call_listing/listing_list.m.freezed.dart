// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listing_list.m.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestListingListModel _$RequestListingListModelFromJson(
    Map<String, dynamic> json) {
  return _RequestListingListModel.fromJson(json);
}

/// @nodoc
mixin _$RequestListingListModel {
  @JsonKey(name: 'limit')
  int get limit => throw _privateConstructorUsedError;
  @JsonKey(name: 'page')
  int get page => throw _privateConstructorUsedError;
  @JsonKey(name: 'cointype')
  String get cointype => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RequestListingListModelCopyWith<RequestListingListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestListingListModelCopyWith<$Res> {
  factory $RequestListingListModelCopyWith(RequestListingListModel value,
          $Res Function(RequestListingListModel) then) =
      _$RequestListingListModelCopyWithImpl<$Res, RequestListingListModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'limit') int limit,
      @JsonKey(name: 'page') int page,
      @JsonKey(name: 'cointype') String cointype});
}

/// @nodoc
class _$RequestListingListModelCopyWithImpl<$Res,
        $Val extends RequestListingListModel>
    implements $RequestListingListModelCopyWith<$Res> {
  _$RequestListingListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? page = null,
    Object? cointype = null,
  }) {
    return _then(_value.copyWith(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      cointype: null == cointype
          ? _value.cointype
          : cointype // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestListingListModelImplCopyWith<$Res>
    implements $RequestListingListModelCopyWith<$Res> {
  factory _$$RequestListingListModelImplCopyWith(
          _$RequestListingListModelImpl value,
          $Res Function(_$RequestListingListModelImpl) then) =
      __$$RequestListingListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'limit') int limit,
      @JsonKey(name: 'page') int page,
      @JsonKey(name: 'cointype') String cointype});
}

/// @nodoc
class __$$RequestListingListModelImplCopyWithImpl<$Res>
    extends _$RequestListingListModelCopyWithImpl<$Res,
        _$RequestListingListModelImpl>
    implements _$$RequestListingListModelImplCopyWith<$Res> {
  __$$RequestListingListModelImplCopyWithImpl(
      _$RequestListingListModelImpl _value,
      $Res Function(_$RequestListingListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
    Object? page = null,
    Object? cointype = null,
  }) {
    return _then(_$RequestListingListModelImpl(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      cointype: null == cointype
          ? _value.cointype
          : cointype // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestListingListModelImpl implements _RequestListingListModel {
  const _$RequestListingListModelImpl(
      {@JsonKey(name: 'limit') this.limit = 10,
      @JsonKey(name: 'page') this.page = 1,
      @JsonKey(name: 'cointype') this.cointype = ''});

  factory _$RequestListingListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestListingListModelImplFromJson(json);

  @override
  @JsonKey(name: 'limit')
  final int limit;
  @override
  @JsonKey(name: 'page')
  final int page;
  @override
  @JsonKey(name: 'cointype')
  final String cointype;

  @override
  String toString() {
    return 'RequestListingListModel(limit: $limit, page: $page, cointype: $cointype)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestListingListModelImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.cointype, cointype) ||
                other.cointype == cointype));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, limit, page, cointype);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestListingListModelImplCopyWith<_$RequestListingListModelImpl>
      get copyWith => __$$RequestListingListModelImplCopyWithImpl<
          _$RequestListingListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestListingListModelImplToJson(
      this,
    );
  }
}

abstract class _RequestListingListModel implements RequestListingListModel {
  const factory _RequestListingListModel(
          {@JsonKey(name: 'limit') final int limit,
          @JsonKey(name: 'page') final int page,
          @JsonKey(name: 'cointype') final String cointype}) =
      _$RequestListingListModelImpl;

  factory _RequestListingListModel.fromJson(Map<String, dynamic> json) =
      _$RequestListingListModelImpl.fromJson;

  @override
  @JsonKey(name: 'limit')
  int get limit;
  @override
  @JsonKey(name: 'page')
  int get page;
  @override
  @JsonKey(name: 'cointype')
  String get cointype;
  @override
  @JsonKey(ignore: true)
  _$$RequestListingListModelImplCopyWith<_$RequestListingListModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ResponseListingListModel _$ResponseListingListModelFromJson(
    Map<String, dynamic> json) {
  return _ResponseListingListModel.fromJson(json);
}

/// @nodoc
mixin _$ResponseListingListModel {
  @JsonKey(name: 'totalRows')
  int get totalRows => throw _privateConstructorUsedError;
  @JsonKey(name: 'currentPage')
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'totalPages')
  int get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: 'rows')
  List<CoinModel> get rows => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseListingListModelCopyWith<ResponseListingListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseListingListModelCopyWith<$Res> {
  factory $ResponseListingListModelCopyWith(ResponseListingListModel value,
          $Res Function(ResponseListingListModel) then) =
      _$ResponseListingListModelCopyWithImpl<$Res, ResponseListingListModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'totalRows') int totalRows,
      @JsonKey(name: 'currentPage') int currentPage,
      @JsonKey(name: 'totalPages') int totalPages,
      @JsonKey(name: 'rows') List<CoinModel> rows});
}

/// @nodoc
class _$ResponseListingListModelCopyWithImpl<$Res,
        $Val extends ResponseListingListModel>
    implements $ResponseListingListModelCopyWith<$Res> {
  _$ResponseListingListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRows = null,
    Object? currentPage = null,
    Object? totalPages = null,
    Object? rows = null,
  }) {
    return _then(_value.copyWith(
      totalRows: null == totalRows
          ? _value.totalRows
          : totalRows // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      rows: null == rows
          ? _value.rows
          : rows // ignore: cast_nullable_to_non_nullable
              as List<CoinModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseListingListModelImplCopyWith<$Res>
    implements $ResponseListingListModelCopyWith<$Res> {
  factory _$$ResponseListingListModelImplCopyWith(
          _$ResponseListingListModelImpl value,
          $Res Function(_$ResponseListingListModelImpl) then) =
      __$$ResponseListingListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'totalRows') int totalRows,
      @JsonKey(name: 'currentPage') int currentPage,
      @JsonKey(name: 'totalPages') int totalPages,
      @JsonKey(name: 'rows') List<CoinModel> rows});
}

/// @nodoc
class __$$ResponseListingListModelImplCopyWithImpl<$Res>
    extends _$ResponseListingListModelCopyWithImpl<$Res,
        _$ResponseListingListModelImpl>
    implements _$$ResponseListingListModelImplCopyWith<$Res> {
  __$$ResponseListingListModelImplCopyWithImpl(
      _$ResponseListingListModelImpl _value,
      $Res Function(_$ResponseListingListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalRows = null,
    Object? currentPage = null,
    Object? totalPages = null,
    Object? rows = null,
  }) {
    return _then(_$ResponseListingListModelImpl(
      totalRows: null == totalRows
          ? _value.totalRows
          : totalRows // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      rows: null == rows
          ? _value._rows
          : rows // ignore: cast_nullable_to_non_nullable
              as List<CoinModel>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ResponseListingListModelImpl implements _ResponseListingListModel {
  const _$ResponseListingListModelImpl(
      {@JsonKey(name: 'totalRows') this.totalRows = 0,
      @JsonKey(name: 'currentPage') this.currentPage = 0,
      @JsonKey(name: 'totalPages') this.totalPages = 0,
      @JsonKey(name: 'rows') final List<CoinModel> rows = const <CoinModel>[]})
      : _rows = rows;

  factory _$ResponseListingListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseListingListModelImplFromJson(json);

  @override
  @JsonKey(name: 'totalRows')
  final int totalRows;
  @override
  @JsonKey(name: 'currentPage')
  final int currentPage;
  @override
  @JsonKey(name: 'totalPages')
  final int totalPages;
  final List<CoinModel> _rows;
  @override
  @JsonKey(name: 'rows')
  List<CoinModel> get rows {
    if (_rows is EqualUnmodifiableListView) return _rows;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rows);
  }

  @override
  String toString() {
    return 'ResponseListingListModel(totalRows: $totalRows, currentPage: $currentPage, totalPages: $totalPages, rows: $rows)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseListingListModelImpl &&
            (identical(other.totalRows, totalRows) ||
                other.totalRows == totalRows) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            const DeepCollectionEquality().equals(other._rows, _rows));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalRows, currentPage,
      totalPages, const DeepCollectionEquality().hash(_rows));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseListingListModelImplCopyWith<_$ResponseListingListModelImpl>
      get copyWith => __$$ResponseListingListModelImplCopyWithImpl<
          _$ResponseListingListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseListingListModelImplToJson(
      this,
    );
  }
}

abstract class _ResponseListingListModel implements ResponseListingListModel {
  const factory _ResponseListingListModel(
          {@JsonKey(name: 'totalRows') final int totalRows,
          @JsonKey(name: 'currentPage') final int currentPage,
          @JsonKey(name: 'totalPages') final int totalPages,
          @JsonKey(name: 'rows') final List<CoinModel> rows}) =
      _$ResponseListingListModelImpl;

  factory _ResponseListingListModel.fromJson(Map<String, dynamic> json) =
      _$ResponseListingListModelImpl.fromJson;

  @override
  @JsonKey(name: 'totalRows')
  int get totalRows;
  @override
  @JsonKey(name: 'currentPage')
  int get currentPage;
  @override
  @JsonKey(name: 'totalPages')
  int get totalPages;
  @override
  @JsonKey(name: 'rows')
  List<CoinModel> get rows;
  @override
  @JsonKey(ignore: true)
  _$$ResponseListingListModelImplCopyWith<_$ResponseListingListModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CoinModel _$CoinModelFromJson(Map<String, dynamic> json) {
  return _CoinModel.fromJson(json);
}

/// @nodoc
mixin _$CoinModel {
  @JsonKey(name: 'id_listing')
  int get idListing => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_base_asset')
  int get idBaseAsset => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_quote_asset')
  int get idQuoteAsset => throw _privateConstructorUsedError;
  @JsonKey(name: 'symbol')
  String get symbol => throw _privateConstructorUsedError;
  @JsonKey(name: 'order')
  int get order => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_usentvprice')
  bool get isUsentVPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_spread_inpercent')
  bool get isSpreadInpercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_fee_inpercent')
  bool get isFeeInpercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'spread_buy')
  double get spreadBuy => throw _privateConstructorUsedError;
  @JsonKey(name: 'spread_sell')
  double get spreadSell => throw _privateConstructorUsedError;
  @JsonKey(name: 'fee_buy')
  double get feeBuy => throw _privateConstructorUsedError;
  @JsonKey(name: 'fee_sell')
  double get feeSell => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_buy_base')
  double get minBuyBase => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_sell_base')
  double get minSellBase => throw _privateConstructorUsedError;
  @JsonKey(name: 'datetime_create')
  String get datetimeCreate => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by')
  String get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'datatime_update')
  String get datetimeUpdate => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by')
  String get updatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_buy_quote')
  double get minBuyQuote => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_sell_quote')
  double get minSellQuote => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_buy_quote')
  double get maxBuyQuote => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_sell_quote')
  double get maxSellQuote => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_buy_base')
  double get maxBuyBase => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_sell_base')
  double get maxSellBase => throw _privateConstructorUsedError;
  @JsonKey(name: 'decimal_base')
  int get decimalBase => throw _privateConstructorUsedError;
  @JsonKey(name: 'decimal_quote')
  int get decimalQuote => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoinModelCopyWith<CoinModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoinModelCopyWith<$Res> {
  factory $CoinModelCopyWith(CoinModel value, $Res Function(CoinModel) then) =
      _$CoinModelCopyWithImpl<$Res, CoinModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_listing') int idListing,
      @JsonKey(name: 'id_base_asset') int idBaseAsset,
      @JsonKey(name: 'id_quote_asset') int idQuoteAsset,
      @JsonKey(name: 'symbol') String symbol,
      @JsonKey(name: 'order') int order,
      @JsonKey(name: 'is_usentvprice') bool isUsentVPrice,
      @JsonKey(name: 'is_spread_inpercent') bool isSpreadInpercent,
      @JsonKey(name: 'is_fee_inpercent') bool isFeeInpercent,
      @JsonKey(name: 'spread_buy') double spreadBuy,
      @JsonKey(name: 'spread_sell') double spreadSell,
      @JsonKey(name: 'fee_buy') double feeBuy,
      @JsonKey(name: 'fee_sell') double feeSell,
      @JsonKey(name: 'min_buy_base') double minBuyBase,
      @JsonKey(name: 'min_sell_base') double minSellBase,
      @JsonKey(name: 'datetime_create') String datetimeCreate,
      @JsonKey(name: 'created_by') String createdBy,
      @JsonKey(name: 'datatime_update') String datetimeUpdate,
      @JsonKey(name: 'updated_by') String updatedBy,
      @JsonKey(name: 'min_buy_quote') double minBuyQuote,
      @JsonKey(name: 'min_sell_quote') double minSellQuote,
      @JsonKey(name: 'max_buy_quote') double maxBuyQuote,
      @JsonKey(name: 'max_sell_quote') double maxSellQuote,
      @JsonKey(name: 'max_buy_base') double maxBuyBase,
      @JsonKey(name: 'max_sell_base') double maxSellBase,
      @JsonKey(name: 'decimal_base') int decimalBase,
      @JsonKey(name: 'decimal_quote') int decimalQuote});
}

/// @nodoc
class _$CoinModelCopyWithImpl<$Res, $Val extends CoinModel>
    implements $CoinModelCopyWith<$Res> {
  _$CoinModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idListing = null,
    Object? idBaseAsset = null,
    Object? idQuoteAsset = null,
    Object? symbol = null,
    Object? order = null,
    Object? isUsentVPrice = null,
    Object? isSpreadInpercent = null,
    Object? isFeeInpercent = null,
    Object? spreadBuy = null,
    Object? spreadSell = null,
    Object? feeBuy = null,
    Object? feeSell = null,
    Object? minBuyBase = null,
    Object? minSellBase = null,
    Object? datetimeCreate = null,
    Object? createdBy = null,
    Object? datetimeUpdate = null,
    Object? updatedBy = null,
    Object? minBuyQuote = null,
    Object? minSellQuote = null,
    Object? maxBuyQuote = null,
    Object? maxSellQuote = null,
    Object? maxBuyBase = null,
    Object? maxSellBase = null,
    Object? decimalBase = null,
    Object? decimalQuote = null,
  }) {
    return _then(_value.copyWith(
      idListing: null == idListing
          ? _value.idListing
          : idListing // ignore: cast_nullable_to_non_nullable
              as int,
      idBaseAsset: null == idBaseAsset
          ? _value.idBaseAsset
          : idBaseAsset // ignore: cast_nullable_to_non_nullable
              as int,
      idQuoteAsset: null == idQuoteAsset
          ? _value.idQuoteAsset
          : idQuoteAsset // ignore: cast_nullable_to_non_nullable
              as int,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      isUsentVPrice: null == isUsentVPrice
          ? _value.isUsentVPrice
          : isUsentVPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      isSpreadInpercent: null == isSpreadInpercent
          ? _value.isSpreadInpercent
          : isSpreadInpercent // ignore: cast_nullable_to_non_nullable
              as bool,
      isFeeInpercent: null == isFeeInpercent
          ? _value.isFeeInpercent
          : isFeeInpercent // ignore: cast_nullable_to_non_nullable
              as bool,
      spreadBuy: null == spreadBuy
          ? _value.spreadBuy
          : spreadBuy // ignore: cast_nullable_to_non_nullable
              as double,
      spreadSell: null == spreadSell
          ? _value.spreadSell
          : spreadSell // ignore: cast_nullable_to_non_nullable
              as double,
      feeBuy: null == feeBuy
          ? _value.feeBuy
          : feeBuy // ignore: cast_nullable_to_non_nullable
              as double,
      feeSell: null == feeSell
          ? _value.feeSell
          : feeSell // ignore: cast_nullable_to_non_nullable
              as double,
      minBuyBase: null == minBuyBase
          ? _value.minBuyBase
          : minBuyBase // ignore: cast_nullable_to_non_nullable
              as double,
      minSellBase: null == minSellBase
          ? _value.minSellBase
          : minSellBase // ignore: cast_nullable_to_non_nullable
              as double,
      datetimeCreate: null == datetimeCreate
          ? _value.datetimeCreate
          : datetimeCreate // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      datetimeUpdate: null == datetimeUpdate
          ? _value.datetimeUpdate
          : datetimeUpdate // ignore: cast_nullable_to_non_nullable
              as String,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
      minBuyQuote: null == minBuyQuote
          ? _value.minBuyQuote
          : minBuyQuote // ignore: cast_nullable_to_non_nullable
              as double,
      minSellQuote: null == minSellQuote
          ? _value.minSellQuote
          : minSellQuote // ignore: cast_nullable_to_non_nullable
              as double,
      maxBuyQuote: null == maxBuyQuote
          ? _value.maxBuyQuote
          : maxBuyQuote // ignore: cast_nullable_to_non_nullable
              as double,
      maxSellQuote: null == maxSellQuote
          ? _value.maxSellQuote
          : maxSellQuote // ignore: cast_nullable_to_non_nullable
              as double,
      maxBuyBase: null == maxBuyBase
          ? _value.maxBuyBase
          : maxBuyBase // ignore: cast_nullable_to_non_nullable
              as double,
      maxSellBase: null == maxSellBase
          ? _value.maxSellBase
          : maxSellBase // ignore: cast_nullable_to_non_nullable
              as double,
      decimalBase: null == decimalBase
          ? _value.decimalBase
          : decimalBase // ignore: cast_nullable_to_non_nullable
              as int,
      decimalQuote: null == decimalQuote
          ? _value.decimalQuote
          : decimalQuote // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoinModelImplCopyWith<$Res>
    implements $CoinModelCopyWith<$Res> {
  factory _$$CoinModelImplCopyWith(
          _$CoinModelImpl value, $Res Function(_$CoinModelImpl) then) =
      __$$CoinModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_listing') int idListing,
      @JsonKey(name: 'id_base_asset') int idBaseAsset,
      @JsonKey(name: 'id_quote_asset') int idQuoteAsset,
      @JsonKey(name: 'symbol') String symbol,
      @JsonKey(name: 'order') int order,
      @JsonKey(name: 'is_usentvprice') bool isUsentVPrice,
      @JsonKey(name: 'is_spread_inpercent') bool isSpreadInpercent,
      @JsonKey(name: 'is_fee_inpercent') bool isFeeInpercent,
      @JsonKey(name: 'spread_buy') double spreadBuy,
      @JsonKey(name: 'spread_sell') double spreadSell,
      @JsonKey(name: 'fee_buy') double feeBuy,
      @JsonKey(name: 'fee_sell') double feeSell,
      @JsonKey(name: 'min_buy_base') double minBuyBase,
      @JsonKey(name: 'min_sell_base') double minSellBase,
      @JsonKey(name: 'datetime_create') String datetimeCreate,
      @JsonKey(name: 'created_by') String createdBy,
      @JsonKey(name: 'datatime_update') String datetimeUpdate,
      @JsonKey(name: 'updated_by') String updatedBy,
      @JsonKey(name: 'min_buy_quote') double minBuyQuote,
      @JsonKey(name: 'min_sell_quote') double minSellQuote,
      @JsonKey(name: 'max_buy_quote') double maxBuyQuote,
      @JsonKey(name: 'max_sell_quote') double maxSellQuote,
      @JsonKey(name: 'max_buy_base') double maxBuyBase,
      @JsonKey(name: 'max_sell_base') double maxSellBase,
      @JsonKey(name: 'decimal_base') int decimalBase,
      @JsonKey(name: 'decimal_quote') int decimalQuote});
}

/// @nodoc
class __$$CoinModelImplCopyWithImpl<$Res>
    extends _$CoinModelCopyWithImpl<$Res, _$CoinModelImpl>
    implements _$$CoinModelImplCopyWith<$Res> {
  __$$CoinModelImplCopyWithImpl(
      _$CoinModelImpl _value, $Res Function(_$CoinModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idListing = null,
    Object? idBaseAsset = null,
    Object? idQuoteAsset = null,
    Object? symbol = null,
    Object? order = null,
    Object? isUsentVPrice = null,
    Object? isSpreadInpercent = null,
    Object? isFeeInpercent = null,
    Object? spreadBuy = null,
    Object? spreadSell = null,
    Object? feeBuy = null,
    Object? feeSell = null,
    Object? minBuyBase = null,
    Object? minSellBase = null,
    Object? datetimeCreate = null,
    Object? createdBy = null,
    Object? datetimeUpdate = null,
    Object? updatedBy = null,
    Object? minBuyQuote = null,
    Object? minSellQuote = null,
    Object? maxBuyQuote = null,
    Object? maxSellQuote = null,
    Object? maxBuyBase = null,
    Object? maxSellBase = null,
    Object? decimalBase = null,
    Object? decimalQuote = null,
  }) {
    return _then(_$CoinModelImpl(
      idListing: null == idListing
          ? _value.idListing
          : idListing // ignore: cast_nullable_to_non_nullable
              as int,
      idBaseAsset: null == idBaseAsset
          ? _value.idBaseAsset
          : idBaseAsset // ignore: cast_nullable_to_non_nullable
              as int,
      idQuoteAsset: null == idQuoteAsset
          ? _value.idQuoteAsset
          : idQuoteAsset // ignore: cast_nullable_to_non_nullable
              as int,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      isUsentVPrice: null == isUsentVPrice
          ? _value.isUsentVPrice
          : isUsentVPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      isSpreadInpercent: null == isSpreadInpercent
          ? _value.isSpreadInpercent
          : isSpreadInpercent // ignore: cast_nullable_to_non_nullable
              as bool,
      isFeeInpercent: null == isFeeInpercent
          ? _value.isFeeInpercent
          : isFeeInpercent // ignore: cast_nullable_to_non_nullable
              as bool,
      spreadBuy: null == spreadBuy
          ? _value.spreadBuy
          : spreadBuy // ignore: cast_nullable_to_non_nullable
              as double,
      spreadSell: null == spreadSell
          ? _value.spreadSell
          : spreadSell // ignore: cast_nullable_to_non_nullable
              as double,
      feeBuy: null == feeBuy
          ? _value.feeBuy
          : feeBuy // ignore: cast_nullable_to_non_nullable
              as double,
      feeSell: null == feeSell
          ? _value.feeSell
          : feeSell // ignore: cast_nullable_to_non_nullable
              as double,
      minBuyBase: null == minBuyBase
          ? _value.minBuyBase
          : minBuyBase // ignore: cast_nullable_to_non_nullable
              as double,
      minSellBase: null == minSellBase
          ? _value.minSellBase
          : minSellBase // ignore: cast_nullable_to_non_nullable
              as double,
      datetimeCreate: null == datetimeCreate
          ? _value.datetimeCreate
          : datetimeCreate // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      datetimeUpdate: null == datetimeUpdate
          ? _value.datetimeUpdate
          : datetimeUpdate // ignore: cast_nullable_to_non_nullable
              as String,
      updatedBy: null == updatedBy
          ? _value.updatedBy
          : updatedBy // ignore: cast_nullable_to_non_nullable
              as String,
      minBuyQuote: null == minBuyQuote
          ? _value.minBuyQuote
          : minBuyQuote // ignore: cast_nullable_to_non_nullable
              as double,
      minSellQuote: null == minSellQuote
          ? _value.minSellQuote
          : minSellQuote // ignore: cast_nullable_to_non_nullable
              as double,
      maxBuyQuote: null == maxBuyQuote
          ? _value.maxBuyQuote
          : maxBuyQuote // ignore: cast_nullable_to_non_nullable
              as double,
      maxSellQuote: null == maxSellQuote
          ? _value.maxSellQuote
          : maxSellQuote // ignore: cast_nullable_to_non_nullable
              as double,
      maxBuyBase: null == maxBuyBase
          ? _value.maxBuyBase
          : maxBuyBase // ignore: cast_nullable_to_non_nullable
              as double,
      maxSellBase: null == maxSellBase
          ? _value.maxSellBase
          : maxSellBase // ignore: cast_nullable_to_non_nullable
              as double,
      decimalBase: null == decimalBase
          ? _value.decimalBase
          : decimalBase // ignore: cast_nullable_to_non_nullable
              as int,
      decimalQuote: null == decimalQuote
          ? _value.decimalQuote
          : decimalQuote // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoinModelImpl extends _CoinModel {
  const _$CoinModelImpl(
      {@JsonKey(name: 'id_listing') this.idListing = 0,
      @JsonKey(name: 'id_base_asset') this.idBaseAsset = 0,
      @JsonKey(name: 'id_quote_asset') this.idQuoteAsset = 0,
      @JsonKey(name: 'symbol') this.symbol = '',
      @JsonKey(name: 'order') this.order = 0,
      @JsonKey(name: 'is_usentvprice') this.isUsentVPrice = false,
      @JsonKey(name: 'is_spread_inpercent') this.isSpreadInpercent = false,
      @JsonKey(name: 'is_fee_inpercent') this.isFeeInpercent = false,
      @JsonKey(name: 'spread_buy') this.spreadBuy = 0,
      @JsonKey(name: 'spread_sell') this.spreadSell = 0,
      @JsonKey(name: 'fee_buy') this.feeBuy = 0,
      @JsonKey(name: 'fee_sell') this.feeSell = 0,
      @JsonKey(name: 'min_buy_base') this.minBuyBase = 0,
      @JsonKey(name: 'min_sell_base') this.minSellBase = 0,
      @JsonKey(name: 'datetime_create') this.datetimeCreate = '',
      @JsonKey(name: 'created_by') this.createdBy = '',
      @JsonKey(name: 'datatime_update') this.datetimeUpdate = '',
      @JsonKey(name: 'updated_by') this.updatedBy = '',
      @JsonKey(name: 'min_buy_quote') this.minBuyQuote = 0,
      @JsonKey(name: 'min_sell_quote') this.minSellQuote = 0,
      @JsonKey(name: 'max_buy_quote') this.maxBuyQuote = 0,
      @JsonKey(name: 'max_sell_quote') this.maxSellQuote = 0,
      @JsonKey(name: 'max_buy_base') this.maxBuyBase = 0,
      @JsonKey(name: 'max_sell_base') this.maxSellBase = 0,
      @JsonKey(name: 'decimal_base') this.decimalBase = 0,
      @JsonKey(name: 'decimal_quote') this.decimalQuote = 0})
      : super._();

  factory _$CoinModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoinModelImplFromJson(json);

  @override
  @JsonKey(name: 'id_listing')
  final int idListing;
  @override
  @JsonKey(name: 'id_base_asset')
  final int idBaseAsset;
  @override
  @JsonKey(name: 'id_quote_asset')
  final int idQuoteAsset;
  @override
  @JsonKey(name: 'symbol')
  final String symbol;
  @override
  @JsonKey(name: 'order')
  final int order;
  @override
  @JsonKey(name: 'is_usentvprice')
  final bool isUsentVPrice;
  @override
  @JsonKey(name: 'is_spread_inpercent')
  final bool isSpreadInpercent;
  @override
  @JsonKey(name: 'is_fee_inpercent')
  final bool isFeeInpercent;
  @override
  @JsonKey(name: 'spread_buy')
  final double spreadBuy;
  @override
  @JsonKey(name: 'spread_sell')
  final double spreadSell;
  @override
  @JsonKey(name: 'fee_buy')
  final double feeBuy;
  @override
  @JsonKey(name: 'fee_sell')
  final double feeSell;
  @override
  @JsonKey(name: 'min_buy_base')
  final double minBuyBase;
  @override
  @JsonKey(name: 'min_sell_base')
  final double minSellBase;
  @override
  @JsonKey(name: 'datetime_create')
  final String datetimeCreate;
  @override
  @JsonKey(name: 'created_by')
  final String createdBy;
  @override
  @JsonKey(name: 'datatime_update')
  final String datetimeUpdate;
  @override
  @JsonKey(name: 'updated_by')
  final String updatedBy;
  @override
  @JsonKey(name: 'min_buy_quote')
  final double minBuyQuote;
  @override
  @JsonKey(name: 'min_sell_quote')
  final double minSellQuote;
  @override
  @JsonKey(name: 'max_buy_quote')
  final double maxBuyQuote;
  @override
  @JsonKey(name: 'max_sell_quote')
  final double maxSellQuote;
  @override
  @JsonKey(name: 'max_buy_base')
  final double maxBuyBase;
  @override
  @JsonKey(name: 'max_sell_base')
  final double maxSellBase;
  @override
  @JsonKey(name: 'decimal_base')
  final int decimalBase;
  @override
  @JsonKey(name: 'decimal_quote')
  final int decimalQuote;

  @override
  String toString() {
    return 'CoinModel(idListing: $idListing, idBaseAsset: $idBaseAsset, idQuoteAsset: $idQuoteAsset, symbol: $symbol, order: $order, isUsentVPrice: $isUsentVPrice, isSpreadInpercent: $isSpreadInpercent, isFeeInpercent: $isFeeInpercent, spreadBuy: $spreadBuy, spreadSell: $spreadSell, feeBuy: $feeBuy, feeSell: $feeSell, minBuyBase: $minBuyBase, minSellBase: $minSellBase, datetimeCreate: $datetimeCreate, createdBy: $createdBy, datetimeUpdate: $datetimeUpdate, updatedBy: $updatedBy, minBuyQuote: $minBuyQuote, minSellQuote: $minSellQuote, maxBuyQuote: $maxBuyQuote, maxSellQuote: $maxSellQuote, maxBuyBase: $maxBuyBase, maxSellBase: $maxSellBase, decimalBase: $decimalBase, decimalQuote: $decimalQuote)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoinModelImpl &&
            (identical(other.idListing, idListing) ||
                other.idListing == idListing) &&
            (identical(other.idBaseAsset, idBaseAsset) ||
                other.idBaseAsset == idBaseAsset) &&
            (identical(other.idQuoteAsset, idQuoteAsset) ||
                other.idQuoteAsset == idQuoteAsset) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.isUsentVPrice, isUsentVPrice) ||
                other.isUsentVPrice == isUsentVPrice) &&
            (identical(other.isSpreadInpercent, isSpreadInpercent) ||
                other.isSpreadInpercent == isSpreadInpercent) &&
            (identical(other.isFeeInpercent, isFeeInpercent) ||
                other.isFeeInpercent == isFeeInpercent) &&
            (identical(other.spreadBuy, spreadBuy) ||
                other.spreadBuy == spreadBuy) &&
            (identical(other.spreadSell, spreadSell) ||
                other.spreadSell == spreadSell) &&
            (identical(other.feeBuy, feeBuy) || other.feeBuy == feeBuy) &&
            (identical(other.feeSell, feeSell) || other.feeSell == feeSell) &&
            (identical(other.minBuyBase, minBuyBase) ||
                other.minBuyBase == minBuyBase) &&
            (identical(other.minSellBase, minSellBase) ||
                other.minSellBase == minSellBase) &&
            (identical(other.datetimeCreate, datetimeCreate) ||
                other.datetimeCreate == datetimeCreate) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.datetimeUpdate, datetimeUpdate) ||
                other.datetimeUpdate == datetimeUpdate) &&
            (identical(other.updatedBy, updatedBy) ||
                other.updatedBy == updatedBy) &&
            (identical(other.minBuyQuote, minBuyQuote) ||
                other.minBuyQuote == minBuyQuote) &&
            (identical(other.minSellQuote, minSellQuote) ||
                other.minSellQuote == minSellQuote) &&
            (identical(other.maxBuyQuote, maxBuyQuote) ||
                other.maxBuyQuote == maxBuyQuote) &&
            (identical(other.maxSellQuote, maxSellQuote) ||
                other.maxSellQuote == maxSellQuote) &&
            (identical(other.maxBuyBase, maxBuyBase) ||
                other.maxBuyBase == maxBuyBase) &&
            (identical(other.maxSellBase, maxSellBase) ||
                other.maxSellBase == maxSellBase) &&
            (identical(other.decimalBase, decimalBase) ||
                other.decimalBase == decimalBase) &&
            (identical(other.decimalQuote, decimalQuote) ||
                other.decimalQuote == decimalQuote));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        idListing,
        idBaseAsset,
        idQuoteAsset,
        symbol,
        order,
        isUsentVPrice,
        isSpreadInpercent,
        isFeeInpercent,
        spreadBuy,
        spreadSell,
        feeBuy,
        feeSell,
        minBuyBase,
        minSellBase,
        datetimeCreate,
        createdBy,
        datetimeUpdate,
        updatedBy,
        minBuyQuote,
        minSellQuote,
        maxBuyQuote,
        maxSellQuote,
        maxBuyBase,
        maxSellBase,
        decimalBase,
        decimalQuote
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CoinModelImplCopyWith<_$CoinModelImpl> get copyWith =>
      __$$CoinModelImplCopyWithImpl<_$CoinModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoinModelImplToJson(
      this,
    );
  }
}

abstract class _CoinModel extends CoinModel {
  const factory _CoinModel(
          {@JsonKey(name: 'id_listing') final int idListing,
          @JsonKey(name: 'id_base_asset') final int idBaseAsset,
          @JsonKey(name: 'id_quote_asset') final int idQuoteAsset,
          @JsonKey(name: 'symbol') final String symbol,
          @JsonKey(name: 'order') final int order,
          @JsonKey(name: 'is_usentvprice') final bool isUsentVPrice,
          @JsonKey(name: 'is_spread_inpercent') final bool isSpreadInpercent,
          @JsonKey(name: 'is_fee_inpercent') final bool isFeeInpercent,
          @JsonKey(name: 'spread_buy') final double spreadBuy,
          @JsonKey(name: 'spread_sell') final double spreadSell,
          @JsonKey(name: 'fee_buy') final double feeBuy,
          @JsonKey(name: 'fee_sell') final double feeSell,
          @JsonKey(name: 'min_buy_base') final double minBuyBase,
          @JsonKey(name: 'min_sell_base') final double minSellBase,
          @JsonKey(name: 'datetime_create') final String datetimeCreate,
          @JsonKey(name: 'created_by') final String createdBy,
          @JsonKey(name: 'datatime_update') final String datetimeUpdate,
          @JsonKey(name: 'updated_by') final String updatedBy,
          @JsonKey(name: 'min_buy_quote') final double minBuyQuote,
          @JsonKey(name: 'min_sell_quote') final double minSellQuote,
          @JsonKey(name: 'max_buy_quote') final double maxBuyQuote,
          @JsonKey(name: 'max_sell_quote') final double maxSellQuote,
          @JsonKey(name: 'max_buy_base') final double maxBuyBase,
          @JsonKey(name: 'max_sell_base') final double maxSellBase,
          @JsonKey(name: 'decimal_base') final int decimalBase,
          @JsonKey(name: 'decimal_quote') final int decimalQuote}) =
      _$CoinModelImpl;
  const _CoinModel._() : super._();

  factory _CoinModel.fromJson(Map<String, dynamic> json) =
      _$CoinModelImpl.fromJson;

  @override
  @JsonKey(name: 'id_listing')
  int get idListing;
  @override
  @JsonKey(name: 'id_base_asset')
  int get idBaseAsset;
  @override
  @JsonKey(name: 'id_quote_asset')
  int get idQuoteAsset;
  @override
  @JsonKey(name: 'symbol')
  String get symbol;
  @override
  @JsonKey(name: 'order')
  int get order;
  @override
  @JsonKey(name: 'is_usentvprice')
  bool get isUsentVPrice;
  @override
  @JsonKey(name: 'is_spread_inpercent')
  bool get isSpreadInpercent;
  @override
  @JsonKey(name: 'is_fee_inpercent')
  bool get isFeeInpercent;
  @override
  @JsonKey(name: 'spread_buy')
  double get spreadBuy;
  @override
  @JsonKey(name: 'spread_sell')
  double get spreadSell;
  @override
  @JsonKey(name: 'fee_buy')
  double get feeBuy;
  @override
  @JsonKey(name: 'fee_sell')
  double get feeSell;
  @override
  @JsonKey(name: 'min_buy_base')
  double get minBuyBase;
  @override
  @JsonKey(name: 'min_sell_base')
  double get minSellBase;
  @override
  @JsonKey(name: 'datetime_create')
  String get datetimeCreate;
  @override
  @JsonKey(name: 'created_by')
  String get createdBy;
  @override
  @JsonKey(name: 'datatime_update')
  String get datetimeUpdate;
  @override
  @JsonKey(name: 'updated_by')
  String get updatedBy;
  @override
  @JsonKey(name: 'min_buy_quote')
  double get minBuyQuote;
  @override
  @JsonKey(name: 'min_sell_quote')
  double get minSellQuote;
  @override
  @JsonKey(name: 'max_buy_quote')
  double get maxBuyQuote;
  @override
  @JsonKey(name: 'max_sell_quote')
  double get maxSellQuote;
  @override
  @JsonKey(name: 'max_buy_base')
  double get maxBuyBase;
  @override
  @JsonKey(name: 'max_sell_base')
  double get maxSellBase;
  @override
  @JsonKey(name: 'decimal_base')
  int get decimalBase;
  @override
  @JsonKey(name: 'decimal_quote')
  int get decimalQuote;
  @override
  @JsonKey(ignore: true)
  _$$CoinModelImplCopyWith<_$CoinModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
