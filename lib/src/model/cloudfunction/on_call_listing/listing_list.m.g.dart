// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_list.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestListingListModelImpl _$$RequestListingListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestListingListModelImpl(
      limit: json['limit'] as int? ?? 10,
      page: json['page'] as int? ?? 1,
      cointype: json['cointype'] as String? ?? '',
    );

Map<String, dynamic> _$$RequestListingListModelImplToJson(
        _$RequestListingListModelImpl instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'page': instance.page,
      'cointype': instance.cointype,
    };

_$ResponseListingListModelImpl _$$ResponseListingListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseListingListModelImpl(
      totalRows: json['totalRows'] as int? ?? 0,
      currentPage: json['currentPage'] as int? ?? 0,
      totalPages: json['totalPages'] as int? ?? 0,
      rows: (json['rows'] as List<dynamic>?)
              ?.map((e) => CoinModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <CoinModel>[],
    );

Map<String, dynamic> _$$ResponseListingListModelImplToJson(
        _$ResponseListingListModelImpl instance) =>
    <String, dynamic>{
      'totalRows': instance.totalRows,
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'rows': instance.rows.map((e) => e.toJson()).toList(),
    };

_$CoinModelImpl _$$CoinModelImplFromJson(Map<String, dynamic> json) =>
    _$CoinModelImpl(
      idListing: json['id_listing'] as int? ?? 0,
      idBaseAsset: json['id_base_asset'] as int? ?? 0,
      idQuoteAsset: json['id_quote_asset'] as int? ?? 0,
      symbol: json['symbol'] as String? ?? '',
      order: json['order'] as int? ?? 0,
      isUsentVPrice: json['is_usentvprice'] as bool? ?? false,
      isSpreadInpercent: json['is_spread_inpercent'] as bool? ?? false,
      isFeeInpercent: json['is_fee_inpercent'] as bool? ?? false,
      spreadBuy: (json['spread_buy'] as num?)?.toDouble() ?? 0,
      spreadSell: (json['spread_sell'] as num?)?.toDouble() ?? 0,
      feeBuy: (json['fee_buy'] as num?)?.toDouble() ?? 0,
      feeSell: (json['fee_sell'] as num?)?.toDouble() ?? 0,
      minBuyBase: (json['min_buy_base'] as num?)?.toDouble() ?? 0,
      minSellBase: (json['min_sell_base'] as num?)?.toDouble() ?? 0,
      datetimeCreate: json['datetime_create'] as String? ?? '',
      createdBy: json['created_by'] as String? ?? '',
      datetimeUpdate: json['datatime_update'] as String? ?? '',
      updatedBy: json['updated_by'] as String? ?? '',
      minBuyQuote: (json['min_buy_quote'] as num?)?.toDouble() ?? 0,
      minSellQuote: (json['min_sell_quote'] as num?)?.toDouble() ?? 0,
      maxBuyQuote: (json['max_buy_quote'] as num?)?.toDouble() ?? 0,
      maxSellQuote: (json['max_sell_quote'] as num?)?.toDouble() ?? 0,
      maxBuyBase: (json['max_buy_base'] as num?)?.toDouble() ?? 0,
      maxSellBase: (json['max_sell_base'] as num?)?.toDouble() ?? 0,
      decimalBase: json['decimal_base'] as int? ?? 0,
      decimalQuote: json['decimal_quote'] as int? ?? 0,
    );

Map<String, dynamic> _$$CoinModelImplToJson(_$CoinModelImpl instance) =>
    <String, dynamic>{
      'id_listing': instance.idListing,
      'id_base_asset': instance.idBaseAsset,
      'id_quote_asset': instance.idQuoteAsset,
      'symbol': instance.symbol,
      'order': instance.order,
      'is_usentvprice': instance.isUsentVPrice,
      'is_spread_inpercent': instance.isSpreadInpercent,
      'is_fee_inpercent': instance.isFeeInpercent,
      'spread_buy': instance.spreadBuy,
      'spread_sell': instance.spreadSell,
      'fee_buy': instance.feeBuy,
      'fee_sell': instance.feeSell,
      'min_buy_base': instance.minBuyBase,
      'min_sell_base': instance.minSellBase,
      'datetime_create': instance.datetimeCreate,
      'created_by': instance.createdBy,
      'datatime_update': instance.datetimeUpdate,
      'updated_by': instance.updatedBy,
      'min_buy_quote': instance.minBuyQuote,
      'min_sell_quote': instance.minSellQuote,
      'max_buy_quote': instance.maxBuyQuote,
      'max_sell_quote': instance.maxSellQuote,
      'max_buy_base': instance.maxBuyBase,
      'max_sell_base': instance.maxSellBase,
      'decimal_base': instance.decimalBase,
      'decimal_quote': instance.decimalQuote,
    };
