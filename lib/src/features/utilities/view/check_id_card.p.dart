import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/features/utilities/bindings/utilities.binding.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/custom_steam_builder.dart';
import 'package:aconnec_1109_x/src/widgets/custom_text_field.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> showCheckIdCardModal({required BuildContext context}) async {
  return showCupertinoModalPopup(
    context: context,
    builder: (_) => const CheckIdCardViewScreen(),
  );
}

class CheckIdCardViewScreen extends StatelessWidget {
  const CheckIdCardViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = UtilitiesBinding.checkIdCardViewModel;
    return WillPopScope(
      onWillPop: () => vm.onWillPop(),
      child: DefaultLayout(
        appBar: const DefaultAppBar(
          title: 'ตรวจสอบบัตรประชาชน',
          centerTitle: true,
        ),
        bodyPadding: PaddingScreen.paddingLTR,
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomStreamBuilder(
                  stream: vm.stateSubject.state(),
                  builder: (_, snapshot) => CustomTextField(
                    label: S.of(context).kycInformationIdCardLabel,
                    placeholder: S.of(context).kycInformationIdCardPlaceholder,
                    // controller: ,
                    // errorText: snapshot.data?.idCard,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      vm.updateState(
                        vm.stateSubject.subject.value.copyWith(idCard: value),
                      );
                    },
                    // maxlength: 13,
                    inputFormatters: [LengthLimitingTextInputFormatter(13)],
                  ),
                ),
                CustomStreamBuilder(
                  stream: vm.stateSubject.state(),
                  builder: (_, snapshot) => ElevatedButton(
                    onPressed: (snapshot.data!.idCard.length == 13)
                        ? () {
                            FocusScope.of(context).unfocus();
                            vm.checkIdCard();
                          }
                        : null,
                    child: const Text('ตรวจสอบ'),
                  ),
                )
              ],
            ),
          )
        ],
        physics: const NeverScrollableScrollPhysics(),
        extendBody: true,
      ),
    );
  }
}
