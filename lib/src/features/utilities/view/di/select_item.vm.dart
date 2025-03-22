import 'package:aconnec_1109_x/src/features/utilities/model/select_item.st.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

@Injectable()
class SelectItemViewModel extends ViewModel {
  final _stateSubject =
      BehaviorSubject<SelectItemPageState>.seeded(SelectItemPageState());

  Stream<SelectItemPageState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get rotues => _routesSubject;

  @override
  void dispose() {
    _stateSubject.close();
    _routesSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(
      state.copyWith(updateValue),
    );
  }

  void onBack() {
    _routesSubject.add(const AppRouteSpec.pop());
  }
}
