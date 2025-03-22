import 'dart:math';

import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/custom_future.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';

Future showFatcaDocumentModalBottomSheet(BuildContext context) {
  return showCupertinoModalPopup(
    context: context,
    builder: (_) => const FatcaDocument(),
  );
}

class FatcaDocument extends StatelessWidget {
  const FatcaDocument({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appBar: const DefaultAppBar(title: 'รายละเอียดข้อตกลงและเงื่อนไข'),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(Spacing.spacing24),
                child: CustomFuture<String>(
                  future: loadKycTerm(),
                  customLoading: Container(),
                  builder: (_, snapshot) {
                    return Text(snapshot.data ?? '');
                  },
                ),
              ),
              SizedBox(
                height: paddingBottom(),
              )
            ],
          ),
        ),
      ],
      physics: const BouncingScrollPhysics(),
    );
  }

  Future<String> loadKycTerm() async {
    final txt = await rootBundle.loadString(Assets.documents.fatca);
    return txt;
  }
}
