import 'package:flutter/cupertino.dart';
import 'package:aconnec_1109_x/src/di/components/injection.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/widgets/modals/di/kyc_tryagain.vm.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';

Future showKycTryagainModalBottomSheet(BuildContext context,
    {Function? onPress, String? ref}) {
  return showCupertinoModalPopup(
    context: context,
    builder: (_) => KycTryagainModal(
      viewModel: getIt<KycTryagainViewModel>(),
    ),
  );
}

class KycTryagainModal extends CustomView<KycTryagainViewModel> {
  const KycTryagainModal({super.key, required KycTryagainViewModel viewModel})
      : super.model(viewModel);

  @override
  ViewState<KycTryagainModal, KycTryagainViewModel> createState() =>
      _KycTryagainModalState(viewModel);
}

class _KycTryagainModalState
    extends ViewState<KycTryagainModal, KycTryagainViewModel> {
  _KycTryagainModalState(super.viewModel);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
