import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/features/introduction/view/di/set_pin_complete.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';

class SetPinCompleteView extends CustomView<SetPinCompleteViewModel> {
  const SetPinCompleteView(
      {required SetPinCompleteViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _SetPinCompleteViewState createState() => _SetPinCompleteViewState(viewModel);
}

class _SetPinCompleteViewState
    extends ViewState<SetPinCompleteView, SetPinCompleteViewModel> {
  _SetPinCompleteViewState(super.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AssetImages.setPinComplete),
            HilightText(
              text: S.of(context).setPinCompleteHeadline,
              hilightStyle: Theme.of(context).textTheme.headlineMedium?.merge(
                    const TextStyle(color: blueColor),
                  ),
              normalStyle: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                S.of(context).setPinCompleteContent,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 23.0, vertical: 40.0),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    S.of(context).setPinCompleteSubmitButton,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
