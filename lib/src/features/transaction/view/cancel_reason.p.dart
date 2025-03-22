import 'package:aconnec_1109_x/src/features/transaction/model/cancel_reason_radio.st.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/custom_steam_builder.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/cancel_reason.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/cancel_reason.st.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/di/cancel_reason.vm.dart';
import 'package:aconnec_1109_x/src/model/cancel_reason.m.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/custom_divider.dart';
import 'package:aconnec_1109_x/src/widgets/custom_text_field.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:aconnec_1109_x/src/widgets/loading.dart';

class CancelReasonView extends CustomView<CancelReasonViewModel> {
  final int idOrder;
  final String refCode;

  const CancelReasonView({
    required CancelReasonViewModel viewModel,
    super.key,
    required this.idOrder,
    required this.refCode,
  }) : super.model(viewModel);

  @override
  ViewState<CancelReasonView, CancelReasonViewModel> createState() =>
      _CancelReasonViewState(viewModel);
}

class _CancelReasonViewState
    extends ViewState<CancelReasonView, CancelReasonViewModel> {
  _CancelReasonViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultLayout(
            appBar: const DefaultAppBar(
              title: '',
            ),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: SliverToBoxAdapter(
                  child: HilightText(
                    text: S.of(context).cancelReasonTitle,
                    hilightStyle: headline4BoldStyle?.merge(
                      const TextStyle(color: blueColor),
                    ),
                    normalStyle: headline4LightStyle,
                  ),
                ),
              ),
              const SliverPadding(
                padding: EdgeInsets.only(top: 20),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    S.of(context).cancelReasonDesc,
                    style:
                        paragraph1RegularStyle?.copyWith(color: midGreyColor),
                  ),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 20)),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: SliverToBoxAdapter(
                  child: ListView.builder(
                    primary: false,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      return _buildRadio(
                          CancelReasonStaticValue.reasons[index]);
                    },
                    itemCount: CancelReasonStaticValue.reasons.length,
                  ),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const CustomDivider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 11),
                      child: CustomStreamBuilder<CancelReasonRadio>(
                          stream: viewModel.radioSubject.state(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData == false) return Container();
                            final selected =
                                snapshot.data?.selectedChoice ?? '';
                            return ElevatedButton(
                              onPressed: (selected.isEmpty)
                                  ? null
                                  : () {
                                      viewModel.submit(
                                          widget.idOrder, widget.refCode);
                                    },
                              child: Text(S.of(context).submitButton),
                            );
                          }),
                    )
                  ],
                ),
              )
            ],
            physics: const BouncingScrollPhysics(),
            extendBody: true),
        StreamBuilder<CancelReasonPageState>(
            stream: viewModel.state,
            builder: (context, snapshot) {
              if (snapshot.hasData == false) return Container();
              return Visibility(
                visible: snapshot.data!.isLoading,
                child: const Loading(),
              );
            }),
      ],
    );
  }

  Widget _buildRadio(CancelReasonModel item) {
    return CustomStreamBuilder<CancelReasonRadio>(
      stream: viewModel.radioSubject.state(),
      builder: (context, snapshot) {
        if (snapshot.hasData == false) return Container();
        if (item.codeValue == 'OTHER') {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 18,
                      height: 18,
                      child: Radio(
                        activeColor: blueColor,
                        value: item.codeValue,
                        groupValue: snapshot.data!.selectedChoice,
                        onChanged: (value) {
                          viewModel.radioSubject.setValue(
                            CancelReasonRadio(selectedChoice: value),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      item.transalateText,
                      style: paragraph1LightStyle?.copyWith(
                          color: darkGreyColor, height: 1.2),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28),
                  child: CustomTextField(
                    readOnly: snapshot.data!.selectedChoice != item.codeValue,
                    label: '',
                    maxlength: 450,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 5,
                    controller: viewModel.otherTextController,
                  ),
                ),
              ],
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 18,
                height: 18,
                child: Radio(
                  activeColor: blueColor,
                  value: item.codeValue,
                  groupValue: snapshot.data!.selectedChoice,
                  onChanged: (value) {
                    viewModel.radioSubject
                        .setValue(CancelReasonRadio(selectedChoice: value));
                    viewModel.otherTextController.value =
                        TextEditingValue.empty;
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text(
                  item.transalateText,
                  style: paragraph1LightStyle?.copyWith(
                      color: darkGreyColor, height: 1.2),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
