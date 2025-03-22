import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:flutter/material.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        appBar: const DefaultAppBar(
          title: 'ติดต่อเรา',
          centerTitle: true,
        ),
        bodyPadding: PaddingScreen.paddingLTR,
        safeAreaBottom: true,
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'บริษัท 1109 พรอส์เปอร์ จำกัด',
                  style: titleStyle,
                ),
                const SizedBox(
                  height: Spacing.spacing24,
                ),
                Flexible(
                  child: Text(
                    'มิตรทาวน์ ออฟฟิศ ทาวเวอร์ ชั้นที่ 26,\nห้องเลขที่ S26089, 944 ถนนพระราม4\nแขวงวังใหม่ เขตปทุมวัน กรุงเทพมหานคร 10330',
                    style: paragraph1RegularStyle,
                    overflow: TextOverflow.clip,
                  ),
                ),
                const SizedBox(
                  height: Spacing.spacing24,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(BorderRadiusSet.radius10),
                    border: Border.all(color: midGreyColor),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.spacing16,
                    vertical: Spacing.spacing6,
                  ),
                  child: Column(
                    children: [
                      _buildRowItem(
                        icon: Assets.vectorIcons.contactPhone.svg(),
                        text: '+66 66 110 1109',
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: Spacing.spacing6),
                        child: Divider(
                          color: midGreyColor,
                        ),
                      ),
                      _buildRowItem(
                        icon: Assets.vectorIcons.contactEmail.svg(),
                        text: 'support@1109x.net',
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: Spacing.spacing6),
                        child: Divider(
                          color: midGreyColor,
                        ),
                      ),
                      _buildRowItem(
                        icon: Assets.vectorIcons.contactLine.svg(),
                        text: '@1109x',
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: Spacing.spacing6),
                        child: Divider(
                          color: midGreyColor,
                        ),
                      ),
                      _buildRowItem(
                        icon: Assets.vectorIcons.contactWeb.svg(),
                        text: 'www.1109x.com',
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
        physics: const NeverScrollableScrollPhysics(),
        extendBody: true);
  }

  Widget _buildRowItem({required Widget icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Spacing.spacing10),
      child: Row(
        children: [
          icon,
          const SizedBox(
            width: Spacing.spacing10,
          ),
          Text(
            text,
            style: paragraph1RegularStyle,
          )
        ],
      ),
    );
  }
}
