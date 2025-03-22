import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_deposit_wallet.m.freezed.dart';
part 'get_deposit_wallet.m.g.dart';

@freezed
class RequestGetDepositWalletModel with _$RequestGetDepositWalletModel {
  const factory RequestGetDepositWalletModel(
      {@JsonKey(name: 'digitalasset_symbol')
      required String digitalAssetSymbol}) = _RequestGetDepositWalletModel;

  factory RequestGetDepositWalletModel.fromJson(Map<String, dynamic> json) =>
      _$RequestGetDepositWalletModelFromJson(json);
}

@freezed
class ResponseGetDepositWalletModel with _$ResponseGetDepositWalletModel {
  const factory ResponseGetDepositWalletModel({
    @JsonKey(name: 'deposit_address') @Default('') String depositAddress,
    @JsonKey(name: 'payment_channel') @Default('') String paymentChannel,
  }) = _ResponseGetDepositWalletModel;

  factory ResponseGetDepositWalletModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseGetDepositWalletModelFromJson(json);
}
