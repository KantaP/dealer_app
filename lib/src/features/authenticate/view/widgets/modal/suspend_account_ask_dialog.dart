import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:flutter/widgets.dart';

Future<void> showSuspendAccountAskDialog() async {
  return DialogUtils.customShowDialog(
      context: NavigationService.navigatorKey.currentContext!,
      dialog: (_) => const SuspendAccountAskDialog());
}

class SuspendAccountAskDialog extends StatelessWidget {
  const SuspendAccountAskDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
