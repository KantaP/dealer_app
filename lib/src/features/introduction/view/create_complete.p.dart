import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/features/introduction/view/di/create_complete.vm.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';

class CreateCompletePage extends CustomView<CreateCompleteViewModel> {
  const CreateCompletePage(
      {required CreateCompleteViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _CreateCompletePageState createState() => _CreateCompletePageState(viewModel);
}

class _CreateCompletePageState
    extends ViewState<CreateCompletePage, CreateCompleteViewModel> {
  _CreateCompletePageState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(AssetImages.createComplete),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                S.of(context).createCompleteContent,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
                maxLines: 4,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 32.0),
              child: _widgetButtonSubmit(),
            )
          ],
        ),
      ),
    );
  }

  Widget _widgetButtonSubmit() {
    return ElevatedButton(
      onPressed: () {
        viewModel.gotoHome();
      },
      child: Text(S.of(context).createCompleteSubmitButton.toUpperCase()),
    );
  }
}
