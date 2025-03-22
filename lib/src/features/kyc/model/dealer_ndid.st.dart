import 'package:aconnec_1109_x/src/model/idp.m.dart';
import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class DealerNdidPageState implements IPageState<DealerNdidPageState> {
  List<IdpModel> _dealers = [];

  DealerNdidPageState({
    final List<IdpModel> dealers = const [],
  }) {
    _dealers = dealers;
  }

  List<IdpModel> get dealers => _dealers;

  @override
  DealerNdidPageState copyWith(Map<String, dynamic> value) {
    return DealerNdidPageState(
      dealers: value[DealerNdidPageStateFields.dealers] ?? _dealers,
    );
  }
}

class DealerNdidPageStateFields {
  DealerNdidPageStateFields._();

  static const String dealers = 'dealers';
}
