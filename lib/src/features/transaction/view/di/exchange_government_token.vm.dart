import 'dart:async';
import 'dart:ffi';

import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/constants/strings.dart';
import 'package:aconnec_1109_x/src/core/custom_stream_subject.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/di/components/injection.dart';
import 'package:aconnec_1109_x/src/features/authenticate/bindings/authenticate.binding.dart';
import 'package:aconnec_1109_x/src/features/authenticate/service/di/authentication.firebase.dart';
import 'package:aconnec_1109_x/src/features/coin/bindings/coin.binding.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/confirm_order_arguments.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/exchange_government_token.st.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/exchange_input.st.dart';
import 'package:aconnec_1109_x/src/features/transaction/service/di/order.service.dart';
import 'package:aconnec_1109_x/src/features/user/bindings/user.binding.dart';
import 'package:aconnec_1109_x/src/features/user/model/user_usage_spend_today.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_listing/listing_list.m.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/open_check.m.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:aconnec_1109_x/src/model/realtime_database/coin_price.m.dart';
import 'package:aconnec_1109_x/src/model/user_profile.m.dart';
import 'package:aconnec_1109_x/src/utilities/extension.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../bindings/transaction.binding.dart';

@singleton
class ExchangeGovernmentTokenViewModel extends ViewModel {
  final orderService = TransactionBinding.orderService;
  final userDataService = UserBinding.userDataService;
  final _authenticationFirebaseService =
      AuthenticateBinding.authenticationFirebaseService;
  final coinService = CoinBinding.coinService;

  // final _routesSubject = PublishSubject<AppRouteSpec>();

  // Stream<AppRouteSpec> get routes => _routesSubject;

  final stateSubject = BehaviorSubject<ExchangeGovernmentTokenPageState>.seeded(
      ExchangeGovernmentTokenPageState());
  Stream<ExchangeGovernmentTokenPageState> get state => stateSubject;

  final coinDataSubject = CustomStreamSubject<CoinModel>(const CoinModel());
  final coinPriceSubject =
      CustomStreamSubject<CoinPriceModel>(const CoinPriceModel());

  FocusNode keyboardShortcutsFocus = FocusNode();
  TextEditingController countController = TextEditingController();

  final exchangeInputState = CustomStreamSubject(const ExchangeInputState());

  late UserProfileModel userProfile;

  late StreamSubscription<DatabaseEvent> coinStreamData;

  // final int minSwap = 100;
  // final double maxSwap = 3000000;

  @override
  void dispose() {
    // _routesSubject.close();
    stateSubject.close();
    coinDataSubject.dispose();
    coinPriceSubject.dispose();
    countController.dispose();
    keyboardShortcutsFocus.dispose();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = stateSubject.value;
    stateSubject.add(state.copyWith(updateValue));
  }

  void setUserProfile() async {
    final data = await _authenticationFirebaseService.getCurrentUser();
    userProfile = data;
  }

  void addNumber(String input) {
    final state = stateSubject.value;
    final numOfCount = exchangeInputState.subject.value.numberOfCount;
    if (numOfCount.length == 15) return;
    String newNumOfCount = '';

    if (input == '0' && numOfCount == '0') {
      newNumOfCount = input;
    } else {
      if (numOfCount == '0' && input != '.') {
        newNumOfCount = input;
      } else {
        if (input == '.' && numOfCount.contains('.')) return;
        if (numOfCount.contains('.')) {
          final spllitText = numOfCount.split('.');
          final coinData = coinDataSubject.subject.value;
          final currentCurrencyType = state.currencyType;
          final decimalCheck = (currentCurrencyType == coinData.getBaseSymbol())
              ? coinData.decimalBase
              : coinData.decimalQuote;
          if (spllitText[1].length < decimalCheck) {
            newNumOfCount = '$numOfCount$input';
          } else {
            return;
          }
        }
        newNumOfCount = '$numOfCount$input';
      }
    }
    updateState(
        {ExchangeGovernmentTokenPageStateFields.numOfCount: newNumOfCount});

    calculateSwapTotal();
  }

  void onInputNumber(String value) {
    if (value.contains('.')) {
      final state = stateSubject.value;
      final spllitText = value.split('.');
      final coinData = coinDataSubject.subject.value;
      final currentCurrencyType = state.currencyType;
      final decimalCheck = (currentCurrencyType == coinData.getBaseSymbol())
          ? coinData.decimalBase
          : coinData.decimalQuote;
      if (spllitText[1].length > decimalCheck) {
        return;
      }
    }
    final state = exchangeInputState.subject.value;
    exchangeInputState.setValue(state.copyWith(numberOfCount: value));
    calculateSwapTotal();
  }

