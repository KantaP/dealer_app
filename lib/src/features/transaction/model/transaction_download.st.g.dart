// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_download.st.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionDownloadPageStateImpl _$$TransactionDownloadPageStateImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionDownloadPageStateImpl(
      docType: json['docType'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      email: json['email'] as String?,
      canSubmit: json['canSubmit'] as bool? ?? false,
    );

Map<String, dynamic> _$$TransactionDownloadPageStateImplToJson(
        _$TransactionDownloadPageStateImpl instance) =>
    <String, dynamic>{
      'docType': instance.docType,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'email': instance.email,
      'canSubmit': instance.canSubmit,
    };
