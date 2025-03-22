import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/features/coin/bindings/coin.binding.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/extension.dart';
import 'package:aconnec_1109_x/src/widgets/custom_steam_builder.dart';
import 'package:flutter/material.dart';

enum CoinFilter {
  all,
  crypto,
  token,
}

class CoinFilterList extends StatelessWidget {
  const CoinFilterList({super.key});

  @override
  Widget build(BuildContext context) {
    final coinService = CoinBinding.coinService;
    return Row(
      children: [
        InkWell(
          onTap: () {
            coinService.setFilter(CoinFilter.all.name);
          },
          child: CustomStreamBuilder(
            stream: coinService.filterSubject.state(),
            builder: (_, snapshot) => CoinFilterItem(
              title: S.current.all,
              isActive: snapshot.data == CoinFilter.all.name,
            ),
          ),
        ),
        const SizedBox(
          width: Spacing.spacing10,
        ),
        InkWell(
          onTap: () {
            coinService.setFilter(CoinFilter.crypto.name);
          },
          child: CustomStreamBuilder(
            stream: coinService.filterSubject.state(),
            builder: (_, snapshot) => CoinFilterItem(
              title: S.current.crypto,
              isActive: snapshot.data == CoinFilter.crypto.name,
            ),
          ),
        ),
        const SizedBox(
          width: Spacing.spacing10,
        ),
        InkWell(
          onTap: () {
            coinService.setFilter(CoinFilter.token.name);
          },
          child: CustomStreamBuilder(
            stream: coinService.filterSubject.state(),
            builder: (_, snapshot) => CoinFilterItem(
              title: S.current.token,
              isActive: snapshot.data == CoinFilter.token.name,
            ),
          ),
        )
      ],
    );
  }
}

class CoinFilterItem extends StatelessWidget {
  const CoinFilterItem(
      {super.key, required this.title, required this.isActive});

  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: isActive ? blueColor : blueColor.withOpacity(0.1),
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: Spacing.spacing10, vertical: 5),
      child: Text(
        title,
        style:
            paragraph2Style?.copyWith(color: isActive ? whiteColor : blueColor),
      ),
    );
  }
}
