import 'package:aconnec_1109_x/src/constants/border_radius.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/features/dashboard/bindings/dasboard.binding.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/custom_steam_builder.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        appBar: DefaultAppBar(
          title: 'การแจ้งเตือน',
          centerTitle: true,
        ),
        slivers: [
          FilterBar(),
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ยังไม่มีข้อความ',
                  style: titleStyle?.copyWith(color: midGreyColor),
                )
              ],
            ),
          )
        ],
        physics: NeverScrollableScrollPhysics());
  }
}

class FilterBar extends StatelessWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = DashboardBinding.notificationViewModel;
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      flexibleSpace: Container(
        margin: const EdgeInsets.symmetric(horizontal: Spacing.spacing20),
        height: 78,
        decoration: BoxDecoration(
          color: darkGreyColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(BorderRadiusSet.radius20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Spacing.spacing10),
          child: CustomStreamBuilder(
            stream: vm.filterSubject.subject,
            builder: (_, snapshot) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildSegementButton(
                  icon: (snapshot.data == 0)
                      ? Assets.vectorIcons.annouceActiveIcon.svg()
                      : Assets.vectorIcons.annouceIcon.svg(),
                  label: 'โปรโมชั่น',
                  active: snapshot.data == 0,
                  onTap: () {
                    vm.filterSubject.setValue(0);
                  },
                ),
                _buildSegementButton(
                  icon: (snapshot.data == 1)
                      ? Assets.vectorIcons.listActiveIcon.svg()
                      : Assets.vectorIcons.listIcon.svg(),
                  label: 'รายการ',
                  active: snapshot.data == 1,
                  onTap: () {
                    vm.filterSubject.setValue(1);
                  },
                ),
                _buildSegementButton(
                  icon: (snapshot.data == 2)
                      ? Assets.vectorIcons.warningActiveIcon.svg()
                      : Assets.vectorIcons.warningIcon.svg(),
                  label: 'แจ้งเตือน',
                  active: snapshot.data == 2,
                  onTap: () {
                    vm.filterSubject.setValue(2);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSegementButton({
    required Widget icon,
    required String label,
    bool active = false,
    required Function onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          decoration: BoxDecoration(
            color: (active) ? softBlue.withOpacity(0.1) : Colors.transparent,
            borderRadius: BorderRadius.circular(BorderRadiusSet.radius10),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon,
                const SizedBox(
                  height: Spacing.spacing6,
                ),
                Text(
                  label,
                  style: regular11Text?.copyWith(
                    color: (active) ? blueColor : darkGreyColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
