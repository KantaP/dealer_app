import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/features/transaction/bindings/transaction.binding.dart';
import 'package:aconnec_1109_x/src/utilities/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';

import '../../../constants/border_radius.dart';
import '../../../constants/enums.dart';
import '../../../constants/firebase_storage.dart';
import '../../../constants/spacing.dart';
import '../../../core/translate/generated/l10n.dart';
import '../../../core/view_model/view_route.dart';
import '../../../model/cloudfunction/on_call_listing/listing_list.m.dart';
import '../../../model/realtime_database/coin_price.m.dart';
import '../../../theme/custom_theme.dart';
import '../../../widgets/app_bars/default_app_bar.dart';
import '../../../widgets/custom_future.dart';
import '../../../widgets/custom_steam_builder.dart';
import '../../../widgets/layouts/default_layout.dart';
import '../../../widgets/loading.dart';
import '../../../widgets/storage_image.dart';
import '../model/exchange_government_token.st.dart';
import '../model/exchange_input.st.dart';

class ExchangeInputScreen extends StatefulWidget {
  const ExchangeInputScreen(
      {super.key, required this.coinData, required this.coinPrice});

  final CoinModel coinData;
  final CoinPriceModel coinPrice;

  @override
  State<ExchangeInputScreen> createState() => _ExchangeInputScreenState();
}

class _ExchangeInputScreenState extends State<ExchangeInputScreen> {
  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  void dispose() {
    super.dispose();
    final viewModel = TransactionBinding.exchangeViewModel;
    viewModel.reset();
  }

  // @override
  // void didPopNext() {
  //   super.didPopNext();
  //   // setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    final viewModel = TransactionBinding.exchangeViewModel;

