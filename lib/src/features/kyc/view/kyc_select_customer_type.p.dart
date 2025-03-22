import 'package:aconnec_1109_x/src/features/kyc/view/widgets/select_box.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_select_customer_type.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_select_customer_type.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';

class KycSelectCustomerTypeView
    extends CustomView<KycSelectCustomerTypeViewModel> {
  const KycSelectCustomerTypeView(
      {required KycSelectCustomerTypeViewModel viewModel, super.key})
      : super.model(viewModel);
  @override
  ViewState<KycSelectCustomerTypeView, KycSelectCustomerTypeViewModel>
      createState() => _KycSelectCustomerTypeViewState(viewModel);
}

class _KycSelectCustomerTypeViewState extends ViewState<
    KycSelectCustomerTypeView, KycSelectCustomerTypeViewModel> {
  _KycSelectCustomerTypeViewState(super.viewModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.spacing24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HilightText(
            text: S.of(context).kycSelectCustomerTypeHeadline,
            hilightStyle: headline4BoldStyle?.merge(
              const TextStyle(color: blueColor),
            ),
            normalStyle: headline4LightStyle,
          ),
          const SizedBox(
            height: Spacing.spacing20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: StreamBuilder<KycSelectCustomerTypePageState>(
                    stream: viewModel.pageState,
                    builder: (context, snapshot) {
                      if (snapshot.hasData == false) return Container();
                      return GestureDetector(
                        onTap: () {
                          viewModel.selectItem(UserType.individual.name);
                        },
                        child: SelectBox(
                          image:
                              Assets.images.individualPerson.image(width: 60),
                          label: Text(
                            S.of(context).kycSelectCustomerTypeOption1,
                            style: titleStyle,
                          ),
                          activate: snapshot.data!.selected ==
                                  UserType.individual.name
                              ? true
                              : false,
                        ),
                      );
                    }),
              ),
              const SizedBox(
                width: Spacing.spacing20,
              ),
              Expanded(
                child: StreamBuilder<KycSelectCustomerTypePageState>(
                  stream: viewModel.pageState,
                  builder: (context, snapshot) {
                    if (snapshot.hasData == false) return Container();
                    return GestureDetector(
                      onTap: () {
                        // viewModel.selectItem(CustomerTypes.juristic.name);
                      },
                      child: SelectBox(
                        image: Assets.images.juristicPerson.image(width: 60),
                        label: HilightText(
                          text: S.of(context).kycSelectCustomerTypeOption2,
                          hilightStyle: titleStyle?.merge(
                            const TextStyle(color: midGreyColor),
                          ),
                          normalStyle: titleStyle,
                          textAlign: TextAlign.center,
                        ),
                        activate:
                            snapshot.data!.selected == UserType.juristic.name
                                ? true
                                : false,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          const Spacer(),
          StreamBuilder<KycSelectCustomerTypePageState>(
            stream: viewModel.pageState,
            builder: (context, snapshot) {
              if (snapshot.hasData == false) return Container();
              return ElevatedButton(
                onPressed: (snapshot.data!.selected == '')
                    ? null
                    : () {
                        viewModel.submit();
                      },
                child: Text(S.of(context).nextButton),
              );
            },
          ),
          const SizedBox(
            height: Spacing.spacing24,
          )
        ],
      ),
    );
  }
}
