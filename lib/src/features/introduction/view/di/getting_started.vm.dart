import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/data/local/shared_preferences.dart';
import 'package:aconnec_1109_x/src/features/introduction/model/getting_started.st.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

@Injectable()
class GettingStartedViewModel extends ViewModel {
  final _stateSubject =
      BehaviorSubject<GettingStartedState>.seeded(GettingStartedState());
  Stream<GettingStartedState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final SharedPreferencesHelper _preferencesHelper;
  GettingStartedViewModel(this._preferencesHelper);

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

  Future<void> onTapGetStarted() async {
    await _preferencesHelper.setPassFirstTime(true);
    await _preferencesHelper.setLoggedIn(false);
    _routesSubject.add(const AppRouteSpec(
        name: RoutesConstant.welcomBack,
        action: AppRouteAction.replaceAllWith));
  }

  void onChangePage(int index) {
    updateState(<String, dynamic>{GettingStartedFields.infoIndex: index});
  }
}