    return CustomFuture(
      future: viewModel.getCoinPrice(),
      customLoading: Container(
        color: blueColor,
        child: const Loading(),
      ),
      builder: (_, snapshot) => DefaultLayout(
        bgColor: blueColor,
        appBar: CustomStreamBuilder<ExchangeGovernmentTokenPageState>(
          silver: true,
          stream: viewModel.state,
          builder: (context, snapshot) {
            return _buildAppBar(snapshot.data);
          },
        ),
        slivers: [
          SliverFillRemaining(
            child: _buildContent(),
          )
        ],
        physics: const BouncingScrollPhysics(),
        extendBody: true,
      ),
    );
  }

  Widget _buildAppBar(ExchangeGovernmentTokenPageState? data) {
    final viewModel = TransactionBinding.exchangeViewModel;
    return DefaultAppBar(
      leading: const BackButton(
        color: whiteColor,
      ),
      bgColor: blueColor,
      textNormalColor: whiteColor,
      title: (data!.mode == ExchangeMode.buy.name)
          ? '${S.current.buyGovernmentTokenTitle} ${widget.coinData.getBaseSymbol()}'
          : '${S.current.sellGovernmentTokenTitle} ${widget.coinData.getBaseSymbol()}',
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: InkWell(
            onTap: () {
              viewModel.swapMode();
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: darkBlueColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Center(
                  child: CustomStreamBuilder<ExchangeGovernmentTokenPageState>(
                      stream: viewModel.state,
                      builder: (context, snapshot) {
                        return Text(
                          (snapshot.data!.mode == ExchangeMode.buy.name)
                              ? S.of(context).sell
                              : S.of(context).buy,
                          style: paragraph3Style?.copyWith(color: whiteColor),
                        );
                      }),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildContent() {
    final viewModel = TransactionBinding.exchangeViewModel;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(BorderRadiusSet.radius24),
                child: Container(
                  width: 24,
                  height: 24,
                  color: whiteColor,
                  child: StorageImage(
                    storagePath: FirebaseStorageValue.coinRef,
                    fileName:
                        '${widget.coinData.getBaseSymbol().toUpperCase()}.png',
                  ),
                ),
              ),
              const SizedBox(
                width: Spacing.spacing10,
              ),
              CustomStreamBuilder<ExchangeGovernmentTokenPageState>(
                stream: viewModel.state,
                builder: (context, snapshot) {
                  return CustomStreamBuilder(
                    stream: viewModel.coinPriceSubject.state(),
                    builder: (_, coinDataSnapshot) => Text(
                      (snapshot.data!.mode == ExchangeMode.buy.name)
                          ? ' 1 ${widget.coinData.getBaseSymbol()} = ${coinDataSnapshot.data!.getBuyValue().toUom('THB')}'
                          : ' 1 ${widget.coinData.getBaseSymbol()} = ${coinDataSnapshot.data!.getSellValue().toUom('THB')}',
                      style: paragraph2Style?.copyWith(color: whiteColor),
                    ),
                  );
                },
              )
            ],
          ),
        ),
        const Spacer(),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            Expanded(flex: 3, child: _buildNumOfCount()),
            Expanded(flex: 1, child: _buildSwap())
          ],
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(
            left: 24.0,
            right: 24.0,
            // bottom: 10,
          ),
          child: _buildSubmitButton(),
        ),
        SizedBox(
          height: paddingBottom(),
        ),
        SizedBox(
          width: 0,
          height: 0,
          child: TextField(
            style: const TextStyle(color: Colors.transparent),
            // autofocus: true,
            cursorColor: Colors.transparent,
            showCursor: false,
            autocorrect: false,
            enableSuggestions: false,
            maxLines: 1,
            enableInteractiveSelection: false,
            decoration: const InputDecoration(border: InputBorder.none),
            focusNode: viewModel.keyboardShortcutsFocus,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*')),
            ],
            controller: viewModel.countController,
            onChanged: (value) {
              String num = value;
              if (num.isEmpty) {
                num = '0';
              }
              viewModel.onInputNumber(num);
            },
          ),
        )
      ],
    );
  }

  Widget _buildNumOfCount() {
    final viewModel = TransactionBinding.exchangeViewModel;
    return GestureDetector(
      onTap: () {
        Future.delayed(Duration.zero, () {
          viewModel.keyboardShortcutsFocus.requestFocus();
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomStreamBuilder(
            stream: CombineLatestStream.combine2(
                viewModel.exchangeInputState.state(),
                viewModel.state,
                (a, b) => [a, b]),
            builder: (_, snapshot) {
              final stateA = snapshot.data![0] as ExchangeInputState;
              final stateB =
                  snapshot.data![1] as ExchangeGovernmentTokenPageState;
              double fontSize = (headline1Style!.fontSize! -
                  (stateA.numberOfCount.length * 3));
              if (fontSize < 20) {
                fontSize = 20.0;
              }

              return RichText(
                text: TextSpan(
                  text: stateA.numberOfCount.toString(),
                  style: headline1Style?.copyWith(
                    color: (stateB.errorMessage.isNotEmpty)
                        ? lightRed
                        : whiteColor,
                    fontSize: fontSize,
                  ),
                  children: [
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: stateB.currencyType.toUpperCase(),
                      style: paragraph1RegularStyle?.copyWith(
                        color: (stateB.errorMessage.isNotEmpty)
                            ? lightRed
                            : whiteColor,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          CustomStreamBuilder(
            stream: CombineLatestStream.combine2(
              viewModel.exchangeInputState.state(),
              viewModel.state,
              (a, b) => [a, b],
            ),
            builder: (_, snapshot) {
              final stateA = snapshot.data![0] as ExchangeInputState;
              final stateB =
                  snapshot.data![1] as ExchangeGovernmentTokenPageState;
              final coinData = viewModel.coinDataSubject.subject.value;
              final swapType = stateB.swapCurrencyType;
              final decimal = coinData.getBaseSymbol() == swapType
                  ? coinData.decimalBase
                  : coinData.decimalQuote;
              final equalTo = stateA.equalTo;
              return Visibility(
                visible: stateB.errorMessage.isEmpty,
                child: Text(
                  '${S.current.equalTo} ${equalTo.toPrecision(decimal)} ${stateB.swapCurrencyType.toUpperCase()}',
                  style: paragraph1RegularStyle?.copyWith(
                      color: whiteColor.withOpacity(0.5)),
                ),
              );
            },
          ),
          CustomStreamBuilder(
            stream: viewModel.state,
            builder: (_, snapshot) => Visibility(
              visible: snapshot.data!.errorMessage.isNotEmpty,
              child: Text(
                snapshot.data!.errorMessage,
                style: paragraph1RegularStyle?.copyWith(color: lightRed),
                textAlign: TextAlign.center,
                softWrap: true,
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwap() {
    final viewModel = TransactionBinding.exchangeViewModel;
    return InkWell(
      onTap: () {
        viewModel.swapCurrencyType(
          widget.coinData.getBaseSymbol(),
          widget.coinData.getQuoteSymbol(),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.icons.swap.image(),
          const SizedBox(
            height: 10,
          ),
          CustomStreamBuilder<ExchangeGovernmentTokenPageState>(
            stream: viewModel.state,
            builder: (context, snapshot) {
              String swap = '';
              if (snapshot.data?.currencyType ==
                  widget.coinData.getQuoteSymbol()) {
                swap = widget.coinData.getBaseSymbol();
              } else {
                swap = widget.coinData.getQuoteSymbol();
              }
              return Text(
                swap.toUpperCase(),
                style: paragraph3Style?.copyWith(color: whiteColor),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    final viewModel = TransactionBinding.exchangeViewModel;
    return CustomFuture(
      future: viewModel.check(),
      customLoading: const Center(child: CircularProgressIndicator()),
      builder: (_, snapshot) => StreamBuilder<ExchangeGovernmentTokenPageState>(
        stream: viewModel.state,
        builder: (context, snapshot) {
          if (snapshot.hasData == false) return Container();
          return ElevatedButton(
            style: (snapshot.data?.canSubmit == false)
                ? elevatedDisabledBlueButton
                : elevatedWhiteButton,
            onPressed: (snapshot.data?.canSubmit == true)
                ? () => viewModel.goToConfirmOrder()
                : null,
            child: Text(
              (snapshot.data!.mode == ExchangeMode.buy.name)
                  ? S.of(context).buyGasthButton
                  : S.of(context).sellGasthButton,
              style: textInButtonStyle?.copyWith(color: blueColor),
            ),
          );
        },
      ),
    );
  }

  void initData() {
    final viewModel = TransactionBinding.exchangeViewModel;
    viewModel.coinDataSubject.setValue(widget.coinData);
    viewModel.updateState(
      {
        ExchangeGovernmentTokenPageStateFields.currencyType:
            widget.coinData.getBaseSymbol(),
        ExchangeGovernmentTokenPageStateFields.swapCurrencyType:
            widget.coinData.getQuoteSymbol()
      },
    );
    viewModel.setUserProfile();
    viewModel.controllerListening();
  }
}
