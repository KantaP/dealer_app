import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class ExchangeGovernmentTokenPageState
    implements IPageState<ExchangeGovernmentTokenPageState> {
  String _numOfCount = '0'; // not use
  bool _canSubmit = false;
  String _currencyType = '';
  double _swapRateBaht = 0;
  String _errorMessage = '';
  String _swapCurrencyType = '';
  double _equalTo = 0; // not use
  String _mode = 'buy';

  double _baseCount = 0.00;
  double _quoteCount = 0.00;

  ExchangeGovernmentTokenPageState({
    String numOfCount = '0',
    bool canSubmit = false,
    String? currencyType,
    double swapRateBaht = 0,
    String errorMessage = '',
    String? swapCurrencyType,
    double equalTo = 0,
    String mode = 'buy',
    double baseCount = 0.0,
    double quoteCount = 0.0,
  }) {
    _numOfCount = numOfCount;
    _canSubmit = canSubmit;
    _currencyType = currencyType ?? CurrencySwapType.thb.name;
    _swapRateBaht = swapRateBaht;
    _errorMessage = errorMessage;
    _swapCurrencyType = swapCurrencyType ?? CurrencySwapType.gasth.name;
    _equalTo = equalTo;
    _mode = mode;
    _baseCount = baseCount;
    _quoteCount = quoteCount;
  }

  String get numOfCount => _numOfCount;
  bool get canSubmit => _canSubmit;
  String get currencyType => _currencyType;
  double get swapRateBaht => _swapRateBaht;
  String get errorMessage => _errorMessage;
  String get swapCurrencyType => _swapCurrencyType;
  double get equalTo => _equalTo;
  String get mode => _mode;
  double get baseCount => _baseCount;
  double get quoteCount => _quoteCount;

  @override
  ExchangeGovernmentTokenPageState copyWith(Map<String, dynamic> value) {
    return ExchangeGovernmentTokenPageState(
      numOfCount: value[ExchangeGovernmentTokenPageStateFields.numOfCount] ??
          _numOfCount,
      canSubmit:
          value[ExchangeGovernmentTokenPageStateFields.canSubmit] ?? _canSubmit,
      currencyType:
          value[ExchangeGovernmentTokenPageStateFields.currencyType] ??
              _currencyType,
      swapRateBaht:
          value[ExchangeGovernmentTokenPageStateFields.swapRateBaht] ??
              _swapRateBaht,
      errorMessage:
          value[ExchangeGovernmentTokenPageStateFields.errorMessage] ??
              _errorMessage,
      swapCurrencyType:
          value[ExchangeGovernmentTokenPageStateFields.swapCurrencyType] ??
              _swapCurrencyType,
      equalTo:
          value[ExchangeGovernmentTokenPageStateFields.equalTo] ?? _equalTo,
      mode: value[ExchangeGovernmentTokenPageStateFields.mode] ?? _mode,
      baseCount:
          value[ExchangeGovernmentTokenPageStateFields.baseCount] ?? _baseCount,
      quoteCount: value[ExchangeGovernmentTokenPageStateFields.quoteCount] ??
          _quoteCount,
    );
  }
}

class ExchangeGovernmentTokenPageStateFields {
  ExchangeGovernmentTokenPageStateFields._();

  static const String numOfCount = 'numOfCount';
  static const String canSubmit = 'canSubmit';
  static const String currencyType = 'currencyType';
  static const String swapRateBaht = 'swapRateBaht';
  static const String errorMessage = 'errorMessage';
  static const String swapCurrencyType = 'swapCurrencyType';
  static const String equalTo = 'equalTo';
  static const String mode = 'mode';
  static const String baseCount = 'baseCount';
  static const String quoteCount = 'quoteCount';
}
