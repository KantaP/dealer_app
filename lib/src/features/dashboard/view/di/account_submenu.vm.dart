import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/features/dashboard/model/account_submenu.st.dart';
import 'package:aconnec_1109_x/src/features/dashboard/model/request_form.arguments.dart';
import 'package:aconnec_1109_x/src/features/dashboard/model/side_menu_model.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model_new.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@singleton
class AccountSubmenuViewModel extends CustomViewModel<AccountSubmenuPageState> {
  final _stateSubject = BehaviorSubject<AccountSubmenuPageState>.seeded(
      const AccountSubmenuPageState());
  Stream<AccountSubmenuPageState> get state => _stateSubject;

  final List<SideSubmenuModel> menus = <SideSubmenuModel>[
    SideSubmenuModel(
      text: S.current.accountInformationSubMenuLabel,
      onPress: () {
        NavigationService.toNamed(RoutesConstant.userProfile);
      },
    ),
    SideSubmenuModel(
      text: S.current.accountManageSubMenuLabel,
      onPress: () {
        NavigationService.toNamed(RoutesConstant.accountManageSubmenu);
      },
    ),
    SideSubmenuModel(
      text: S.current.financialAmountSubMenuLabel,
      onPress: () {
        NavigationService.toNamed(
          RoutesConstant.requestForm,
          arguments: RequestFormArgumentsScreen(
            title: S.current.financialAmountSubMenuLabel,
            formUrl: 'https://link.1109x.com/limit-credit',
            kycRequired: true,
          ),
        );
      },
    ),
    SideSubmenuModel(
      text: S.current.personalInformationSubMenuLabel,
      onPress: () {
        NavigationService.toNamed(
          RoutesConstant.requestForm,
          arguments: RequestFormArgumentsScreen(
            title: S.current.personalInformationSubMenuLabel,
            formUrl: 'https://link.1109x.com/personal-information',
            kycRequired: true,
          ),
        );
      },
    ),
  ];

  @override
  void dispose() {
    _stateSubject.close();
  }

  @override
  void updateState(AccountSubmenuPageState updateValue) {
    // TODO: implement updateState
  }
}
