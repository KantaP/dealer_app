import 'package:aconnec_1109_x/src/constants/border_radius.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/features/dashboard/bindings/dasboard.binding.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:flutter/material.dart';

import '../../../constants/spacing.dart';

class ReportProblemViewScreen extends StatelessWidget {
  const ReportProblemViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = DashboardBinding.reportProblemViewModel;
    return DefaultLayout(
      appBar: const DefaultAppBar(
        title: '',
      ),
      bodyPadding: PaddingScreen.paddingLTR,
      safeAreaBottom: true,
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HilightText(
                text: 'ช่องทางในการ\n%แจ้งเบาะแส/ข้อร้องเรียน%',
                hilightStyle: headline4LightStyle,
                normalStyle: headline4LightStyle,
              ),
              const SizedBox(
                height: Spacing.spacing24,
              ),
              Text(
                'การแจ้งเบาะแสและข้อร้องเรียน (Whistleblowing) หมายถึง การที่ลูกค้าหรือบุคคลภายนอกต้องการแจ้งข้อมูลเกี่ยวกับการกระทำผิดกฎหมาย กฎระเบียบ และจรรยาบรรณ หรือพฤติกรรมที่อาจส่อถึงการทุจริตคอร์รัปชันของบุคลากรภายในบริษัทฯ สามารถแจ้งเบาะแส และข้อร้องเรียนผ่านช่องทางที่บริษัทฯ กำหนด',
                style: paragraph1RegularStyle,
              ),
              const SizedBox(
                height: Spacing.spacing24,
              ),
              Text(
                'ขอบเขตของการแจ้งเบาะแส/ข้อร้องเรียน',
                style: titleStyle,
              ),
              const SizedBox(
                height: Spacing.spacing24,
              ),
              Text(
                'เมื่อมีข้อสงสัยหรือเชื่อว่ามีเหตุอันควรเชื่อโดยสุจริตว่ามีการกระทำที่ไม่สุจริตหรือไม่โปร่งใส และมีการฝ่าฝืนหลักปฏิบัติของบริษัท ในเรื่องดังต่อไปนี้\n1.การฝ่าฝืนไม่ปฏิบัติตามนโยบายหรือกฎหมาย\n2.การทุจริตต่อหน้าที่หรือทำให้เกิดความเสียหายแก่บริษัทฯ\n3.การร้องเรียนมาตรฐานบริการ',
                style: paragraph1RegularStyle,
              ),
              const SizedBox(
                height: Spacing.spacing24,
              ),
              // Container(
              //   decoration: BoxDecoration(
              //       borderRadius:
              //           BorderRadius.circular(BorderRadiusSet.radius10),
              //       border: Border.all(color: midGreyColor)),
              //   padding: const EdgeInsets.symmetric(
              //       vertical: Spacing.spacing10, horizontal: Spacing.spacing16),
              //   child: Row(
              //     children: [
              //       Assets.vectorIcons.email.svg(),
              //       const SizedBox(
              //         width: Spacing.spacing16,
              //       ),
              //       Text(
              //         'complaint@1109x.net',
              //         style: paragraph1RegularStyle,
              //       )
              //     ],
              //   ),
              // )
              ElevatedButton(
                onPressed: () {
                  viewModel.goToReportPage();
                },
                child: Text('ตั๋วคำร้อง'),
              )
            ],
          ),
        )
      ],
      extendBody: true,
      physics: const BouncingScrollPhysics(),
    );
  }
}
