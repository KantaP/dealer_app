import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/constants/firebase_storage.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/dealer_ndid.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/dealer_ndid.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/model/idp.m.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:aconnec_1109_x/src/widgets/storage_image.dart';

class DealerNdidView extends CustomView<DealerNdidViewModel> {
  final KycFinalViewModel kycLevel2ViewModel;

  const DealerNdidView(this.kycLevel2ViewModel,
      {required DealerNdidViewModel viewModel, super.key})
      : super.model(viewModel);

  @override
  ViewState<DealerNdidView, DealerNdidViewModel> createState() =>
      _DealerNdidViewState(viewModel);
}

class _DealerNdidViewState
    extends ViewState<DealerNdidView, DealerNdidViewModel> {
  _DealerNdidViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
    viewModel.setKycLevel2ViewModel(widget.kycLevel2ViewModel);
  }

  @override
  void didPush() {
    super.didPush();
    viewModel.getAgentList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Spacing.spacing24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HilightText(
            text: S.current.dealerNdidHeader,
            hilightStyle: headline4BoldStyle?.merge(
              const TextStyle(color: blueColor),
            ),
            normalStyle: headline4LightStyle,
          ),
          const SizedBox(
            height: Spacing.spacing20,
          ),
          StreamBuilder<DealerNdidPageState>(
            stream: viewModel.state,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final items = snapshot.data?.dealers ?? [];
                return Column(
                  children: List.generate(
                      items.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(
                                bottom: Spacing.spacing10),
                            child: _buildDealerItem(items[index]),
                          )),
                  // physics: const NeverScrollableScrollPhysics(),
                  // shrinkWrap: true,
                  // itemBuilder: (context, index) {
                  //   return _buildDealerItem(items[index]);
                  // },
                  // itemCount: items.length,
                  // separatorBuilder: (BuildContext context, int index) {
                  //   return const SizedBox(
                  //     height: 10,
                  //   );
                  // },
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }

  Widget _buildDealerItem(IdpModel e) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            viewModel.next(e);
          },
          child: Container(
            constraints: const BoxConstraints(maxHeight: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: blueColor),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
              child: Row(
                children: [
                  StorageImage(
                    storagePath: FirebaseStorageValue.agentIconsRef,
                    fileName: e.id,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        e.code,
                        style: paragraph1RegularStyle,
                      ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          // mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AssetSvg.map),
            const SizedBox(
              width: 8,
            ),
            Text(
              S.of(context).dealerNdidFindButton,
              style: paragraph1RegularStyle?.copyWith(color: blueColor),
            )
          ],
        )
      ],
    );
  }
}
