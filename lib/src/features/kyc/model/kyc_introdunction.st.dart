import 'package:aconnec_1109_x/src/core/view_model/page_state.abs.dart';

class KycIntrodunctionPageState
    implements IPageState<KycIntrodunctionPageState> {
  int _pageIndex = 0;

  KycIntrodunctionPageState({
    int pageIndex = 0,
  }) {
    _pageIndex = pageIndex;
  }

  int get pageIndex => _pageIndex;

  @override
  KycIntrodunctionPageState copyWith(Map<String, dynamic> value) {
    return KycIntrodunctionPageState(
      pageIndex: value[KycIntrodunctionPageStateFields.pageIndex] ?? _pageIndex,
    );
  }
}

class KycIntrodunctionPageStateFields {
  KycIntrodunctionPageStateFields._();

  static const String pageIndex = 'pageIndex';
}
