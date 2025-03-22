import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/di/components/injection.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/bank_ndid.st.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../di/bank_ndid.vm.dart';
import 'select_bank_item.dart';

class BankRegister extends StatelessWidget {
  const BankRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      header: Text(
        S.of(context).bankNdidExpandHeadline1,
        style: paragraph1RegularStyle,
      ),
      collapsed: _buildItems(),
      expanded: const Text(''),
    );
  }

  Widget _buildItems() {
    BankNdidViewModel viewModel = getIt<BankNdidViewModel>();
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 40),
      child: StreamBuilder<BankNdidPageState>(
        stream: viewModel.state,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final bank = snapshot.data?.ndidBankRegister ?? [];
            final selectedId = snapshot.data?.selectedIdItem ?? '';
            if (bank.isNotEmpty) {
              return Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                spacing: 8,
                children: bank
                    .map(
                      (e) => SelectBankItem(
                        item: e,
                        selected: (selectedId == e.id.trim()) ? true : false,
                        onTap: () {
                          viewModel.updateState(
                            {
                              BankNdidPageStateFields.selectedIdItem: e.id,
                            },
                          );
                        },
                      ),
                    )
                    .toList(),
              );
            } else {
              // show text empty
              return Text(
                S.of(context).bankNdidNeverRegister,
                style: paragraph2Style?.copyWith(color: darkGreyColor),
              );
            }
          }
          return Container();
        },
      ),
    );
  }
}
