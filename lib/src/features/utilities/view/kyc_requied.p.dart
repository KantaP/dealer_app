import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:flutter/material.dart';

class KycRequiredScreen extends StatelessWidget {
  const KycRequiredScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      safeAreaTop: true,
      safeAreaBottom: true,
      bodyPadding: PaddingScreen.paddingLTR,
      slivers: [
        SliverFillRemaining(
          child: Column(
            children: [
              const SizedBox(
                height: Spacing.spacing40,
              ),
              Assets.images.kycNotSuccess.image(),
              const SizedBox(
                height: Spacing.spacing20,
              ),
              Text(
                'จำเป็นต้องยืนยันตัวตนให้สำเร็จ',
                style: headline4Style,
              ),
              const SizedBox(
                height: Spacing.spacing32,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Spacing.spacing20),
                child: Text(
                  'กรุณายืนยันตัวตนผ่านโมบายแอปพลิเคชั่น\nเพื่อเข้าถึงการใช้งานนี้',
                  style: paragraph1LightStyle?.copyWith(
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          NavigationService.toReplacementWithNamed(
                              RoutesConstant.kycAll);
                        },
                        child: Text('ยืนยันตัวตน')),
                    SizedBox(
                      height: Spacing.spacing10,
                    ),
                    TextButton(
                      style: elevatedTransparentButton,
                      onPressed: () {
                        NavigationService.back(NavigationResult(null));
                      },
                      child: Text(
                        'ไม่ใช่ตอนนี้',
                        style: textInButtonStyle?.copyWith(color: blackColor),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
