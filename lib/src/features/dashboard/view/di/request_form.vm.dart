import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/core/custom_stream_subject.dart';
import 'package:aconnec_1109_x/src/features/dashboard/model/side_menu_model.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model_new.abs.dart';
import 'package:injectable/injectable.dart';

@singleton
class RequestFormViewModel extends CustomViewModel {
  final progressSubject = CustomStreamSubject(0);

  @override
  void dispose() {
    progressSubject.subject.close();
  }

  @override
  void updateState(updateValue) {
    // TODO: implement updateState
  }
}
