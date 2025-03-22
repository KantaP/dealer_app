import 'package:aconnec_1109_x/src/model/cloudfunction/on_call_rp_function/response_ndid_ref.m.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class AconnecNdidWatingPageState
    implements IPageState<AconnecNdidWatingPageState> {
  NdidRefResponseModel _ndidRefResponse = NdidRefResponseModel();

  AconnecNdidWatingPageState({NdidRefResponseModel? ndidRefResponse}) {
    _ndidRefResponse = ndidRefResponse ?? NdidRefResponseModel();
  }

  NdidRefResponseModel get ndidRefResponse => _ndidRefResponse;

  @override
  AconnecNdidWatingPageState copyWith(Map<String, dynamic> value) {
    return AconnecNdidWatingPageState(
      ndidRefResponse:
          value[AconnecNdidWatingPageStateFields.ndidRefResponse] ??
              _ndidRefResponse,
    );
  }
}

class AconnecNdidWatingPageStateFields {
  AconnecNdidWatingPageStateFields._();
  static const String ndidRefResponse = 'ndidRefResponse';
}

class AconnecNdidTimerState implements IPageState<AconnecNdidTimerState> {
  Duration _countdown = const Duration();
  String _type = '';

  AconnecNdidTimerState(
      {Duration countdown = const Duration(), String type = ''}) {
    _countdown = countdown;
    _type = type;
  }

  Duration get countdown => _countdown;
  String get type => _type;

  @override
  AconnecNdidTimerState copyWith(Map<String, dynamic> value) {
    return AconnecNdidTimerState(
        countdown: value[AconnecNdidTimerStateFields.countdown] ?? _countdown,
        type: value[AconnecNdidTimerStateFields.type] ?? _type);
  }
}

class AconnecNdidTimerStateFields {
  AconnecNdidTimerStateFields._();

  static const String countdown = 'countdown';
  static const String type = 'type';
}
