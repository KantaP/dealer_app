import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/dropdown_payment.st.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/di/dropdown_payment.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';

class DropdownPaymentView extends CustomView<DropdownPaymentViewModel> {
  const DropdownPaymentView(
      {required DropdownPaymentViewModel viewModel, super.key})
      : super.model(viewModel);

  @override
  ViewState<DropdownPaymentView, DropdownPaymentViewModel> createState() =>
      _DropdownPaymentViewState(viewModel);
}

class _DropdownPaymentViewState
    extends ViewState<DropdownPaymentView, DropdownPaymentViewModel> {
  _DropdownPaymentViewState(super.viewModel);

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
      DropdownPaymentPageStateFields.onSelect:
          arguments[DropdownPaymentPageStateFields.onSelect],
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            viewModel.goBack();
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: HilightText(
                  text: S.of(context).dropdownPaymentTitle,
                  hilightStyle: headline4BoldStyle?.merge(
                    const TextStyle(color: blueColor),
                  ),
                  normalStyle: headline4LightStyle,
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 20)),
              SliverToBoxAdapter(
                child: StreamBuilder<DropdownPaymentPageState>(
                    stream: viewModel.state,
                    builder: (context, snapshot) {
                      if (snapshot.hasData == false) return Container();
                      return ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: GestureDetector(
                              onTap: () {
                                viewModel.updateState({
                                  DropdownPaymentPageStateFields.selectedValue:
                                      viewModel.payments[index].value
                                });
                              },
                              child: Row(
                                children: [
                                  Radio<String>(
                                    value: viewModel.payments[index].value,
                                    groupValue: snapshot.data!.selectedValue,
                                    onChanged: (value) {
                                      viewModel.updateState({
                                        DropdownPaymentPageStateFields
                                                .selectedValue:
                                            viewModel.payments[index].value
                                      });
                                    },
                                    activeColor: blueColor,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(viewModel.payments[index].icon),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    viewModel.payments[index].label,
                                    style: paragraph1RegularStyle,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: viewModel.payments.length,
                      );
                    }),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: double.infinity,
                      child: StreamBuilder<DropdownPaymentPageState>(
                          stream: viewModel.state,
                          builder: (context, snapshot) {
                            if (snapshot.hasData == false) return Container();
                            return ElevatedButton(
                              onPressed: (snapshot.data!.selectedValue.isEmpty)
                                  ? null
                                  : () {
                                      viewModel.submit();
                                    },
                              child: Text(
                                S.of(context).confirmButton,
                              ),
                            );
                          }),
                    ),
                  ),
                ),
              ),
              // const SliverPadding(padding: EdgeInsets.only(top: 32)),
            ],
          ),
        ),
      ),
    );
  }
}
