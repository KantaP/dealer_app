import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/features/dashboard/model/overview.st.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/di/overview.vm.dart';
import 'package:aconnec_1109_x/src/model/user_profile.m.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/annoucement_card.dart';
import 'package:aconnec_1109_x/src/widgets/service_card.dart';

class OverviewView extends CustomView<OverViewViewModel> {
  const OverviewView({required OverViewViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);
  @override
  _OverviewViewState createState() => _OverviewViewState(viewModel);
}

class _OverviewViewState extends ViewState<OverviewView, OverViewViewModel> {
  _OverviewViewState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
    viewModel.setContext(context);
  }

  @override
  void didPush() {
    super.didPush();

    viewModel.getCurrentUser();
  }

  @override
  void didPopNext() {
    super.didPopNext();
    viewModel.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width,
          minHeight: MediaQuery.of(context).size.height,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: homeGradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            // primary: false,
            // shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            slivers: [
              const SliverPadding(padding: EdgeInsets.only(top: 8)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: StreamBuilder<OverviewPageState>(
                      stream: viewModel.state,
                      builder: (context, snapshot) {
                        // if (snapshot.connectionState ==
                        //     ConnectionState.waiting) {
                        //   return Container();
                        // }
                        if (snapshot.hasData) {
                          return _buildUserProfileButton(snapshot.data!.user);
                        }
                        return Container();
                      },
                    ),
                  ),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 20)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: _buildAnnoucement(),
                  ),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 30)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: _buildNews(),
                  ),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 30)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: _buildServices(),
                  ),
                ),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 30)),
              // _buildPendingOrder(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserProfileButton(UserProfileModel userModel) {
    return InkWell(
      onTap: () {
        viewModel.gotoSideMenu();
      },
      child: Container(
        // width: 180,
        height: 50,
        decoration: BoxDecoration(
          color: userTagCardColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Assets.icons.user.image(fit: BoxFit.fill, width: 38, height: 38),
            SizedBox(
              width: 85,
              child: Text(
                userModel.username,
                style: textInButtonStyle?.copyWith(color: whiteColor),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Visibility(
              visible: userModel.kycLevel == 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Image.asset(
                  (userModel.kycLevel == 1)
                      ? AssetIcons.kycLevel1Verified
                      : AssetIcons.kycLevel2Verified,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAnnoucement() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          S.of(context).homeSectionAnnoucement,
          style: paragraph2Style?.copyWith(color: whiteColor),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 160,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return AnnoucementCard(
                image: Image.asset(
                  AssetImages.mockAnnoucement,
                  width: 342,
                  height: 160,
                  fit: BoxFit.fill,
                ),
                onTap: () {},
              );
            },
            itemCount: 2,
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }

  Widget _buildNews() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          S.of(context).homeSectionNews,
          style: headline4LightStyle?.copyWith(color: whiteColor),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 160,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return AnnoucementCard(
                image: Image.asset(
                  AssetImages.mockAnnoucement,
                  width: 342,
                  height: 160,
                  fit: BoxFit.fill,
                ),
                onTap: () {},
              );
            },
            itemCount: 2,
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }

  Widget _buildServices() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          S.of(context).homeSectionServices,
          style: headline4LightStyle?.copyWith(color: whiteColor),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: ServiceCard(
                  image: Image.asset(
                    AssetImages.mockAnnoucement,
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                  onTap: () {},
                ),
              );
            },
            itemCount: 2,
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}
