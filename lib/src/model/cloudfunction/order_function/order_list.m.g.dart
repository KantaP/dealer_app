// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list.m.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestOrderListModelImpl _$$RequestOrderListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RequestOrderListModelImpl(
      orderSide: json['order_side'] as String? ?? null,
      status: json['status'] as String? ?? null,
      digitalassetType: json['digitalasset_type'] as String? ?? null,
      limit: json['limit'] as int? ?? 100,
      page: json['page'] as int? ?? 1,
      fields: json['fields'] ?? const [],
    );

Map<String, dynamic> _$$RequestOrderListModelImplToJson(
        _$RequestOrderListModelImpl instance) =>
    <String, dynamic>{
      'order_side': instance.orderSide,
      'status': instance.status,
      'digitalasset_type': instance.digitalassetType,
      'limit': instance.limit,
      'page': instance.page,
      'fields': instance.fields,
    };

_$ResponseOrderListModelImpl _$$ResponseOrderListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseOrderListModelImpl(
      rows: (json['rows'] as List<dynamic>?)
              ?.map((e) =>
                  ResponseOrderGetModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ResponseOrderGetModel>[],
      currentPage: json['currentPage'] as int? ?? 1,
      totalPages: json['totalPages'] as int? ?? 0,
      totalRows: json['totalRows'] as int? ?? 0,
    );

Map<String, dynamic> _$$ResponseOrderListModelImplToJson(
        _$ResponseOrderListModelImpl instance) =>
    <String, dynamic>{
      'rows': instance.rows.map((e) => e.toJson()).toList(),
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'totalRows': instance.totalRows,
    };
