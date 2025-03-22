import 'package:aconnec_1109_x/src/core/custom_stream_subject.dart';
import 'package:injectable/injectable.dart';

@singleton
class DefaultLayoutWithLoadingViewModel {
  final isLoadingSubject = CustomStreamSubject(false);

  void showLoading(bool show) {
    isLoadingSubject.setValue(show);
  }
}