  void onRemoveNum() {
    final state = stateSubject.value;
    final numOfCount = exchangeInputState.subject.value.numberOfCount;
    String newNumOfCount = '';
    if (numOfCount.length == 1) {
      newNumOfCount = '0';
    } else {
      newNumOfCount = numOfCount.substring(0, numOfCount.length - 1);
    }

    updateState(
        {ExchangeGovernmentTokenPageStateFields.numOfCount: newNumOfCount});

    calculateSwapTotal();
  }

  void setNumber(double num) {
    final state = stateSubject.value;
    final currencyType = state.currencyType;
    final coinData = coinDataSubject.subject.value;
    final coinPrice = coinPriceSubject.subject.value;
    final swapRate = (state.mode == ExchangeMode.buy.name)
        ? coinPrice.getBuyValue()
        : coinPrice.getSellValue();
    double numInput = 0;

    if (currencyType == coinData.getBaseSymbol()) {
      numInput = num / swapRate;
    } else if (currencyType == coinData.getQuoteSymbol()) {
      numInput = num;
    }
    updateState({
      ExchangeGovernmentTokenPageStateFields.numOfCount:
          numInput.toPrecision(2).toString(),
    });

    calculateSwapTotal();
  }

  void swapCurrencyType(String base, String quote) {
    final state = stateSubject.value;
    final currencyType = state.currencyType;
    final coinPrice = coinPriceSubject.subject.value;
    final swapRate = (state.mode == ExchangeMode.buy.name)
        ? coinPrice.getBuyValue()
        : coinPrice.getSellValue();
    // double numInput = 0;
    // double oldInput =
    //     double.parse(exchangeInputState.subject.value.numberOfCount);

    if (currencyType == base) {
      // numInput = oldInput * swapRate;
      updateState({
        ExchangeGovernmentTokenPageStateFields.currencyType: quote,
        ExchangeGovernmentTokenPageStateFields.swapCurrencyType: base,
      });
      exchangeInputState.setValue(
        exchangeInputState.subject.value.copyWith(numberOfCount: '0'),
      );
      countController.value = TextEditingValue.empty;
    } else {
      // numInput = oldInput / swapRate;
      updateState({
        ExchangeGovernmentTokenPageStateFields.currencyType: base,
        ExchangeGovernmentTokenPageStateFields.swapCurrencyType: quote,
      });
      exchangeInputState.setValue(
        exchangeInputState.subject.value.copyWith(numberOfCount: '0'),
      );
      countController.value = TextEditingValue.empty;
    }
    calculateSwapTotal();
  }

