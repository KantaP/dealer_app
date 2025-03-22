import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/banks.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/select_bank.st.dart';
import 'package:aconnec_1109_x/src/features/utilities/view/di/select_bank.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';

class SelectBankView extends CustomView<SelectBankViewModel> {
  const SelectBankView({required SelectBankViewModel viewModel, super.key})
      : super.model(viewModel);

  @override
  ViewState<SelectBankView, SelectBankViewModel> createState() =>
      _SelectBankViewState(viewModel);
}

class _SelectBankViewState
    extends ViewState<SelectBankView, SelectBankViewModel> {
  _SelectBankViewState(super.viewModel);

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
      SelectBankPageStateFields.onSelect:
          arguments[SelectBankPageStateFields.onSelect],
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
                  text: S.of(context).selectBankTitle,
                  hilightStyle: headline4BoldStyle?.merge(
                    const TextStyle(color: blueColor),
                  ),
                  normalStyle: headline4LightStyle,
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 20)),
              // SliverToBoxAdapter(
              //   child: Wrap(
              //     alignment: WrapAlignment.spaceAround,
              //     runAlignment: WrapAlignment.center,
              //     spacing: Spacing.spacing10,
              //     runSpacing: Spacing.spacing10,
              //     children:
              //         BankData.bankList.map((e) => _buildBankItem(e)).toList(),
              //   ),
              // ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 500,
                        child: GridView.builder(
                          primary: false,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, // แสดง 3 คอลัมน์
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return _buildBankItem(BankData.bankList[index]);
                          },
                          itemCount: BankData.bankList.length,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: StreamBuilder<SelectBankPageState>(
                          stream: viewModel.state,
                          builder: (context, snapshot) {
                            return ElevatedButton(
                              onPressed: (snapshot.data?.selectedCode != '')
                                  ? () {
                                      viewModel.submit();
                                    }
                                  : null,
                              child: Text(S.of(context).selectButton),
                            );
                          }),
                    )
                  ],
                ),
              )
              // SliverFillRemaining(
              //   hasScrollBody: false,
              //   child: Column(
              //     mainAxisSize: MainAxisSize.min,
              //     children: [
              //       GridView.builder(
              //         shrinkWrap: true,
              //         gridDelegate:
              //             const SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisCount: 3, // แสดง 3 คอลัมน์
              //         ),
              //         itemBuilder: (BuildContext context, int index) {
              //           return _buildBankItem(BankData.bankList[index]);
              //         },
              //         itemCount: BankData.bankList.length,
              //       ),
              //       // Padding(
              //       //   padding: const EdgeInsets.only(bottom: 32.0),
              //       //   child: Align(
              //       //     alignment: Alignment.bottomCenter,
              //       //     child: SizedBox(
              //       //       width: double.infinity,
              //       //       child: StreamBuilder<SelectBankPageState>(
              //       //           stream: viewModel.state,
              //       //           builder: (context, snapshot) {
              //       //             return ElevatedButton(
              //       //               onPressed: (snapshot.data?.selectedCode != '')
              //       //                   ? () {
              //       //                       viewModel.submit();
              //       //                     }
              //       //                   : null,
              //       //               child: Text(S.of(context).selectButton),
              //       //             );
              //       //           }),
              //       //     ),
              //       //   ),
              //       // )
              //     ],
              //   ),
              // ),
              // const SliverPadding(padding: EdgeInsets.only(top: 30)),

              // const SliverPadding(padding: EdgeInsets.only(top: 32)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBankItem(BankItemModel value) {
    return GestureDetector(
      onTap: () {
        viewModel.selectItem(value.code);
      },
      child: StreamBuilder<SelectBankPageState>(
        stream: viewModel.state,
        builder: (context, snapshot) {
          return Container(
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: (snapshot.data?.selectedCode == value.code)
                  ? blueColor.withOpacity(0.25)
                  : null,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(value.image),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    child: Text(
                      value.code.toUpperCase(),
                      style: paragraph1RegularStyle,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
