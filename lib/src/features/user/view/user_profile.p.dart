import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/features/user/bindings/user.binding.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/custom_future.dart';
import 'package:aconnec_1109_x/src/widgets/custom_label.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:aconnec_1109_x/src/widgets/loading.dart';
import 'package:aconnec_1109_x/src/widgets/loading/placeholder.dart';
import 'package:flutter/widgets.dart';

//translate later

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = UserBinding.userProfileViewModel;
    return DefaultLayout(
      appBar: const DefaultAppBar(
        title: 'ข้อมูลบัญชี',
        centerTitle: true,
      ),
      bodyPadding: PaddingScreen.paddingLTR,
      slivers: [
        SliverFillRemaining(
          child: CustomFuture(
            future: vm.loadProfile(),
            customLoading: const Column(
              children: [
                ContentPlaceholder(
                  lineType: ContentLineType.threeLines,
                ),
              ],
            ),
            builder: (_, snapshot) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // CustomLabel(
                //   label: 'ชื่อ-นามสกุล (ภาษาไทย)',
                //   text: snapshot.data!.fullNameTh,
                // ),
                // const SizedBox(
                //   height: Spacing.spacing24,
                // ),
                // CustomLabel(
                //   label: 'ชื่อ-นามสกุล (ภาษาอังกฤษ)',
                //   text: snapshot.data!.fullNameEng,
                // ),
                // const SizedBox(
                //   height: Spacing.spacing24,
                // ),
                CustomLabel(
                  label: 'เบอร์มือถือ',
                  text: snapshot.data!.mobilePhone,
                )
              ],
            ),
          ),
        )
      ],
      physics: const BouncingScrollPhysics(),
      extendBody: true,
    );
  }
}
