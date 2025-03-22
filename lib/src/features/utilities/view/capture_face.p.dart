import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/capture_face.st.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/di/capture_face.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:aconnec_1109_x/src/widgets/loading.dart';

import '../../../constants/spacing.dart';
import '../../../core/navigator_service.dart';

class CaptureFaceView extends CustomView<CaptureFaceViewModel> {
  const CaptureFaceView({required CaptureFaceViewModel viewModel, super.key})
      : super.model(viewModel);

  @override
  ViewState<CaptureFaceView, CaptureFaceViewModel> createState() =>
      _CaptureFaceViewState(viewModel);
}

class _CaptureFaceViewState
    extends ViewState<CaptureFaceView, CaptureFaceViewModel> {
  _CaptureFaceViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    // listenToRoutesSpecs(viewModel.routes);
    Future.delayed(const Duration(seconds: 1), () {
      viewModel.initCamera();
    });
  }

  @override
  void didPush() {
    super.didPush();
    final settings = ModalRoute.of(context)?.settings;
    final arguments = settings?.arguments as Map<String, dynamic>? ?? {};
    viewModel.updateState(<String, dynamic>{
      CaptureFacePageStateFields.onCapture:
          arguments[CaptureFacePageStateFields.onCapture],
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultLayout(
          bgColor: blackColor,
          safeAreaBottom: false,
          slivers: [
            DefaultAppBar(
              title: S.of(context).kycUploadSelfieHeadline,
              automaticallyImplyLeading: false,
              centerTitle: true,
              bgColor: blackColor.withOpacity(0.25),
              textNormalColor: Colors.white,
            ),
            SliverFillRemaining(
              child: _buildContent(),
            )
          ],
          physics: const NeverScrollableScrollPhysics(),
          extendBody: true,
        ),
        StreamBuilder<CaptureFacePageState>(
          stream: viewModel.state,
          builder: (context, snapshot) {
            return Visibility(
              visible: snapshot.data?.isLoading ?? false,
              child: const Loading(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildContent() {
    return Stack(
      children: [
        StreamBuilder<CaptureFacePageState>(
          stream: viewModel.state,
          builder: (context, snapshot) {
            if (snapshot.data?.initCamera == true) {
              if (snapshot.data?.canRetake == false) {
                return FutureBuilder<void>(
                  future: viewModel.initializeControllerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      // If the Future is complete, display the preview.
                      return Positioned(
                        top: 0,
                        bottom: 0,
                        child: CameraPreview(viewModel.cameraController),
                      );
                    } else {
                      // Otherwise, display a loading indicator.
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                );
              } else if (snapshot.data?.canRetake == true) {
                return SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.file(
                    snapshot.data!.previewFile!,
                    fit: BoxFit.cover,
                  ),
                );
              }
            }
            return Container(
              color: Colors.white,
            );
          },
        ),
        Column(
          children: [
            const SizedBox(
              height: 45,
            ),
            StreamBuilder<CaptureFacePageState>(
              stream: viewModel.state,
              builder: (context, snapshot) {
                if (snapshot.hasData == false) return Container();
                return Visibility(
                  visible: snapshot.data!.canRetake == false,
                  child: Assets.images.selfieFrame.image(),
                );
              },
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildCaptureSection(),
                  _buildActionButton(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  _buildActionButton() {
    return StreamBuilder<CaptureFacePageState>(
      stream: viewModel.state,
      builder: (context, snapshot) {
        if (snapshot.hasData == false) return Container();
        return Visibility(
          visible: snapshot.data!.canRetake == true,
          child: Container(
            color: blackColor.withOpacity(0.25),
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Spacing.spacing24, vertical: Spacing.spacing20),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 34),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      S.of(context).selfieConfirmText,
                      style: titleStyle?.copyWith(color: whiteColor),
                    ),
                    const SizedBox(
                      height: Spacing.spacing10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: OutlinedButton(
                              style: outlineWhiteButtonStyle,
                              onPressed: () {
                                viewModel.retake();
                              },
                              child: Text(
                                S.of(context).captureRetakeButton,
                              )),
                        ),
                        const SizedBox(
                          width: Spacing.spacing10,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: elevatedWhiteButton,
                            onPressed: () {
                              viewModel.uploadImage();
                            },
                            child: Text(
                              S.of(context).continueButton,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: Spacing.spacing10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCaptureSection() {
    return StreamBuilder<CaptureFacePageState>(
      stream: viewModel.state,
      builder: (context, snapshot) {
        if (snapshot.hasData == false) return Container();
        return Visibility(
          visible: snapshot.data!.canRetake == false,
          child: Container(
            color: blackColor.withOpacity(0.25),
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Spacing.spacing24, vertical: Spacing.spacing20),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 34),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Center(
                        child: TextButton(
                          onPressed: () {
                            viewModel.back();
                          },
                          child: Text(
                            S.of(context).cancelButton,
                            style: paragraph1RegularStyle?.copyWith(
                                color: whiteColor),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            viewModel.onCaptureImage();
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: whiteColor),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
