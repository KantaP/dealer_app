import 'package:aconnec_1109_x/src/di/components/injection.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/di/account_manage_submenu.vm.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/di/account_submenu.vm.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/di/contact.vm.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/di/help_submenu.vm.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/di/home.vm.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/di/notification.vm.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/di/other_submenu.vm.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/di/report_problem.vm.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/di/request_form.vm.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/di/setting_submenu.vm.dart';
import 'package:aconnec_1109_x/src/features/dashboard/view/di/side_menu.vm.dart';

class DashboardBinding {
  static AccountSubmenuViewModel get accountSubmenuViewModel =>
      getIt<AccountSubmenuViewModel>();

  static AccountManageSubmenuViewModel get accountManageSubmenuViewModel =>
      getIt<AccountManageSubmenuViewModel>();

  static SettingSubmenuVieWModel get settingSubmenuViewModel =>
      getIt<SettingSubmenuVieWModel>();

  static HelpSubmenuViewModel get helpSubmenuViewModel =>
      getIt<HelpSubmenuViewModel>();

  static OtherSubmenuViewModel get otherSubmenuViewModel =>
      getIt<OtherSubmenuViewModel>();

  static ContactViewModel get contactViewModel => getIt<ContactViewModel>();

  static HomeViewModel get homeViewModel => getIt<HomeViewModel>();

  static SideMenuViewModel get sideMenuViewModel => getIt<SideMenuViewModel>();

  static RequestFormViewModel get requestFormViewModel =>
      getIt<RequestFormViewModel>();

  static ReportProblemViewModel get reportProblemViewModel =>
      getIt<ReportProblemViewModel>();

  static NotificationViewModel get notificationViewModel =>
      getIt<NotificationViewModel>();
}
