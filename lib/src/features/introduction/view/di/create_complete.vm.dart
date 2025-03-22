import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/features/introduction/model/create_complete.st.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class CreateCompleteViewModel extends ViewModel {
  final _stateSubject =
      BehaviorSubject<CreateCompleteState>.seeded(CreateCompleteState());
  Stream<CreateCompleteState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

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

  void gotoHome() {
    _routesSubject.add(const AppRouteSpec(
        name: RoutesConstant.home, action: AppRouteAction.replaceAllWith));
  }
}
