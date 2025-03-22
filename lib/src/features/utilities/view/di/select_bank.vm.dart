import 'package:aconnec_1109_x/src/features/utilities/model/select_bank.st.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class SelectBankViewModel extends ViewModel {
  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final _stateSubject = BehaviorSubject.seeded(SelectBankPageState());
  Stream<SelectBankPageState> get state => _stateSubject;

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

  void selectItem(String code) {
    updateState({SelectBankPageStateFields.selectedCode: code});
  }

  void goBack() {
    _routesSubject.add(const AppRouteSpec.pop());
  }

  void submit() {
    final state = _stateSubject.value;
    Navigator.of(NavigationService.navigatorKey.currentContext!)
        .pop({'callback': state.selectedCode});
  }
}
