import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/features/coin/bindings/coin.binding.dart';
import 'package:aconnec_1109_x/src/features/coin/view/widgets/coin_filter_groupbox.dart';
import 'package:aconnec_1109_x/src/features/coin/view/widgets/coin_price_item.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_listing/listing_list.m.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/custom_future.dart';
import 'package:aconnec_1109_x/src/widgets/custom_steam_builder.dart';
import 'package:aconnec_1109_x/src/widgets/loading/placeholder.dart';
import 'package:flutter/material.dart';

class CoinPriceList extends StatefulWidget {
  const CoinPriceList(
      {super.key,
      this.canRefresh = true,
      this.canScroll = true,
      this.wrapContent = false});

  final bool canRefresh;
  final bool canScroll;
  final bool wrapContent;

  @override
  State<CoinPriceList> createState() => _CoinPriceListState();
}

class _CoinPriceListState extends State<CoinPriceList> {
  @override
  Widget build(BuildContext context) {
    final coinService = CoinBinding.coinService;
    return Container(
      padding: const EdgeInsets.all(Spacing.spacing20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BorderRadiusSet.radius20),
        color: whiteColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CoinFilterGroupBox(),
          const SizedBox(
            height: Spacing.spacing20,
          ),
          _buildColumnTitle(),
          const SizedBox(
            height: Spacing.spacing20,
          ),
          CustomStreamBuilder(
            stream: coinService.filterSubject.state(),
            builder: (_, streamData) => CustomFuture(
              future: coinService.coinList(
                RequestListingListModel(
                  cointype: coinFilterGroupsValue[streamData.data],
                ),
              ),
              customLoading: Column(
                children: List.generate(
                  5,
                  (index) => const Padding(
                    padding: EdgeInsets.symmetric(vertical: Spacing.spacing8),
                    child: ContentPlaceholder(
                        lineType: ContentLineType.threeLines),
                  ),
                ),
              ),
              customError: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        setState(() {});
                      },
                      child: const Icon(Icons.refresh)),
                  Text(
                    'Please try again.',
                    style: paragraph2Style,
                  )
                ],
              ),
              builder: (_, snapshot) => (widget.canRefresh)
                  ? RefreshIndicator(
                      key: UniqueKey(),
                      onRefresh: () async {
                        return setState(() {});
                      },
                      child: _buildItemList(snapshot.data),
                    )
                  : _buildItemList(snapshot.data),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemList(ResponseListingListModel? snapshot) {
    if (widget.wrapContent) {
      return snapshot!.rows.length > 0
          ? SingleChildScrollView(
              physics: (widget.canScroll)
                  ? const BouncingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  snapshot.rows.length,
                  (index) => Container(
                    decoration: const BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: lightGrey1Color))),
                    padding:
                        EdgeInsets.only(bottom: 15, top: (index == 0) ? 0 : 15),
                    child: CoinPriceItem(data: snapshot!.rows[index]),
                  ),
                ),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  color: lightGrey2Color,
                  borderRadius:
                      BorderRadius.circular(BorderRadiusSet.radius10)),
              padding: const EdgeInsets.symmetric(
                  horizontal: Spacing.spacing10, vertical: 5),
              child: Center(
                child: SizedBox(
                  height: 24,
                  child: Text(
                    S.current.coinEmptyWarning,
                    style: textInButtonStyle?.copyWith(color: darkGreyColor),
                  ),
                ),
              ),
            );
    }
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: (widget.canScroll)
          ? const BouncingScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) {
        return Container(
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: lightGrey1Color))),
          padding: EdgeInsets.only(bottom: 15, top: (index == 0) ? 0 : 15),
          child: CoinPriceItem(data: snapshot!.rows[index]),
        );
      },
      itemCount: snapshot?.rows.length ?? 0,
    );
  }

  Widget _buildColumnTitle() {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            child: Text(
              S.current.coin,
              style:
                  paragraph3Style?.copyWith(color: blackColor.withOpacity(0.3)),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            child: Text(
              S.current.buyPrice,
              style:
                  paragraph3Style?.copyWith(color: blackColor.withOpacity(0.3)),
              textAlign: TextAlign.end,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            child: Text(
              S.current.sellPrice,
              style:
                  paragraph3Style?.copyWith(color: blackColor.withOpacity(0.3)),
              textAlign: TextAlign.end,
            ),
          ),
        )
      ],
    );
  }
}
