import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/features/authenticate/bindings/authenticate.binding.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/custom_steam_builder.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:flutter/material.dart';

class SuspendAccountView extends StatelessWidget {
  const SuspendAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = AuthenticateBinding.suspendAccountViewModel;
    return DefaultLayout(
        appBar: DefaultAppBar(
          title: S.current.terminateAccountTitle,
          centerTitle: true,
        ),
        bodyPadding: PaddingScreen.paddingLTR,
        safeAreaBottom: true,
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                Text(
                  S.current.terminateAccountContentTitle,
                  style: titleStyle,
                ),
                const SizedBox(
                  height: Spacing.spacing20,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('\u2022'),
                    const SizedBox(
                      width: Spacing.spacing4,
                    ),
                    Flexible(
                      child: Text(S.current.terminateAccountConsent1,
                          style:
                              paragraph2Style?.copyWith(color: darkGreyColor),
                          overflow: TextOverflow.clip),
                    )
                  ],
                ),
                const SizedBox(
                  height: Spacing.spacing16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('\u2022'),
                    const SizedBox(
                      width: Spacing.spacing4,
                    ),
                    Flexible(
                      child: Text(
                        S.current.terminateAccountConsent2,
                        style: paragraph2Style?.copyWith(color: darkGreyColor),
                        overflow: TextOverflow.clip,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: Spacing.spacing16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('\u2022'),
                    const SizedBox(
                      width: Spacing.spacing4,
                    ),
                    Flexible(
                      child: Text(S.current.terminateAccountConsent3,
                          style:
                              paragraph2Style?.copyWith(color: darkGreyColor),
                          overflow: TextOverflow.clip),
                    )
                  ],
                ),
                const SizedBox(
                  height: Spacing.spacing16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomStreamBuilder(
                      stream: vm.pageSubject.state(),
                      builder: (_, snapshot) => Checkbox(
                          value: snapshot.data!.isAccept,
                          onChanged: (value) {
                            vm.updateState(
                              vm.pageSubject.subject.value
                                  .copyWith(isAccept: value!),
                            );
                          }),
                    ),
                    const SizedBox(
                      width: Spacing.spacing4,
                    ),
                    Flexible(
                      child: Text(S.current.terminateAccountConsent4,
                          style:
                              paragraph2Style?.copyWith(color: darkGreyColor),
                          overflow: TextOverflow.clip),
                    )
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomStreamBuilder(
                        stream: vm.pageSubject.state(),
                        builder: (_, snapshot) => OutlinedButton(
                          style: (snapshot.data!.isAccept == false)
                              ? outlineDisabledButtonStyle
                              : outlineAlertButtonStyle,
                          onPressed: (snapshot.data!.isAccept == false)
                              ? null
                              : () {
                                  vm.suspendAccount();
                                },
                          child: const Text('ลบบัญชี'),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
        physics: const NeverScrollableScrollPhysics(),
        extendBody: true);
  }
}
