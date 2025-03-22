import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/features/authenticate/model/set_pin.st.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/di/set_pin.vm.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/widgets/input_pin.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/widgets/num_pad.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:flutter/widgets.dart';

class SetPinPage extends CustomView<SetPinViewModel> {
  const SetPinPage({required SetPinViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _SetPinPageState createState() => _SetPinPageState(viewModel);
}

class _SetPinPageState extends ViewState<SetPinPage, SetPinViewModel> {
  _SetPinPageState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
    viewModel.listenState();
    viewModel.listenFirebaseDB();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultLayout(
          statusBarColor: whiteColor,
          appBar: StreamBuilder<SetPinState>(
            stream: viewModel.state,
            builder: (context, snapshot) {
              if (snapshot.hasData == false) return const SliverAppBar();
              return DefaultAppBar(
                centerTitle: true,
                automaticallyImplyLeading: false,
                title: (snapshot.data!.pinAlready)
                    ? S.of(context).confirmSetPinTitle
                    : S.of(context).setPinTitle,
              );
            },
          ),
          slivers: [
            SliverFillRemaining(
              child: _buildLayout(),
            )
          ],
          physics: const NeverScrollableScrollPhysics(),
          extendBody: true,
        ),
        StreamBuilder<SetPinPageState>(
          stream: viewModel.pageState,
          builder: (context, snapshot) {
            if (snapshot.hasData == false) return Container();
            return Visibility(
                visible: snapshot.data?.isLoading ?? false,
                child: const Loading());
          },
        ),
      ],
    );
  }

  Widget _buildLayout() {
    return Padding(
      padding: const EdgeInsets.only(top: Spacing.spacing40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Expanded(flex: 0, child: _widgetContent()),

          SizedBox(height: 100, child: _widgetInputPin()),
          const SizedBox(
            height: 80,
          ),
          _widgetNumPads(),
        ],
      ),
    );
  }

  Widget _widgetContent() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: StreamBuilder(
            stream: viewModel.state,
            builder: (context, AsyncSnapshot<SetPinState> value) {
              if (value.hasData) {
                final pinAlready = value.data?.pinAlready ?? false;
                return Text(
                  (pinAlready == false)
                      ? S.of(context).setPinHeadline
                      : S.of(context).confirmPinHeadline,
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }
              return const Text('');
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.70,
            child: StreamBuilder<SetPinState>(
              stream: viewModel.state,
              builder: (context, value) {
                if (value.hasData) {
                  final pinAlready = value.data?.pinAlready ?? false;
                  return Text(
                    (pinAlready == false)
                        ? S.of(context).setPinContent
                        : S.of(context).confirmPinContent,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                    softWrap: true,
                  );
                }
                return const Text('');
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _widgetInputPin() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        StreamBuilder(
          stream: viewModel.state,
          builder: (context, AsyncSnapshot<SetPinState> value) {
            final pinAlready = value.data?.pinAlready ?? false;
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 18,
                  width: 18,
                  child: InputPin(
                    pinText: (pinAlready == false)
                        ? value.data?.getPinIndex(0) ?? ''
                        : value.data?.getConfirmPinIndex(0) ?? '',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: SizedBox(
                    height: 18,
                    width: 18,
                    child: InputPin(
                      pinText: (pinAlready == false)
                          ? value.data?.getPinIndex(1) ?? ''
                          : value.data?.getConfirmPinIndex(1) ?? '',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: SizedBox(
                    height: 18,
                    width: 18,
                    child: InputPin(
                      pinText: (pinAlready == false)
                          ? value.data?.getPinIndex(2) ?? ''
                          : value.data?.getConfirmPinIndex(2) ?? '',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: SizedBox(
                    height: 18,
                    width: 18,
                    child: InputPin(
                      pinText: (pinAlready == false)
                          ? value.data?.getPinIndex(3) ?? ''
                          : value.data?.getConfirmPinIndex(3) ?? '',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: SizedBox(
                    height: 18,
                    width: 18,
                    child: InputPin(
                      pinText: (pinAlready == false)
                          ? value.data?.getPinIndex(4) ?? ''
                          : value.data?.getConfirmPinIndex(4) ?? '',
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                  width: 18,
                  child: InputPin(
                    pinText: (pinAlready == false)
                        ? value.data?.getPinIndex(5) ?? ''
                        : value.data?.getConfirmPinIndex(5) ?? '',
                  ),
                ),
              ],
            );
          },
        ),
        StreamBuilder<SetPinState>(
          stream: viewModel.state,
          builder: (context, snapshot) {
            bool confirmPinAlready = snapshot.data?.confirmPinAlready ?? false;
            bool pinAlready = snapshot.data?.pinAlready ?? false;
            bool pinAllMatch = snapshot.data?.pinAllMatch ?? false;
            if (snapshot.hasData == false) return Container();
            return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Visibility(
                visible: confirmPinAlready && pinAlready && !pinAllMatch,
                child: Text(
                  S.of(context).setPinNotMatch,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.merge(const TextStyle(color: redColor)),
                ),
              ),
            );
          },
        ),
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
}
