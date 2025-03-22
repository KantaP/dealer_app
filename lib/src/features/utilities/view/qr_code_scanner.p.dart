import 'package:aconnec_1109_x/src/features/utilities/view/di/qr_code_scanner.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeScannerView extends CustomView<QrCodeScannerViewModel> {
  const QrCodeScannerView(
      {super.key, required QrCodeScannerViewModel viewModel})
      : super.model(viewModel);

  @override
  ViewState<QrCodeScannerView, QrCodeScannerViewModel> createState() =>
      _QrCodeScannerViewState(viewModel);
}

class _QrCodeScannerViewState
    extends ViewState<QrCodeScannerView, QrCodeScannerViewModel> {
  _QrCodeScannerViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  // @override
  // void reassemble() {
  //   super.reassemble();
  //   if (Platform.isAndroid) {
  //     viewModel.controller!.pauseCamera();
  //   } else if (Platform.isIOS) {
  //     viewModel.controller!.resumeCamera();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: const DefaultAppBar(
        title: 'QR Scanner',
        centerTitle: true,
      ),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          fillOverscroll: true,
          child: _buildBody(),
        )
      ],
      physics: const NeverScrollableScrollPhysics(),
      extendBody: true,
    );
  }

  Widget _buildBody() {
    return _buildQrView();
  }

  Widget _buildQrView() {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: viewModel.qrKey,
      onQRViewCreated: viewModel.onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: blueColor,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) {},
    );
  }
}
