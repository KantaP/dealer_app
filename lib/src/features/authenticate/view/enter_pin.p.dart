import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/features/authenticate/model/enter_pin.st.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/di/enter_pin.vm.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/widgets/input_pin.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/widgets/num_pad.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/custom_close_button.dart';
import 'package:aconnec_1109_x/src/widgets/loading.dart';
import 'package:flutter/widgets.dart';

class EnterPinView extends CustomView<EnterPinViewModel> {
  const EnterPinView({required EnterPinViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _EnterPinViewState createState() => _EnterPinViewState(viewModel);
}

class _EnterPinViewState extends ViewState<EnterPinView, EnterPinViewModel> {
  _EnterPinViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
    viewModel.listenState();
  }

  @override
  void didPush() {
    super.didPush();
    final settings = ModalRoute.of(context)?.settings;
    final arguments = settings?.arguments as Map<String, dynamic>? ?? {};
    viewModel.updateState(
      <String, dynamic>{
        EnterPinPageStateFields.onCustomSubmit:
            arguments[EnterPinPageStateFields.onCustomSubmit],
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultLayout(
          appBar: DefaultAppBar(
            automaticallyImplyLeading: false,
            title: S.of(context).enterPinTitle,
            centerTitle: true,
          ),
          slivers: [
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Expanded(flex: 0, child: _widgetContent()),

                    SizedBox(
                      height: 100,
                      child: _widgetInputPin(),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    _widgetNumPads(),
                    Expanded(child: _widgetForgotPin()),
                  ],
                ),
              ),
            )
          ],
          physics: NeverScrollableScrollPhysics(),
        ),
        StreamBuilder<EnterPinPageState>(
          stream: viewModel.state,
          builder: (context, snapshot) {
            return Visibility(
              visible: snapshot.data?.isLoading ?? false,
              child: const Loading(),
            );
          },
        )
      ],
    );
  }

  Widget _widgetContent() {
    return Align(
      alignment: Alignment.center,
      child: Text(
        S.of(context).enterPinHeadline,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  Widget _widgetInputPin() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        StreamBuilder<EnterPinFormState>(
          stream: viewModel.formState,
          builder: (context, value) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 18,
                  width: 18,
                  child: InputPin(
                    pinText: value.data?.getPinIndex(0) ?? '',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: SizedBox(
                    height: 18,
                    width: 18,
                    child: InputPin(
                      pinText: value.data?.getPinIndex(1) ?? '',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: SizedBox(
                    height: 18,
                    width: 18,
                    child: InputPin(
                      pinText: value.data?.getPinIndex(2) ?? '',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: SizedBox(
                    height: 18,
                    width: 18,
                    child: InputPin(
                      pinText: value.data?.getPinIndex(3) ?? '',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: SizedBox(
                    height: 18,
                    width: 18,
                    child: InputPin(
                      pinText: value.data?.getPinIndex(4) ?? '',
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                  width: 18,
                  child: InputPin(
                    pinText: value.data?.getPinIndex(5) ?? '',
                  ),
                ),
              ],
            );
          },
        )
      ],
    );
  }

  Widget _widgetNumPads() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
      child: GridView.builder(
        primary: false,
        padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing22),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 20,
          mainAxisExtent: (MediaQuery.of(context).size.height * 0.1),
          mainAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          if (index == 9) {
            return Container();
          }
          if (index == 11) {
            return GestureDetector(
              onTap: () => viewModel.removePin(),
              child: Image.asset(AssetIcons.backStep),
            );
          }
          if (index == 10) {
            return NumPad(
              label: '0',
              onTap: () => viewModel.setPin('0'),
            );
          }
          return NumPad(
            label: '${index + 1}',
            onTap: () => viewModel.setPin('${index + 1}'),
          );
        },
        itemCount: 12,
      ),
    );
  }

  Widget _widgetForgotPin() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Center(
        child: InkWell(
          onTap: () {
            viewModel.forgotPin();
          },
          child: Text(
            S.of(context).enterPinForgotPinLinkLabel,
            style: paragraph1RegularStyle?.copyWith(
              color: blueColor,
              decoration: TextDecoration.underline,
              decorationColor: blueColor,
            ),
          ),
        ),
      ),
    );
  }
}
