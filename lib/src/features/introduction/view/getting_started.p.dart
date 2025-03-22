import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/features/introduction/model/getting_started.st.dart';
import 'package:aconnec_1109_x/src/features/introduction/view/di/getting_started.vm.dart';
import 'package:aconnec_1109_x/src/features/introduction/view/widgets/info_one.dart';
import 'package:aconnec_1109_x/src/features/introduction/view/widgets/info_three.dart';
import 'package:aconnec_1109_x/src/features/introduction/view/widgets/info_two.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/pageview_navigator.dart';

class GettingStartedPage extends CustomView<GettingStartedViewModel> {
  const GettingStartedPage(
      {required GettingStartedViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _GettingStartedPageState createState() => _GettingStartedPageState(viewModel);
}

class _GettingStartedPageState
    extends ViewState<GettingStartedPage, GettingStartedViewModel> {
  _GettingStartedPageState(super.viewModel);

  final PageController _infoPage = PageController();
  final List<Widget> infos = [
    const InfoOne(),
    const InfoTwo(),
    const InfoThree(),
  ];

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: const DefaultAppBar(
        title: '',
      ),
      bodyPadding: PaddingScreen.paddingLTR,
      slivers: [
        SliverFillRemaining(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _pageImageBackground(),
              Expanded(
                // flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(top: kToolbarHeight),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40.0),
                        child: PageView(
                          controller: _infoPage,
                          onPageChanged: viewModel.onChangePage,
                          children: infos,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: _widgetPager(),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: Spacing.spacing40,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: _widgetButtonSubmit(),
              ),
              Align(
                alignment: Alignment.center,
                child: _skipButton(),
              ),
              SizedBox(
                height: paddingBottom(),
              ),
            ],
          ),
        ),
      ],
      physics: NeverScrollableScrollPhysics(),
    );
  }

  Widget _widgetButtonSubmit() {
    return StreamBuilder(
        stream: viewModel.state,
        builder: (context, AsyncSnapshot<GettingStartedState> value) {
          if (value.hasData) {
            if (value.data!.infoIndex < 2) {
              return OutlinedButton(
                onPressed: () {
                  _infoPage.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.linear);
                },
                child: Text(S.of(context).nextButton),
              );
            }
            return OutlinedButton(
              onPressed: () {
                viewModel.onTapGetStarted();
              },
              child: Text(S.of(context).gettingStartedInfoSubmit),
            );
          }
          return Container();
        });
  }

  Widget _widgetPager() {
    return StreamBuilder(
        stream: viewModel.state,
        builder: (context, AsyncSnapshot<GettingStartedState> value) {
          if (value.hasData) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PageViewNavigator(
                    active: (value.data?.infoIndex == 0) ? true : false),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: PageViewNavigator(
                      active: (value.data?.infoIndex == 1) ? true : false),
                ),
                PageViewNavigator(
                    active: (value.data?.infoIndex == 2) ? true : false),
              ],
            );
          }
          return Container();
        });
  }

  Widget _skipButton() {
    return StreamBuilder<GettingStartedState>(
        stream: viewModel.state,
        builder: (context, snapshot) {
          if (snapshot.data?.infoIndex == 2) return const Text(' ');
          return GestureDetector(
            onTap: () {
              _infoPage.jumpToPage(2);
            },
            child: Text(
              S.of(context).skip.replaceFirst(
                    S.of(context).skip[0],
                    S.of(context).skip[0].toUpperCase(),
                  ),
              style: textInButtonStyle,
            ),
          );
        });
  }

  Widget _pageImageBackground() {
    return StreamBuilder<GettingStartedState>(
        stream: viewModel.state,
        builder: (context, snapshot) {
          if (snapshot.data?.infoIndex == 1) {
            return Assets.svgImages.getting2.svg(height: 178);
          }
          if (snapshot.data?.infoIndex == 2) {
            return Assets.svgImages.getting3.svg(height: 178);
          }
          return Assets.svgImages.getting1.svg(height: 178);
        });
  }
}
