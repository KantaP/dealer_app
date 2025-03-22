import 'package:aconnec_1109_x/src/constants/border_radius.dart';
import 'package:aconnec_1109_x/src/constants/firebase_storage.dart';
import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/core/custom_stream_subject.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/exchange_input.st.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_listing/listing_list.m.dart';
import 'package:aconnec_1109_x/src/model/realtime_database/coin_price.m.dart';
import 'package:aconnec_1109_x/src/utilities/extension.dart';
import 'package:aconnec_1109_x/src/widgets/app_bars/default_app_bar.dart';
import 'package:aconnec_1109_x/src/widgets/custom_steam_builder.dart';
import 'package:aconnec_1109_x/src/widgets/layouts/default_layout.dart';
import 'package:aconnec_1109_x/src/widgets/custom_future.dart';
import 'package:aconnec_1109_x/src/widgets/loading.dart';
import 'package:aconnec_1109_x/src/widgets/storage_image.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/exchange_government_token.st.dart';
import 'package:aconnec_1109_x/src/features/transaction/view/di/exchange_government_token.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/core/view_model/view.abs.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';

class ExchangeGovernmentTokenView
    extends CustomView<ExchangeGovernmentTokenViewModel> {
  final CoinModel coinData;
  final CoinPriceModel coinPrice;

  const ExchangeGovernmentTokenView({
    required ExchangeGovernmentTokenViewModel viewModel,
    super.key,
    required this.coinData,
    required this.coinPrice,
  }) : super.model(viewModel);

  @override
  ViewState<ExchangeGovernmentTokenView, ExchangeGovernmentTokenViewModel>
      createState() => _ExchangeGovernmentTokenViewState(viewModel);
}

class _ExchangeGovernmentTokenViewState extends ViewState<
    ExchangeGovernmentTokenView, ExchangeGovernmentTokenViewModel> {
  _ExchangeGovernmentTokenViewState(super.viewModel);

  @override
  void initState() {
    super.initState();

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
  }

  @override
  void didPush() {
    super.didPush();
    viewModel.controllerListening();
  }

  @override
  Widget build(BuildContext context) {
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
            if (snapshot.hasData == false)
              return const SliverAppBar(
                backgroundColor: blueColor,
              );
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
    return DefaultAppBar(
      leading: GestureDetector(
        onTap: () {
          viewModel.goBack();
        },
        child: const Icon(
          Icons.arrow_back_ios,
          color: whiteColor,
        ),
      ),
      bgColor: blueColor,
      textNormalColor: whiteColor,
      title: (data!.mode == ExchangeMode.buy.name)
          ? '${S.of(context).buyGovernmentTokenTitle} ${widget.coinData.getBaseSymbol()}'
          : '${S.of(context).sellGovernmentTokenTitle} ${widget.coinData.getBaseSymbol()}',
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
                  child: StreamBuilder<ExchangeGovernmentTokenPageState>(
                      stream: viewModel.state,
                      builder: (context, snapshot) {
                        if (snapshot.hasData == false) {
                          return const Text('');
                        }
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
              StreamBuilder<ExchangeGovernmentTokenPageState>(
                stream: viewModel.state,
                builder: (context, snapshot) {
                  if (snapshot.hasData == false) {
                    return const Text('');
                  }
                  return CustomStreamBuilder(
                    stream: viewModel.coinPriceSubject.state(),
                    builder: (_, coinData) => Text(
                      (snapshot.data!.mode == ExchangeMode.buy.name)
                          ? ' 1 ${widget.coinData.getBaseSymbol()} = ${coinData.data!.getBuyValue().toUom('THB')}'
                          : ' 1 ${widget.coinData.getBaseSymbol()} = ${coinData.data!.getSellValue().toUom('THB')}',
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

  Widget _buildKeyPad() {
    return Container(
      width: MediaQuery.of(context).size.width,
      // constraints: const BoxConstraints(maxHeight: 200),
      // height: 360,
      decoration: const BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNumPad(num: 1),
              _buildNumPad(num: 2),
              _buildNumPad(num: 3),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNumPad(num: 4),
              _buildNumPad(num: 5),
              _buildNumPad(num: 6),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNumPad(num: 7),
              _buildNumPad(num: 8),
              _buildNumPad(num: 9),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: InkWell(
                    onTap: () {
                      viewModel.addNumber('.');
                    },
                    child: Center(
                      child: SizedBox(
                        child: Text(
                          '.',
                          style:
                              headline2MediumStyle?.copyWith(color: blueColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              _buildNumPad(num: 0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: InkWell(
                    onTap: () {
                      viewModel.onRemoveNum();
                    },
                    child: Image.asset(
                      AssetIcons.backStepBlue,
                      width: 36,
                      height: 28,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // const SizedBox(
          //   height: 30,
          // ),
          const SizedBox(
            height: Spacing.spacing24,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              // bottom: 10,
            ),
            child: _buildSubmitButton(),
          ),
          const SizedBox(
            height: Spacing.spacing24,
          )
        ],
      ),
    );
  }

  Widget _buildNumPad({required int num}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: InkWell(
          onTap: () {
            viewModel.addNumber(num.toString());
          },
          child: Center(
            child: SizedBox(
              child: Text(
                num.toString(),
                style: headline2MediumStyle?.copyWith(color: blueColor),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConditionNumber(
      {required String label, required double number}) {
    return InkWell(
      onTap: () {
        viewModel.setNumber(number);
      },
      child: Container(
        // constraints: const BoxConstraints(maxWidth: 165),
        decoration: BoxDecoration(
            color: darkBlueColor, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label.toUpperCase(),
                style: paragraph2MediumStyle?.copyWith(color: whiteColor),
              ),
              const SizedBox(
                width: Spacing.spacing10,
              ),
              Flexible(
                child: Text(
                  number.toString(),
                  style: paragraph2MediumStyle?.copyWith(
                      color: whiteColor.withOpacity(0.5)),
                  maxLines: 2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
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

  Widget _buildSwap() {
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
          Image.asset(AssetIcons.swap),
          const SizedBox(
            height: 10,
          ),
          StreamBuilder<ExchangeGovernmentTokenPageState>(
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
              })
        ],
      ),
    );
  }

  Widget _buildNumOfCount() {
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
                  '${S.of(context).equalTo} ${equalTo.toPrecision(decimal)} ${stateB.swapCurrencyType.toUpperCase()}',
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
}
