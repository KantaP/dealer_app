import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/capture_id_card.st.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/di/capture_back_id_card.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:aconnec_1109_x/src/widgets/loading.dart';

class CaptureBackIdCardView extends CustomView<CaptureBackIdCardViewModel> {
  const CaptureBackIdCardView(
      {required CaptureBackIdCardViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _CaptureBackIdCardViewState createState() =>
      _CaptureBackIdCardViewState(viewModel);
}

class _CaptureBackIdCardViewState
    extends ViewState<CaptureBackIdCardView, CaptureBackIdCardViewModel> {
  _CaptureBackIdCardViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  void didPush() {
    super.didPush();

    final settings = ModalRoute.of(context)?.settings;
    final arguments = settings?.arguments as Map<String, dynamic>? ?? {};
    viewModel.updateState(<String, dynamic>{
      CaptureIdCardPageStateFields.onCapture:
          arguments[CaptureIdCardPageStateFields.onCapture],
    });
    Future.delayed(const Duration(seconds: 1), () {
      viewModel.initCamera();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultLayout(
          bgColor: Colors.transparent,
          appBar: SliverAppBar(
            pinned: true,
            backgroundColor: Colors.transparent,
            title: Text(
              S.of(context).kycUploadIdCardBackHeadline,
              style: titleStyle?.copyWith(color: whiteColor),
            ),
            automaticallyImplyLeading: false,
          ),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: _buildContent(),
            )
          ],
          physics: const NeverScrollableScrollPhysics(),
          extendBody: false,
        ),
        StreamBuilder<CaptureIdCardPageState>(
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
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - kToolbarHeight,
      child: Stack(
        children: [
          StreamBuilder<CaptureIdCardPageState>(
            stream: viewModel.state,
            builder: (context, snapshot) {
              if (snapshot.data?.initCamera == true) {
                if (snapshot.data?.canRetake == false) {
                  return FutureBuilder<void>(
                    future: viewModel.initializeControllerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        // If the Future is complete, display the preview.
                        return SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
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
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Image.file(
                      snapshot.data!.previewFile!,
                      fit: BoxFit.fill,
                    ),
                  );
                }
              }
              return Container();
            },
          ),
          Column(
            children: [
              const Spacer(),
              StreamBuilder<CaptureIdCardPageState>(
                stream: viewModel.state,
                builder: (context, snapshot) {
                  if (snapshot.hasData == false) return Container();
                  return Visibility(
                    visible: snapshot.data!.canRetake == false,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: whiteColor),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const Spacer(),
              _buildCaptureSection(),
              _buildActionButton(),
              SizedBox(
                height: 34,
              )
            ],
          )
        ],
      ),
    );
  }

  _buildActionButton() {
    return StreamBuilder<CaptureIdCardPageState>(
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
                padding: const EdgeInsets.only(bottom: 34.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      S.of(context).captureIdCardConfirmContent,
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
    return StreamBuilder<CaptureIdCardPageState>(
      stream: viewModel.state,
      builder: (context, snapshot) {
        if (snapshot.hasData == false) return Container();
        return Visibility(
          visible: snapshot.data!.canRetake == false,
          child: Container(
            color: blackColor.withOpacity(0.25),
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(
                horizontal: Spacing.spacing24, vertical: Spacing.spacing20),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 34),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
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
        );
      },
    );
  }
}
