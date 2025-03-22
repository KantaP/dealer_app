import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/features/dashboard/model/side_menu_model.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model_new.abs.dart';
import 'package:injectable/injectable.dart';

@singleton
class SettingSubmenuVieWModel extends CustomViewModel {
  final List<SideSubmenuModel> menus = <SideSubmenuModel>[
    SideSubmenuModel(
        text: S.current.userBankAccountSubMenuLabel,
        onPress: () {
          NavigationService.toNamed(RoutesConstant.userBankAccount);
        })
  ];

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void updateState(updateValue) {
    // TODO: implement updateState
  }
}
