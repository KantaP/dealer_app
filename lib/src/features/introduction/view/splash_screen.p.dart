import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/features/introduction/view/di/splash_screen.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/logo.dart';

class SplashScreenPage extends CustomView<SplashScreenViewModel> {
  const SplashScreenPage({required SplashScreenViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState(viewModel);
}

class _SplashScreenPageState
    extends ViewState<SplashScreenPage, SplashScreenViewModel> {
  _SplashScreenPageState(super.viewModel);

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  void didPush() {
    super.didPush();
    viewModel.checkRoot().then(
      (value) {
        if (value) {
          viewModel.initStaticData().then((value) {
            viewModel.checkAuth();
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: blueColor,
      body: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 260,
            height: 390,
            child: Logo(),
          ),
        ],
      ),
    );
  }
}
