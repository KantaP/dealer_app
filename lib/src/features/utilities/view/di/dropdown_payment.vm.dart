import 'package:aconnec_1109_x/src/constants/payment.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/dropdown_payment.st.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class DropdownPaymentViewModel extends ViewModel {
  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final _stateSubject = BehaviorSubject.seeded(DropdownPaymentPageState());
  Stream<DropdownPaymentPageState> get state => _stateSubject;

  final payments = PaymentStaticValue.payments;

  @override
  void dispose() {
    _routesSubject.close();
    _stateSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(state.copyWith(updateValue));
  }

  void goBack() {
    _routesSubject.add(const AppRouteSpec.pop());
  }

  void submit() {
    final state = _stateSubject.value;
    if (state.onSelect != null) {
      state.onSelect!(state.selectedValue);
    }
    _routesSubject.add(const AppRouteSpec.pop());
  }
}
