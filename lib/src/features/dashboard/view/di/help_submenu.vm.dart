import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/features/dashboard/model/request_form.arguments.dart';
import 'package:aconnec_1109_x/src/features/dashboard/model/side_menu_model.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model_new.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:intercom_flutter/intercom_flutter.dart';

@singleton
class HelpSubmenuViewModel extends CustomViewModel {
  final List<SideSubmenuModel> menus = <SideSubmenuModel>[
    SideSubmenuModel(
      text: S.current.chatWithUsSubMenuLabel,
      onPress: () async {
        await Intercom.instance.displayMessenger();
      },
    ),
    SideSubmenuModel(
      text: S.current.faqSubMenuLabel,
      onPress: () {
        NavigationService.toNamed(
          RoutesConstant.requestForm,
          arguments: RequestFormArgumentsScreen(
              title: S.current.faqSubMenuLabel,
              formUrl: 'https://help.1109x.com/th/faq'),
        );
      },
    ),
    SideSubmenuModel(
      text: S.current.coinInformationSubMenuLabel,
      onPress: () {
        NavigationService.toNamed(
          RoutesConstant.requestForm,
          arguments: RequestFormArgumentsScreen(
              title: S.current.coinInformationSubMenuLabel,
              formUrl: 'https://help.1109x.com/th/coin-information'),
        );
      },
    ),
    SideSubmenuModel(
      text: S.current.feeInformationSubMenuLabel,
      onPress: () {
        NavigationService.toNamed(
          RoutesConstant.requestForm,
          arguments: RequestFormArgumentsScreen(
              title: S.current.feeInformationSubMenuLabel,
              formUrl: 'https://help.1109x.com/th/fee'),
        );
      },
    ),
    SideSubmenuModel(
      text: S.current.contactUsSubMenuLabel,
      onPress: () {
        NavigationService.toNamed(RoutesConstant.contact);
      },
    ),
    SideSubmenuModel(
      text: S.current.reportClueSubMenuLabel,
      onPress: () {
        NavigationService.toNamed(RoutesConstant.reportProblem);
      },
    ),
    // SideSubmenuModel(
    //   text: 'แจ้งขอคืนเงิน/สินทรัพย์ดิจิทัล',
    //   onPress: () {
    //     NavigationService.toNamed(
    //       RoutesConstant.requestForm,
    //       arguments: RequestFormArgumentsScreen(
    //           title: 'แจ้งขอคืนเงิน/สินทรัพย์ดิจิทัล',
    //           formUrl:
    //               'https://docs.google.com/forms/d/e/1FAIpQLSeHueNJJ68Js-_1ouQTYFgoYxcsfbb2w60SHYGuDhqrJ-_gAw/viewform?usp=sharing'),
    //     );
    //   },
    // ),
    // SideSubmenuModel(
    //   text: 'การจัดการข้อมูลส่วนบุคคล',
    //   onPress: () {
    //     NavigationService.toNamed(RoutesConstant.userManagePersonalData);
    //   },
    // ),
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
