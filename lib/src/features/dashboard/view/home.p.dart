import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/features/coin/view/widgets/coin_price_list.dart';
import 'package:aconnec_1109_x/src/features/dashboard/bindings/dasboard.binding.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/widgets/home_app_bar.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/widgets/sign_in_section.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/modals/view/kyc_approve_modal_bottom_sheet.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:aconnec_1109_x/src/widgets/slide_banner.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/translate/generated/l10n.dart';
import '../../../theme/custom_theme.dart';
import '../../../widgets/annoucement_card.dart';
import '../../coin/view/widgets/coin_filter.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = DashboardBinding.homeViewModel;
    vm.checkKyc();

    return DefaultLayout(
      bodyPadding: const EdgeInsets.all(Spacing.spacing16),
      bgColor: lightGrey1Color,
      appBar: const HomeAppBar(),
      slivers: [
        const SliverToBoxAdapter(
          child: SizedBox(height: Spacing.spacing16),
        ),
        const SliverToBoxAdapter(child: const SignInSection()),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 153,
            child: SlideBanner(
              imgList: [
                Assets.images.banner1.path,
                Assets.images.banner2.path,
              ],
              onPressItems: [
                () => {vm.open1109xUrlClosedBeta()},
                () => {}
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: Spacing.spacing16,
          ),
        ),
        // SliverToBoxAdapter(
        //   child: CoinFilterList(),
        // ),
        // SliverToBoxAdapter(
        //   child: SizedBox(
        //     height: Spacing.spacing20,
        //   ),
        // ),
        const SliverToBoxAdapter(
          child: CoinPriceList(
            canRefresh: false,
            canScroll: false,
            wrapContent: true,
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: Spacing.spacing20,
          ),
        )
      ],
      physics: BouncingScrollPhysics(),
      extendBody: true,
    );
  }

  Widget _buildAnnoucement() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
}
