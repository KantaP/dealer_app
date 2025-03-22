import 'package:aconnec_1109_x/src/features/kyc/model/ndid_payment_failed.st.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class NdidPaymentFailedViewModel extends ViewModel {
  final _stateSubject = BehaviorSubject<NdidPaymentFailedPageState>.seeded(
      NdidPaymentFailedPageState());

  Stream<NdidPaymentFailedPageState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  @override
  void dispose() {
    _stateSubject.close();
    _routesSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    // TODO: implement updateState
  }
}
