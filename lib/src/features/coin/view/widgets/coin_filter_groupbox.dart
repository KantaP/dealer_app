import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/features/coin/bindings/coin.binding.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/extension.dart';
import 'package:aconnec_1109_x/src/widgets/custom_steam_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum CoinFilterGroup {
  newListing,
  crypto,
  token,
}

const Map<String, dynamic> coinFilterGroupsValue = {
  'newListing': 'new',
  'crypto': 'crypto',
  'token': 'token'
};

class CoinFilterGroupBox extends StatefulWidget {
  const CoinFilterGroupBox({super.key});

  @override
  State<CoinFilterGroupBox> createState() => _CoinFilterGroupBoxState();
}

class _CoinFilterGroupBoxState extends State<CoinFilterGroupBox> {
  final coinService = CoinBinding.coinService;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: lightGrey1Color,
      ),
      padding: EdgeInsets.all(5),
      child: SizedBox(
        // height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: _buildGroupItem(CoinFilterGroup.crypto.name),
            ),
            Expanded(
              child: _buildGroupItem(CoinFilterGroup.token.name),
            ),
            Expanded(
              child: _buildGroupItem(CoinFilterGroup.newListing.name),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGroupItem(String groupName) {
    return GestureDetector(
      onTap: () {
        coinService.setFilter(groupName);
      },
      child: CustomStreamBuilder(
        stream: coinService.filterSubject.state(),
        builder: (_, snapshot) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
                (snapshot.data == groupName) ? blueColor : Colors.transparent,
          ),
          child: Center(
            child: Text(
              getFilterGroupName(groupName),
              style: paragraph2Style?.copyWith(
                  color: snapshot.data == groupName ? whiteColor : blackColor),
            ),
          ),
        ),
      ),
    );
  }

  String getFilterGroupName(String groupName) {
    switch (groupName) {
      case 'crypto':
        return S.current.crypto;
      case 'token':
        return S.current.token;
      case 'newListing':
        return S.current.newListing;
      default:
        return '';
    }
  }
}
