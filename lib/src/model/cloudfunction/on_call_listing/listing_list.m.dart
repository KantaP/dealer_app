import 'package:freezed_annotation/freezed_annotation.dart';

part 'listing_list.m.freezed.dart';
part 'listing_list.m.g.dart';

@freezed
class RequestListingListModel with _$RequestListingListModel {
  const factory RequestListingListModel({
    @JsonKey(name: 'limit') @Default(10) int limit,
    @JsonKey(name: 'page') @Default(1) int page,
    @JsonKey(name: 'cointype') @Default('') String cointype,
  }) = _RequestListingListModel;

  factory RequestListingListModel.fromJson(Map<String, dynamic> json) =>
      _$RequestListingListModelFromJson(json);
}

@freezed
class ResponseListingListModel with _$ResponseListingListModel {
  @JsonSerializable(explicitToJson: true)
  const factory ResponseListingListModel({
    @JsonKey(name: 'totalRows') @Default(0) int totalRows,
    @JsonKey(name: 'currentPage') @Default(0) int currentPage,
    @JsonKey(name: 'totalPages') @Default(0) int totalPages,
    @JsonKey(name: 'rows') @Default(<CoinModel>[]) List<CoinModel> rows,
  }) = _ResponseListingListModel;

  factory ResponseListingListModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseListingListModelFromJson(json);
}

@freezed
class CoinModel with _$CoinModel {
  const CoinModel._();

  const factory CoinModel({
    @JsonKey(name: 'id_listing') @Default(0) int idListing,
    @JsonKey(name: 'id_base_asset') @Default(0) int idBaseAsset,
    @JsonKey(name: 'id_quote_asset') @Default(0) int idQuoteAsset,
    @JsonKey(name: 'symbol') @Default('') String symbol,
    @JsonKey(name: 'order') @Default(0) int order,
    @JsonKey(name: 'is_usentvprice') @Default(false) bool isUsentVPrice,
    @JsonKey(name: 'is_spread_inpercent')
    @Default(false)
    bool isSpreadInpercent,
    @JsonKey(name: 'is_fee_inpercent') @Default(false) bool isFeeInpercent,
    @JsonKey(name: 'spread_buy') @Default(0) double spreadBuy,
    @JsonKey(name: 'spread_sell') @Default(0) double spreadSell,
    @JsonKey(name: 'fee_buy') @Default(0) double feeBuy,
    @JsonKey(name: 'fee_sell') @Default(0) double feeSell,
    @JsonKey(name: 'min_buy_base') @Default(0) double minBuyBase,
    @JsonKey(name: 'min_sell_base') @Default(0) double minSellBase,
    @JsonKey(name: 'datetime_create') @Default('') String datetimeCreate,
    @JsonKey(name: 'created_by') @Default('') String createdBy,
    @JsonKey(name: 'datatime_update') @Default('') String datetimeUpdate,
    @JsonKey(name: 'updated_by') @Default('') String updatedBy,
    @JsonKey(name: 'min_buy_quote') @Default(0) double minBuyQuote,
    @JsonKey(name: 'min_sell_quote') @Default(0) double minSellQuote,
    @JsonKey(name: 'max_buy_quote') @Default(0) double maxBuyQuote,
    @JsonKey(name: 'max_sell_quote') @Default(0) double maxSellQuote,
    @JsonKey(name: 'max_buy_base') @Default(0) double maxBuyBase,
    @JsonKey(name: 'max_sell_base') @Default(0) double maxSellBase,
    @JsonKey(name: 'decimal_base') @Default(0) int decimalBase,
    @JsonKey(name: 'decimal_quote') @Default(0) int decimalQuote,
  }) = _CoinModel;

  factory CoinModel.fromJson(Map<String, dynamic> json) =>
      _$CoinModelFromJson(json);

  String getBaseSymbol() {
    final List<String> symbols = symbol.split('/');
    return symbols[0].replaceAll('\n', '');
  }

  String getQuoteSymbol() {
    final List<String> symbols = symbol.split('/');
    return symbols[1].replaceAll('\n', '');
  }
}
