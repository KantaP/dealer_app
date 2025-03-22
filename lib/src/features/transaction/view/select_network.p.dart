import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/border_radius.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/di/select_network.vm.dart';
import 'package:aconnec_1109_x/src/model/network.m.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:aconnec_1109_x/src/widgets/warning_text_box.dart';
import 'package:flutter/material.dart';

class SelectNetworkView extends CustomView<SelectNetworkViewModel> {
  const SelectNetworkView(
      {super.key, required SelectNetworkViewModel viewModel})
      : super.model(viewModel);

  @override
  ViewState<SelectNetworkView, SelectNetworkViewModel> createState() =>
      _SelectNetworkViewState(viewModel);
}

class _SelectNetworkViewState
    extends ViewState<SelectNetworkView, SelectNetworkViewModel> {
  _SelectNetworkViewState(super.viewModel);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: const SliverAppBar(),
      slivers: [
        _buildBody(),
      ],
      physics: const NeverScrollableScrollPhysics(),
      extendBody: true,
    );
  }

  Widget _buildBody() {
    return SliverFillRemaining(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            const SizedBox(
              height: Spacing.spacing20,
            ),
            _buildWarningText(),
            const SizedBox(
              height: Spacing.spacing20,
            ),
            _buildList(),
          ],
        ),
      ),
    );
  }

  _buildTitle() {
    return HilightText(
      text: S.of(context).selectNetworkTitle,
      hilightStyle: headline4BoldStyle?.merge(
        const TextStyle(color: blueColor),
      ),
      normalStyle: headline4LightStyle,
    );
  }

  _buildWarningText() {
    return WarningTextBox(text: S.of(context).selectNetworkWarningText);
  }

  _buildList() {
    return FutureBuilder<List<NetworkModel>>(
      future: viewModel.loadNetwork(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemBuilder: (BuildContext _, int index) {
              return LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(
                        NetworkModelPersistence().toJson(
                          snapshot.data![index],
                        ),
                      );
                    },
                    child: Container(
                      constraints: constraints,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: lightGrey1Color,
                        ),
                        borderRadius: BorderRadius.circular(
                          BorderRadiusSet.radius10,
                        ),
                      ),
                      padding: const EdgeInsets.all(Spacing.spacing10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data?[index].networkName ?? '',
                            style: paragraph1LightStyle,
                          ),
                          Text(
                            snapshot.data?[index].description ?? '',
                            style:
                                paragraph3Style?.copyWith(color: darkGreyColor),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            itemCount: snapshot.data?.length ?? 0,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: Spacing.spacing10,
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
