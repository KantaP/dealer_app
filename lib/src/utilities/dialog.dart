import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:aconnec_1109_x/src/di/components/injection.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/di/enter_pin.vm.dart';
import 'package:aconnec_1109_x/src/features/authenticate/view/enter_pin.p.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';

class DialogUtils {
  DialogUtils._();

  static void customShowDialog({
    required BuildContext context,
    required Widget Function(BuildContext) dialog,
    bool? barrierDismissible,
  }) {
    if (Platform.isAndroid) {
      showDialog(
          context: context,
          builder: dialog,
          barrierDismissible: barrierDismissible ?? false,
          useRootNavigator: false);
    }
    if (Platform.isIOS) {
      showCupertinoDialog(
          context: context,
          builder: dialog,
          barrierDismissible: barrierDismissible ?? false,
          useRootNavigator: false);
    }
  }

  static void showToast({required String msg, String type = 'info'}) {
    // Fluttertoast.showToast(
    //   msg: msg,
    //   toastLength: Toast.LENGTH_LONG,
    //   gravity: ToastGravity.TOP,
    //   timeInSecForIosWeb: 1,
    //   backgroundColor: _getBackgroundColorType(type),
    //   textColor: Colors.white,
    //   fontSize: paragraph1RegularStyle?.fontSize,
    // );
  }

  static Color? _getBackgroundColorType(String type) {
    if (type == 'info') {
      return lightBlueColor;
    }
    if (type == 'error') {
      return redColor;
    }
    return null;
  }

  static OverlayEntry confirmPin(
      {required BuildContext context,
      required Function() onSubmit,
      Function()? onError}) {
    RenderBox? renderBox = context.findRenderObject()
        as RenderBox; // พิกัด และขนาดการ Render ของ Widget นี้
    var size = renderBox.size; // ขนาดของ Widget
    var offset = renderBox
        .localToGlobal(Offset.zero); // พิกัด X,Y ที่ Widget นี้แสดงอยู่

    return OverlayEntry(
      builder: (context) => EnterPinView(
        viewModel: getIt<EnterPinViewModel>(),
      ),
    );
  }
}
