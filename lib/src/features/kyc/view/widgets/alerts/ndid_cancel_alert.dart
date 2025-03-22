import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/widgets/custom_dialog_box.dart';
import 'package:flutter/material.dart';

import '../../../../../theme/custom_theme.dart';

class NdidCancelAlert extends StatelessWidget {
  const NdidCancelAlert(
      {super.key, required this.ndidAttemptValue, required this.onCancel});

  final int ndidAttemptValue;
  final Function onCancel;

  @override
  Widget build(BuildContext context) {
    return CustomDialogAlert(
      title: Text(
        S.current.ndidWaitingCancelTitle,
        style: titleStyle,
      ),
      descriptions: Column(
        children: [
          Text(
            (ndidAttemptValue == 2)
                ? S.current.ndidCancel2ndTitle
                : S.current.ndidCancelTitle,
            style: paragraph1RegularStyle?.copyWith(color: darkGreyColor),
            textAlign: TextAlign.center,
          ),
          // Visibility(
          //   visible: ndidAttemptValue == 2,
          //   child: const Padding(
          //     padding: EdgeInsets.only(top: 20.0),
          //     child: Divider(),
          //   ),
          // ),
          // Visibility(
          //   visible: ndidAttemptValue == 2,
          //   child: Padding(
          //     padding: const EdgeInsets.only(top: 20.0),
          //     child: Text(
          //       S.current.ndid2ndCancelRefundDesc,
          //       style: paragraph1RegularStyle?.copyWith(color: darkGreyColor),
          //       textAlign: TextAlign.center,
          //     ),
          //   ),
          // ),
        ],
      ),
      submitButton: OutlinedButton(
        style: outlineAlertButtonStyle,
        onPressed: () {
          NavigationService.back(NavigationResult(null));
          onCancel();
        },
        child: Text(
          S.current.kycNdidCancel2ndButton,
        ),
      ),
      // (ndidAttemptValue == 2)
      // ? OutlinedButton(
      //     style: outlineAlertButtonStyle,
      //     onPressed: () {
      //       Navigator.pop(NavigationService.navigatorKey.currentContext!);
      //       onCancel();
      //     },
      //     child: Text(
      //       S.current.kycNdidCancel2ndButton,
      //     ),
      //   )
      // : ElevatedButton(
      //     onPressed: () {
      //       Navigator.pop(NavigationService.navigatorKey.currentContext!);
      //       onCancel();
      //     },
      //     child: Text(
      //       S.current.kycNdidCancel2ndButton,
      //     ),
      //   ),

      optionalButton: GestureDetector(
        onTap: () {
          Navigator.pop(NavigationService.navigatorKey.currentContext!);
        },
        child: Center(
          child: Text(
            S.current.backButton,
            style: textInButtonStyle,
          ),
        ),
      ),
    );
  }
}