  Future<void> calculateSwapTotal() async {
    final state = stateSubject.value;
    final coinPrice = coinPriceSubject.subject.value;
    final currenCurrency = state.currencyType;

    final swapCurrency = state.swapCurrencyType;
    final numOfCount = exchangeInputState.subject.value.numberOfCount;
    final swapRate = (state.mode == ExchangeMode.buy.name)
        ? coinPrice.getBuyValue()
        : coinPrice.getSellValue();
    double total = 0;
    final coinData = coinDataSubject.subject.value;
    final num = double.parse(numOfCount).toPrecision(2);

    double minswap = 0;
    double maxSwap = 0;
    // print(coinData);
    if (currenCurrency == coinData.getQuoteSymbol()) {
      if (state.mode == ExchangeMode.buy.name) {
        minswap = coinData.minBuyQuote;
        maxSwap = coinData.maxBuyQuote;
      } else {
        minswap = coinData.minSellQuote;
        maxSwap = coinData.maxSellQuote;
      }
    } else {
      if (state.mode == ExchangeMode.buy.name) {
        minswap = coinData.minBuyBase;
        maxSwap = coinData.maxBuyBase;
      } else {
        minswap = coinData.minSellBase;
        maxSwap = coinData.maxSellBase;
      }
    }

    final userSpendLimit = await userDataService.getUserSpendLimit();
    final orderSpendToday = await orderService.orderSpendLimit();

    final sumOfOrderSpendBuy =
        orderSpendToday.spendBuyCompleted + orderSpendToday.spendBuyInCompleted;
    final sumOfOrderSpendSell = orderSpendToday.spendSellCompleted +
        orderSpendToday.spendSellInCompleted;

    final percentOfTodaySpendBuy =
        sumOfOrderSpendBuy / userSpendLimit.spendLimitBuy;
    final percentOfTodaySpendSell =
        sumOfOrderSpendSell / userSpendLimit.spendLimitSell;

    final usageData = UserUsageSpendTodayModel(
      limitBuy: userSpendLimit.spendLimitBuy,
      limitSell: userSpendLimit.spendLimitSell,
      usageBuy: sumOfOrderSpendBuy,
      usageSell: sumOfOrderSpendSell,
      usageBuyPercent:
          percentOfTodaySpendBuy.isNaN ? 0 : percentOfTodaySpendBuy,
      usageSellPercent:
          percentOfTodaySpendSell.isNaN ? 0 : percentOfTodaySpendSell,
    );

    final maximumTodayBuy = userSpendLimit.spendLimitBuy - sumOfOrderSpendBuy;
    final maximumTodaySell =
        userSpendLimit.spendLimitSell - sumOfOrderSpendSell;

    if (swapCurrency == coinData.getQuoteSymbol()) {
      total = (num * swapRate).toPrecision(coinData.decimalQuote);
      if (state.mode == ExchangeMode.buy.name) {
        if (total > maximumTodayBuy) {
          final errorMessage = S.current.spendLimitBuyWarning
              .replaceAll('@value', maximumTodayBuy.toCurrency());
          updateState({
            ExchangeGovernmentTokenPageStateFields.canSubmit: false,
            ExchangeGovernmentTokenPageStateFields.errorMessage: errorMessage,
          });
          return;
        }
      } else {
        if (total > maximumTodaySell) {
          final errorMessage = S.current.spendLimitSellWarning
              .replaceAll('@value', maximumTodaySell.toCurrency());
          updateState({
            ExchangeGovernmentTokenPageStateFields.canSubmit: false,
            ExchangeGovernmentTokenPageStateFields.errorMessage: errorMessage,
          });
          return;
        }
      }
    } else if (swapCurrency == coinData.getBaseSymbol()) {
      total = (num / swapRate).toPrecision(coinData.decimalBase);
      if (state.mode == ExchangeMode.buy.name) {
        if (num > maximumTodayBuy) {
          final errorMessage = S.current.spendLimitBuyWarning
              .replaceAll('@value', maximumTodayBuy.toCurrency());
          updateState({
            ExchangeGovernmentTokenPageStateFields.canSubmit: false,
            ExchangeGovernmentTokenPageStateFields.errorMessage: errorMessage,
          });
          return;
        }
      } else {
        if (num > maximumTodaySell) {
          final errorMessage = S.current.spendLimitSellWarning
              .replaceAll('@value', maximumTodaySell.toCurrency());
          updateState({
            ExchangeGovernmentTokenPageStateFields.canSubmit: false,
            ExchangeGovernmentTokenPageStateFields.errorMessage: errorMessage,
          });
          return;
        }
      }
    }

    if (num >= minswap && num <= maxSwap) {
      // final userProfile = await _authenticationFirebaseService.getCurrentUser();
      updateState({
        ExchangeGovernmentTokenPageStateFields.canSubmit:
            (userProfile.status == UserStatus.active.name &&
                        userProfile.kycStatus == StaticValue.verified) &&
                    userProfile.kycLevel == 2
                ? true
                : false,
        ExchangeGovernmentTokenPageStateFields.errorMessage: '',
      });
      exchangeInputState
          .setValue(exchangeInputState.subject.value.copyWith(equalTo: total));
    } else {
      String errorMessage = '';
      if (num < minswap) {
        errorMessage =
            'Enter a minimum of ${minswap.toCurrency()} $currenCurrency';
      }
      if (num > maxSwap) {
        errorMessage =
            'Exceeds the maximum of ${maxSwap.toCurrency()} $currenCurrency';
      }

      updateState({
        ExchangeGovernmentTokenPageStateFields.canSubmit: false,
        ExchangeGovernmentTokenPageStateFields.errorMessage: errorMessage,
      });
    }
  }

