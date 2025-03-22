import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model_new.abs.dart';
import 'package:aconnec_1109_x/src/features/dashboard/model/request_form.arguments.dart';
import 'package:injectable/injectable.dart';

@singleton
@Injectable()
class ReportProblemViewModel extends CustomViewModel {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void updateState(updateValue) {
    // TODO: implement updateState
  }

  void goToReportPage() {
    NavigationService.toNamed(
      RoutesConstant.requestForm,
      arguments: RequestFormArgumentsScreen(
          title: 'ตั๋วคำร้อง',
          formUrl: 'https://support.1109x.com/support/tickets/new'),
    );
  }
}
