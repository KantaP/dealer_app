import 'dart:io';

import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/di/components/injection.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/di/phone_auth.vm.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/phone_auth.p.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showSigninModalBottomSheet() async {
  return showCupertinoModalPopup(
      context: NavigationService.navigatorKey.currentContext!,
      builder: (_) => PhoneAuthPage(viewModel: getIt<PhoneAuthViewModel>()));
}