  void goToConfirmOrder() {
    final state = stateSubject.value;
    final swapCurrency = state.swapCurrencyType;
    // final currencyType = state.currencyType;
    final coinPrice = coinPriceSubject.subject.value;
    final numOfCount = exchangeInputState.subject.value.numberOfCount;
    final coinData = coinDataSubject.subject.value;
    final num = double.parse(numOfCount);
    double total = 0;
    double uomTotal = 0;
    final swapRate = (state.mode == ExchangeMode.buy.name)
        ? coinPrice.getBuyValue()
        : coinPrice.getSellValue();
    if (swapCurrency == coinData.getQuoteSymbol()) {
      total = (num * swapRate).toPrecision(coinData.decimalQuote);
      uomTotal = (num).toPrecision(coinData.decimalBase);
      if (state.mode == ExchangeMode.buy.name) {
        uomTotal = uomTotal - coinPrice.getFeeValue();
      }
    } else if (swapCurrency == coinData.getBaseSymbol()) {
      total = num.toPrecision(coinData.decimalQuote);
      uomTotal = ((num / swapRate)).toPrecision(coinData.decimalBase);
      // print('beforce subtract fee: $uomTotal');
      if (state.mode == ExchangeMode.buy.name) {
        final fee = coinPrice.getFeeValue();
        // print('fee: $fee');
        uomTotal = uomTotal - fee;
        // print('after subtract fee: $uomTotal');
      }
    }

    // print(total);
    // print(uomTotal);
    keyboardShortcutsFocus.unfocus();
    countController.clear();
    exchangeInputState.setValue(
      exchangeInputState.subject.value.copyWith(
        numberOfCount: '0',
        equalTo: 0,
      ),
    );
    updateState({
      ExchangeGovernmentTokenPageStateFields.canSubmit: false,
      ExchangeGovernmentTokenPageStateFields.errorMessage: '',
    });
    NavigationService.toNamed(
      RoutesConstant.confirmOrder,
      arguments: ConfirmOrderArgumentsScreen(
        coinData: coinData,
        baseTotal: total,
        quoteTotal: uomTotal,
        mode: state.mode,
        symbol: coinData.symbol,
        coinPrice: coinPrice,
      ),
    );
  }

  void goBack() {
    NavigationService.back(NavigationResult(null));
  }

  void swapMode() {
    final state = stateSubject.value;
    if (state.mode == ExchangeMode.buy.name) {
      updateState({
        ExchangeGovernmentTokenPageStateFields.mode: ExchangeMode.sell.name,
      });
    }

    if (state.mode == ExchangeMode.sell.name) {
      updateState({
        ExchangeGovernmentTokenPageStateFields.mode: ExchangeMode.buy.name,
      });
    }
  }

  Future<ResponseOpenCheckModel> check() async {
    await Future.delayed(const Duration(seconds: 2));
    final checkResult = await orderService.orderOpenCheck();
    // print('================');
    // print('get order check');
    // print(checkResult.toJson());
    keyboardShortcutsFocus.requestFocus();
    return checkResult;
  }

  Future<void> getCoinPrice() async {
    await Future.delayed(Duration.zero);
    final coinData = coinDataSubject.subject.value;
    final coinPrice = await coinService.getCoinPrice(coinData.idListing);
    print(coinPrice.toJson());
    coinPriceSubject.setValue(coinPrice);
    print('================');
    print('get coin price');
    print(coinPrice.toJson());
    updateCoinPriceRealtime();
    return;
  }

  void controllerListening() {
    countController.addListener(
      () {
        final textValue = countController.text;
        // print('value $textValue');
        if (textValue.length > 1) {
          if (textValue.startsWith('0') && !textValue.contains('.')) {
            // print('startwith 0');
            countController.value =
                TextEditingValue(text: textValue.substring(1));
          }
        }
      },
    );
  }

  void updateCoinPriceRealtime() {
    final coinData = coinDataSubject.subject.value;
    coinStreamData = coinService.onCoinData(coinData.idListing).listen(
      (event) {
        final snapshot = event.snapshot.value;
        // print(snapshot);
        if (snapshot == null) return;
        final coinPriceData = CoinPriceModel.fromJson(
          Map<String, dynamic>.from(snapshot as dynamic),
        );
        coinPriceSubject.setValue(coinPriceData);
      },
    );
  }

  void reset() {
    keyboardShortcutsFocus.unfocus();
    countController.clear();
    exchangeInputState.setValue(
      exchangeInputState.subject.value.copyWith(
        numberOfCount: '0',
        equalTo: 0,
      ),
    );
    updateState({
      ExchangeGovernmentTokenPageStateFields.canSubmit: false,
      ExchangeGovernmentTokenPageStateFields.errorMessage: '',
    });
    coinStreamData.cancel();
  }
}
