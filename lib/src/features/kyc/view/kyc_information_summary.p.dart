import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/address.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/fund.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_information_summary.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_information_summary.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/custom_divider.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:lottie/lottie.dart';

class KycInformationSummaryView
    extends CustomView<KycInformationSummaryViewModel> {
  final KycLevel2ViewModel kycLevel2ViewModel;

  const KycInformationSummaryView(this.kycLevel2ViewModel,
      {required KycInformationSummaryViewModel viewModel, super.key})
      : super.model(viewModel);

  @override
  ViewState<KycInformationSummaryView, KycInformationSummaryViewModel>
      createState() => _KycInformationSummaryViewState(viewModel);
}

class _KycInformationSummaryViewState extends ViewState<
    KycInformationSummaryView, KycInformationSummaryViewModel> {
  _KycInformationSummaryViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    viewModel.setKycViewModel(widget.kycLevel2ViewModel);
  }

  @override
  void didPush() {
    super.didPush();
    viewModel.firebaseListener();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 24),
      child: StreamBuilder<KycInformationSummaryPageState>(
          stream: viewModel.state,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Container();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: HilightText(
                    text: S.current.kycInformationSummaryHeadline,
                    hilightStyle: headline4BoldStyle?.merge(
                      const TextStyle(color: blueColor),
                    ),
                    normalStyle: headline4LightStyle,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: _buildIdCardAddress(),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomDivider(),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: _buildCurrentAddress(),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomDivider(),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: _buildFundInformation(),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: _buildAnotherJobDocument(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: _buildAnotherJobAssetDocument(),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomDivider(),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: _buildWorkingAddress(),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomDivider(),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: _buildAcceptLaw(),
                ),
                const SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Expanded(
                      //   child: OutlinedButton(
                      //     onPressed: () {
                      //       widget.kycLevel2ViewModel.pageController
                      //           .previousPage(
                      //               duration: const Duration(milliseconds: 500),
                      //               curve: Curves.easeOut);
                      //     },
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
                          },
                          child: Text(
                            S.current.confirmButton,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                )
              ],
            );
          }),
    );
  }

  Widget _buildIdCardAddress() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                S.current.kycInformationSummarySection1,
                style: titleStyle,
              ),
            ),
            InkWell(
              onTap: () {
                viewModel.editData(pageNumber: 0);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(AssetSvg.edit),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    S.current.editButton,
                    style: paragraph2Style?.copyWith(color: blueColor),
                  )
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Flexible(
          child: StreamBuilder<KycInformationSummaryPageState>(
            stream: viewModel.state,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  viewModel.getAddress(snapshot.data?.idCardAddressState ??
                      KycAddressFormState()),
                  style: paragraph1LightStyle,
                );
              }
              return const Text('');
            },
          ),
        )
      ],
    );
  }

  Widget _buildCurrentAddress() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                S.current.kycInformationSummarySection2,
                style: titleStyle,
              ),
            ),
            InkWell(
              onTap: () {
                viewModel.editData(pageNumber: 0);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(AssetSvg.edit),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    S.current.editButton,
                    style: paragraph2Style?.copyWith(color: blueColor),
                  )
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Flexible(
          child: StreamBuilder<KycInformationSummaryPageState>(
            stream: viewModel.state,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  viewModel.getAddress(snapshot.data?.currentAddressState ??
                      KycAddressFormState()),
                  style: paragraph1LightStyle,
                );
              }
              return const Text('');
            },
          ),
        )
      ],
    );
  }

  Widget _buildWorkingAddress() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                S.current.kycInformationSummarySection4,
                style: titleStyle,
              ),
            ),
            InkWell(
              onTap: () {
                viewModel.editData(pageNumber: 1);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(AssetSvg.edit),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    S.current.editButton,
                    style: paragraph2Style?.copyWith(color: blueColor),
                  )
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Flexible(
          child: StreamBuilder<KycInformationSummaryPageState>(
            stream: viewModel.state,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  viewModel.getAddress(snapshot.data?.workingAddressState ??
                      KycAddressFormState()),
                  style: paragraph1LightStyle,
                );
              }
              return const Text('');
            },
          ),
        )
      ],
    );
  }

  Widget _buildFundInformation() {
    return FutureBuilder<KycFundFormState>(
      future: viewModel.getFundFormState(),
      builder: (context, snapshot) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  S.current.kycInformationSummarySection3,
                  style: titleStyle,
                ),
              ),
              InkWell(
                onTap: () {
                  viewModel.editData(pageNumber: 1);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(AssetSvg.edit),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      S.current.editButton,
                      style: paragraph2Style?.copyWith(color: blueColor),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          _buildDetail(
            label: S.current.kycInformationSummarySection3Label1,
            detail: snapshot.data?.occupation ?? 'n/a',
          ),
          const SizedBox(
            height: 20,
          ),
          _buildDetail(
            label: S.current.kycInformationSummarySection3Label2,
            detail: snapshot.data?.salaryRange ?? 'n/a',
          ),
          const SizedBox(
            height: 20,
          ),
          _buildDetail(
            label: S.current.kycInformationSummarySection3Label3,
            detail: snapshot.data?.workingPlaceName ?? 'n/a',
          ),
          const SizedBox(
            height: 20,
          ),
          _buildDetail(
            label: S.current.kycInformationSummarySection3Label4,
            detail: (snapshot.data?.anotherJob == false)
                ? S.current.doNotHave
                : (snapshot.data?.anotherJob == true)
                    ? S.current.have
                    : 'n/a',
          ),
          Visibility(
            visible: snapshot.data?.anotherJob == true,
            child: const SizedBox(
              height: 20,
            ),
          ),
          Visibility(
            visible: snapshot.data?.anotherJob == true,
            child: _buildDetail(
              label: S.current.kycInformationSummarySection3Label5,
              detail: snapshot.data?.anotherJobSalaryRange ?? 'n/a',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetail({required String label, required String detail}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: paragraph1LightStyle?.copyWith(color: darkGreyColor),
          ),
        ),
        Expanded(
          child: Text(
            detail,
            style: paragraph1LightStyle,
            textAlign: TextAlign.right,
          ),
        )
      ],
    );
  }

  Widget _buildAnotherJobDocument() {
    return FutureBuilder<KycFundFormState>(
      future: viewModel.getFundFormState(),
      builder: (context, snapshot) => Visibility(
        visible: snapshot.data?.anotherJob == true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                S.current.kycInformationSummarySection6,
                style: titleStyle,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            _buildPreviewImage('doc'),
          ],
        ),
      ),
    );
  }

  Widget _buildAnotherJobAssetDocument() {
    return FutureBuilder<KycFundFormState>(
      future: viewModel.getFundFormState(),
      builder: (context, snapshot) => Visibility(
        visible: snapshot.data?.anotherJob == true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 20,
            ),
            Flexible(
              child: Text(
                S.current.kycInformationSummarySection7,
                style: titleStyle,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            _buildPreviewImage('asset'),
          ],
        ),
      ),
    );
  }

  Widget _buildPreviewImage(String type) {
    return DottedBorder(
      color: darkGreyColor,
      dashPattern: const [8, 4],
      borderPadding: const EdgeInsets.all(2),
      radius: const Radius.circular(10),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          color: lightGrey1Color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: FutureBuilder<String>(
          future: (type == 'doc')
              ? viewModel.getAnotherJobDocImage()
              : viewModel.getAnotherJobAssetDocImage(),
          builder: (context, snapshot) =>
              _buildImageContent(snapshot.data ?? ''),
        ),
      ),
    );
  }

  Widget _buildImageContent(String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              (imagePath.isNotEmpty)
                  ? Image.network(imagePath)
                  : SizedBox(
                      width: 32,
                      height: 32,
                      child: Lottie.asset(
                        AssetJson.loading,
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAcceptLaw() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                S.current.kycInformationSummarySection5,
                style: titleStyle,
              ),
            ),
            InkWell(
              onTap: () {
                viewModel.editData(pageNumber: 2);
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(AssetSvg.edit),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    S.current.editButton,
                    style: paragraph2Style?.copyWith(color: blueColor),
                  )
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Flexible(
          child: Text(
            S.current.kycAcceptLawContentTitle,
            style: paragraph1RegularStyle,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('\u2022'),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                S.current.kycAcceptLawContentRole1,
                style: paragraph2Style?.copyWith(color: darkGreyColor),
              ),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('\u2022'),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Text(
                S.current.kycAcceptLawContentRole2,
                style: paragraph2Style?.copyWith(color: darkGreyColor),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 22,
        ),
        StreamBuilder<KycInformationSummaryPageState>(
          stream: viewModel.state,
          builder: (context, snapshot) => Row(
            children: [
              Image.asset((snapshot.data?.acceptLawState.accept == true)
                  ? AssetIcons.success
                  : AssetIcons.failed),
              const SizedBox(
                width: 10,
              ),
              Text(
                (snapshot.data?.acceptLawState.accept == true)
                    ? S.current.yes
                    : S.current.no,
                style: paragraph1LightStyle,
              )
            ],
          ),
        )
      ],
    );
  }
}
