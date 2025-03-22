import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/constants.dart';
import 'package:aconnec_1109_x/src/features/user/bindings/user.binding.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/add_bank_account.st.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/edit_bank_account_arguments.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/bank_item.dart';
import 'package:aconnec_1109_x/src/widgets/custom_future.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:aconnec_1109_x/src/widgets/loading.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../../../model/request_user_bank_account.m.dart';
import '../../../theme/custom_theme.dart';

class UserBankAccountView extends StatefulWidget {
  const UserBankAccountView({super.key});

  @override
  State<UserBankAccountView> createState() => _UserBankAccountViewState();
}

class _UserBankAccountViewState extends State<UserBankAccountView> {
  @override
  Widget build(BuildContext context) {
    final vm = UserBinding.userBankAccountViewModel;
    return CustomFuture(
      future: vm.getMyBanks(),
      customLoading: Stack(
        children: [
          DefaultLayout(
            appBar: DefaultAppBar(
              title: S.current.userBankListTitle,
              centerTitle: true,
            ),
            slivers: [],
            physics: const NeverScrollableScrollPhysics(),
          ),
          const Loading(),
        ],
      ),
      builder: (_, snapshot) => DefaultLayout(
        bodyPadding: PaddingScreen.paddingLTR,
        appBar: DefaultAppBar(
          title: S.current.userBankListTitle,
          centerTitle: true,
        ),
        slivers: [
          SliverFillRemaining(
              child: SingleChildScrollView(
            child: Column(
              children: [
                ...List.generate(
                  snapshot.data!.length,
                  (index) {
                    final item = snapshot.data![index];
                    return _buildBankItem(item, index);
                  },
                ),
                _buildAddButton()
              ],
            ),
          ))
        ],
        physics: const BouncingScrollPhysics(),
      ),
    );
    // return DefaultLayout(
    //   appBar: const DefaultAppBar(
    //     title: 'บัญชีธนาคาร',
    //     centerTitle: true,
    //   ),
    //   bodyPadding: PaddingScreen.paddingLTR,
    //   slivers: [
    //     SliverFillRemaining(
    //       child: CustomFuture(
    //         future: vm.getMyBanks(),
    //         customLoading: const Center(child: Loading()),
    //         builder: (_, snapshot) => ListView.separated(
    //           padding: EdgeInsets.zero,
    //           primary: false,
    //           physics: const NeverScrollableScrollPhysics(),
    //           shrinkWrap: true,
    //           itemBuilder: (_, index) {
    //             final length = snapshot.data?.length ?? 0;
    //             if (index == (length - 1)) {
    //               return _buildAddButton();
    //             }
    //             final item = snapshot.data![index];
    //             return _buildBankItem(item);
    //           },
    //           separatorBuilder: (_, index) {
    //             return const Padding(
    //               padding: EdgeInsets.symmetric(vertical: 16.0),
    //               child: DottedLine(
    //                 dashColor: blueColor,
    //               ),
    //             );
    //           },
    //           itemCount: snapshot.data?.length ?? 0,
    //         ),
    //       ),
    //     )
    //   ],
    //   physics: const BouncingScrollPhysics(),
    //   extendBody: true,
    // );
  }

  Widget _buildBankItem(UserBankAccountModel item, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            NavigationService.toNamed(
              RoutesConstant.editBankAccount,
              arguments: EditBankAccountArguments(
                bankData: item,
                index: index,
              ),
            );
          },
          child: BankItem(
            item: item,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: Spacing.spacing16),
          child: DottedLine(
            dashColor: blueColor,
          ),
        ),
      ],
    );
  }

  Widget _buildAddButton() {
    final vm = UserBinding.userBankAccountViewModel;
    return InkWell(
      onTap: () {
        vm.gotoAddBank().then((value) {
          setState(() {});
        });
      },
      child: Row(
        children: [
          Assets.icons.add24.image(),
          const SizedBox(
            width: 10,
          ),
          Text(
            S.current.addBankButton,
            style: paragraph1LightStyle?.copyWith(color: blueColor),
          )
        ],
      ),
    );
  }
}
