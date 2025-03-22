import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_upload_id_card.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_upload_id_card.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';

import 'widgets/id_card_image_preview.dart';

class KycUploadIdCardView extends CustomView<KycUploadIdCardViewModel> {
  final KycLevel2ViewModel kycLevel2ViewModel;

  const KycUploadIdCardView(
    this.kycLevel2ViewModel, {
    required KycUploadIdCardViewModel viewModel,
    Key? key,
  }) : super.model(viewModel, key: key);

  @override
  _KycUploadIdCardViewState createState() =>
      _KycUploadIdCardViewState(viewModel);
}

class _KycUploadIdCardViewState
    extends ViewState<KycUploadIdCardView, KycUploadIdCardViewModel> {
  _KycUploadIdCardViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
    viewModel.setKycLevel2ViewModel(widget.kycLevel2ViewModel);
  }

  @override
  void didPush() {
    super.didPush();
    viewModel.loadImages();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            S.of(context).kycUploadIdCardHeadline,
            style: titleStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: StreamBuilder<KycUploadIdCardPageState>(
              stream: viewModel.state,
              builder: (context, snapshot) {
                final path = snapshot.data?.frontIdCardPath ?? '';
                return IdCardImagePreview(
                  label: S.of(context).kycUploadIdCardFrontHeadline,
                  onCapture: () {
                    viewModel.onEditFrontIdCard();
                  },
                  imagePreview: (path.isNotEmpty)
                      ? Image.network(path)
                      : Image.asset(AssetImages.backIdCard),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: StreamBuilder<KycUploadIdCardPageState>(
              stream: viewModel.state,
              builder: (context, snapshot) {
                final path = snapshot.data?.backIdCardPath ?? '';
                return IdCardImagePreview(
                  label: S.of(context).kycUploadIdCardBackHeadline,
                  onCapture: () {
                    viewModel.onEditBackIdCard();
                  },
                  imagePreview: (path.isNotEmpty)
                      ? Image.network(path)
                      : Image.asset(AssetImages.backIdCard),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: StreamBuilder<KycUploadIdCardPageState>(
              stream: viewModel.state,
              builder: (context, snapshot) {
                final path = snapshot.data?.selfiePath ?? '';
                return IdCardImagePreview(
                  label: S.of(context).kycUploadSelfieHeadline,
                  onCapture: () {
                    viewModel.onEditSelfie();
                  },
                  imagePreview: (path.isNotEmpty)
                      ? Image.network(path)
                      : const Icon(Icons.person),
                );
              },
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 20.0),
          //   child: StreamBuilder<KycUploadIdCardPageState>(
          //     stream: viewModel.state,
          //     builder: (context, snapshot) {
          //       return FaceImagePreview(
          //         label: S.of(context).kycUploadIdCardFaceLiveHeadline,
          //         onCapture: () {},
          //         passed: false,
          //       );
          //     },
          //   ),
          // ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Expanded(
              //   child: OutlinedButton(
              //     onPressed: () {},
              //     child: Text(
              //       S.current.backButton,
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   width: 21,
              // ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    viewModel.next();
                    widget.kycLevel2ViewModel.pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  child: Text(
                    S.current.nextButton,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          )
        ],
      ),
    );
  }
}
