import 'package:aconnec_1109_x/src/model/model.abs.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class AcceptLawState implements IPageState<AcceptLawState> {
  bool _accept = false;
  bool _isLoading = false;

  AcceptLawState({bool accept = false, bool isLoading = false}) {
    _accept = accept;
    _isLoading = isLoading;
  }

  bool get accept => _accept;
  bool get isLoading => _isLoading;

  @override
  AcceptLawState copyWith(Map<String, dynamic> value) {
    return AcceptLawState(
      accept: value[AcceptLawStateFields.accept] ?? _accept,
      isLoading: value[AcceptLawStateFields.isLoading] ?? _isLoading,
    );
  }
}

class AcceptLawStateFields {
  AcceptLawStateFields._();

  static const String accept = 'accept';
  static const String isLoading = 'isLoading';
}

class AcceptLawStatePersistence implements ModelJson<AcceptLawState> {
  @override
  List<AcceptLawState> fromArrayJson(List arrJson) {
    // TODO: implement fromArrayJson
    throw UnimplementedError();
  }

  @override
  AcceptLawState fromJson(Map<String, dynamic> json) {
    return AcceptLawState(
      accept: json[AcceptLawStateFields.accept] ?? false,
    );
  }

  @override
  Map<String, dynamic> toJson(AcceptLawState json) {
    return {AcceptLawStateFields.accept: json.accept};
  }
}
