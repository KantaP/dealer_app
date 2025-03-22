import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/features/dashboard/model/request_form.arguments.dart';
import 'package:aconnec_1109_x/src/features/dashboard/model/side_menu_model.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model_new.abs.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@singleton
class OtherSubmenuViewModel extends CustomViewModel {
  @override
  void dispose() {}

  @override
  void updateState(updateValue) {}

  List<SideSubmenuModel> getMenus() {
    return <SideSubmenuModel>[
      SideSubmenuModel(
        text: S
            .of(NavigationService.navigatorKey.currentContext!)
            .termConditionSubMenuLabel,
        onPress: () {
          NavigationService.toNamed(
            RoutesConstant.requestForm,
            arguments: RequestFormArgumentsScreen(
                title: S
                    .of(NavigationService.navigatorKey.currentContext!)
                    .termConditionSubMenuLabel,
                formUrl: 'https://help.1109x.com/th/user-agreement'),
          );
        },
      ),
      SideSubmenuModel(
        text: S
            .of(NavigationService.navigatorKey.currentContext!)
            .privacyPolicySubMenuLabel,
        onPress: () {
          NavigationService.toNamed(
            RoutesConstant.requestForm,
            arguments: RequestFormArgumentsScreen(
                title: S
                    .of(NavigationService.navigatorKey.currentContext!)
                    .privacyPolicySubMenuLabel,
                formUrl: 'https://help.1109x.com/th/privacy-policy'),
          );
        },
      ),
      SideSubmenuModel(
        text: 'Version ${dotenv.env['APP_VERSION']}',
        onPress: null,
      ),
    ];
  }
}
