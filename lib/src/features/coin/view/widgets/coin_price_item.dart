import 'package:aconnec_1109_x/src/constants/firebase_storage.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/features/coin/bindings/coin.binding.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/exchange_token_arguments.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_listing/listing_list.m.dart';
import 'package:aconnec_1109_x/src/model/realtime_database/coin_price.m.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/extension.dart';
import 'package:aconnec_1109_x/src/widgets/custom_future.dart';
import 'package:aconnec_1109_x/src/widgets/custom_steam_builder.dart';
import 'package:aconnec_1109_x/src/widgets/loading/placeholder.dart';
import 'package:aconnec_1109_x/src/widgets/storage_image.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class CoinPriceItem extends StatelessWidget {
  const CoinPriceItem({super.key, required this.data});

  final CoinModel data;

  @override
  Widget build(BuildContext context) {
    final coinService = CoinBinding.coinService;
    return CustomFuture(
      future: coinService.getCoinPrice(data.idListing),
      customLoading:
          const ContentPlaceholder(lineType: ContentLineType.twoLines),
      customError: const Center(
        child: Text('Not found coin data'),
      ),
      builder: (_, snapshot) => InkWell(
        onTap: () {
          NavigationService.toNamed(
            RoutesConstant.buyGToken,
            arguments: ExchangeTokenArguments(
              coinData: data,
              coinPrice: snapshot.data!,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Spacing.spacing10),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(32),
                      child: SizedBox(
                        height: 32,
                        width: 32,
                        child: StorageImage(
                            storagePath: FirebaseStorageValue.coinRef,
                            fileName:
                                '${data.getBaseSymbol().toUpperCase()}.png'),
                      ),
                    ),
                    const SizedBox(
                      width: Spacing.spacing10,
                    ),
                    Text(
                      data.getBaseSymbol(),
                      style: paragraph2Style,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CoinBuyPrice(coinId: data.idListing),
              ),
              Expanded(
                child: CoinSellPrice(coinId: data.idListing),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CoinBuyPrice extends StatelessWidget {
  const CoinBuyPrice({super.key, required this.coinId});

  final int coinId;

  @override
  Widget build(BuildContext context) {
    final coinService = CoinBinding.coinService;
    return CustomStreamBuilder<DatabaseEvent>(
      stream: coinService.onCoinData(coinId),
      builder: (context, snapshot) {
        if (snapshot.data!.snapshot.value == null) {
          return Text(
            '0.00',
            style: paragraph2Style?.copyWith(
                color: greenColor, overflow: TextOverflow.ellipsis),
            textAlign: TextAlign.end,
          );
        }
        final coinPriceData = CoinPriceModel.fromJson(
          Map<String, dynamic>.from(snapshot.data!.snapshot.value as dynamic),
        );
        return Text(
          coinPriceData.getBuyValue().toCurrency(),
          style: paragraph2Style?.copyWith(
              color: greenColor, overflow: TextOverflow.ellipsis),
          textAlign: TextAlign.end,
          overflow: TextOverflow.ellipsis,
        );
      },
    );
  }
}

class CoinSellPrice extends StatelessWidget {
  const CoinSellPrice({super.key, required this.coinId});

  final int coinId;

  @override
  Widget build(BuildContext context) {
    final coinService = CoinBinding.coinService;
    return CustomStreamBuilder<DatabaseEvent>(
      stream: coinService.onCoinData(coinId),
      builder: (context, snapshot) {
        if (snapshot.data!.snapshot.value == null) {
          return Text(
            '0.00',
            style: paragraph2Style?.copyWith(
                color: redColor, overflow: TextOverflow.ellipsis),
            textAlign: TextAlign.end,
          );
        }
        final coinPriceData = CoinPriceModel.fromJson(Map<String, dynamic>.from(
            snapshot.data!.snapshot.value as dynamic));
        return Text(
          coinPriceData.getSellValue().toCurrency(),
          style: paragraph2Style?.copyWith(
              color: redColor, overflow: TextOverflow.ellipsis),
          textAlign: TextAlign.end,
        );
      },
    );
  }
}

class CoinPrice extends StatelessWidget {
  const CoinPrice({super.key, required this.buyPrice, required this.sellPrice});

  final double buyPrice;
  final double sellPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '301.7 GASTH',
          style: paragraph1RegularStyle?.copyWith(color: blueColor),
        ),
        Text(
          '~ ฿ 301.7',
          style: regular11Text?.copyWith(color: darkGreyColor),
        )
      ],
    );
  }
}

class PriceStatus extends StatelessWidget {
  const PriceStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: greenColor),
      padding: const EdgeInsets.symmetric(
          horizontal: Spacing.spacing10, vertical: 5),
      child: Text(
        '+0.60%',
        style: paragraph2Style?.copyWith(color: whiteColor),
      ),
    );
  }
}
