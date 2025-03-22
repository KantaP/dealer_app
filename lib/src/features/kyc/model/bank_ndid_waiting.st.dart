import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_rp_function/response_ndid_ref.m.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class BankNdidWaitingPageState implements IPageState<BankNdidWaitingPageState> {
  NdidRefResponseModel _ndidRefResponse = NdidRefResponseModel();

  BankNdidWaitingPageState({NdidRefResponseModel? ndidRefResponse}) {
    _ndidRefResponse = ndidRefResponse ?? NdidRefResponseModel();
  }

  NdidRefResponseModel get ndidRefResponse => _ndidRefResponse;

  @override
  BankNdidWaitingPageState copyWith(Map<String, dynamic> value) {
    return BankNdidWaitingPageState(
      ndidRefResponse: value[BankNdidWaitingPageStateFields.ndidRefResponse] ??
          _ndidRefResponse,
    );
  }
}

class BankNdidWaitingPageStateFields {
  BankNdidWaitingPageStateFields._();
  static const String ndidRefResponse = 'ndidRefResponse';
}

class BankNdidTimerState implements IPageState<BankNdidTimerState> {
  Duration _countdown = const Duration();
  String _type = '';

  BankNdidTimerState(
      {Duration countdown = const Duration(), String type = ''}) {
    _countdown = countdown;
    _type = type;
  }

  Duration get countdown => _countdown;
  String get type => _type;

  @override
  BankNdidTimerState copyWith(Map<String, dynamic> value) {
    return BankNdidTimerState(
        countdown: value[BankNdidTimerStateFields.countdown] ?? _countdown,
        type: value[BankNdidTimerStateFields.type] ?? _type);
  }
}

class BankNdidTimerStateFields {
  BankNdidTimerStateFields._();

  static const String countdown = 'countdown';
  static const String type = 'type';
}
