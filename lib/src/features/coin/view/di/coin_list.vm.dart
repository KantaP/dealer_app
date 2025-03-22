import 'package:aconnec_1109_x/src/core/custom_stream_subject.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model_new.abs.dart';
import 'package:aconnec_1109_x/src/features/coin/model/coin_list_screen.st.dart';

class CoinListViewModel extends CustomViewModel<CoinListScreenPageState> {
  final pageStateSubject = CustomStreamSubject<CoinListScreenPageState>(
    const CoinListScreenPageState(),
  );

  @override
  void dispose() {
    pageStateSubject.dispose();
  }

  @override
  void updateState(CoinListScreenPageState updateValue) {
    // TODO: implement updateState
  }
}
