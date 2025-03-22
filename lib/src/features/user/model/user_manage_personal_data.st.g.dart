// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_manage_personal_data.st.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserManagePersonalDataPageStateImpl
    _$$UserManagePersonalDataPageStateImplFromJson(Map<String, dynamic> json) =>
        _$UserManagePersonalDataPageStateImpl(
          isLoading: json['isLoading'] as bool? ?? false,
          acceptMarketing: json['acceptMarketing'] as bool? ?? false,
          acceptFinance: json['acceptFinance'] as bool? ?? false,
          acceptProductDevelop: json['acceptProductDevelop'] as bool? ?? false,
        );

Map<String, dynamic> _$$UserManagePersonalDataPageStateImplToJson(
        _$UserManagePersonalDataPageStateImpl instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'acceptMarketing': instance.acceptMarketing,
      'acceptFinance': instance.acceptFinance,
      'acceptProductDevelop': instance.acceptProductDevelop,
    };
