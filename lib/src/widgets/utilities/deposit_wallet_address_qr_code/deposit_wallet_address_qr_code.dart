import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_bitgo/get_deposit_wallet.m.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_new.abs.dart';
import 'package:aconnec_1109_x/src/widgets/qr_image.dart';
import 'package:aconnec_1109_x/src/widgets/custom_future.dart';
import 'package:aconnec_1109_x/src/widgets/utilities/deposit_wallet_address_qr_code/di/deposit_wallet_address_qr_code.vm.dart';
import 'package:flutter/material.dart';

class DepositWalletAddressQrCode
    extends CustomViewScreen<DepositWalletAddressQrCodeViewModel> {
  final RequestGetDepositWalletModel request;

  const DepositWalletAddressQrCode({
    super.key,
    required DepositWalletAddressQrCodeViewModel viewModel,
    required this.request,
  }) : super.model(viewModel);

  @override
  CustomViewState<DepositWalletAddressQrCode,
          DepositWalletAddressQrCodeViewModel>
      createState() => _DepositWalletAddressQrCodeState(viewModel);
}

class _DepositWalletAddressQrCodeState extends CustomViewState<
    DepositWalletAddressQrCode, DepositWalletAddressQrCodeViewModel> {
  _DepositWalletAddressQrCodeState(super.viewModel);

  @override
  Widget build(BuildContext context) {
    return CustomFuture(
      future: viewModel.loadDepositAddress(request: widget.request),
      customLoading: const SizedBox(
        height: 232,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      builder: (_, snapshot) {
        return SizedBox(
          height: 232,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                QrCustomImage(
                  size: 150,
                  data: snapshot.data?.depositAddress ?? '',
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
