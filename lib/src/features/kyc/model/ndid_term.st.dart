import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class NdidTermPageState implements IPageState<NdidTermPageState> {
  bool _accept = false;

  NdidTermPageState({
    bool accept = false,
  }) {
    _accept = accept;
  }

  bool get accept => _accept;

  @override
  NdidTermPageState copyWith(Map<String, dynamic> value) {
    return NdidTermPageState(
      accept: value[NdidTermPageStateFields.accept] ?? _accept,
    );
  }
}

class NdidTermPageStateFields {
  NdidTermPageStateFields._();

  static const String accept = 'accept';
}

class NdidTermPageStatePersistence implements ModelJson<NdidTermPageState> {
  @override
  List<NdidTermPageState> fromArrayJson(List arrJson) {
    // TODO: implement fromArrayJson
    throw UnimplementedError();
  }

  @override
  NdidTermPageState fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson(NdidTermPageState json) {
    return {
      NdidTermPageStateFields.accept: json.accept,
    };
  }
}
