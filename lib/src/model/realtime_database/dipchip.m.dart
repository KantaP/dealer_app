import 'package:freezed_annotation/freezed_annotation.dart';

part 'dipchip.m.freezed.dart';
part 'dipchip.m.g.dart';

@freezed
class DipchipModel with _$DipchipModel {
  const factory DipchipModel({
    @JsonKey(name: 'dipchip_status') @Default(false) dipchipStatus,
    @JsonKey(name: 'dipchip_check_date') @Default('') dipchipCheckDate,
  }) = _DipchipModel;

  factory DipchipModel.fromJson(Map<String, dynamic> json) =>
      _$DipchipModelFromJson(json);
}
