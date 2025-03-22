import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/features/dashboard/bindings/dasboard.binding.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/widgets/sub_menu_item.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:flutter/material.dart';

//translate later

class SettingSubmenuView extends StatelessWidget {
  const SettingSubmenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = DashboardBinding.settingSubmenuViewModel;

    return DefaultLayout(
        appBar: const DefaultAppBar(
          title: 'ตั้งค่า',
          centerTitle: true,
        ),
        bgColor: lightGrey1Color,
        slivers: [
          SliverToBoxAdapter(
            child: _buildColumnList(),
          )
        ],
        physics: const NeverScrollableScrollPhysics(),
        extendBody: true);
  }

  Widget _buildColumnList() {
    final viewModel = DashboardBinding.settingSubmenuViewModel;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(Spacing.spacing24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          viewModel.menus.length,
          (index) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SubMenuItem(
                text: viewModel.menus[index].text,
                onPress: viewModel.menus[index].onPress,
              ),
              (index < (viewModel.menus.length - 1))
                  ? const Padding(
                      padding: EdgeInsets.symmetric(vertical: Spacing.spacing6),
                      child: Divider(
                        color: midGreyColor,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
