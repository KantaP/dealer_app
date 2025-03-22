import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_id_card.st.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

@Injectable()
class KycIdCardViewModel extends ViewModel {
  final _pageStateSubject =
      BehaviorSubject<KycIdCardState>.seeded(KycIdCardState());
  Stream<KycIdCardState> get pageState => _pageStateSubject;

  final _formStateSubject =
      BehaviorSubject<KycIdCardFormState>.seeded(KycIdCardFormState());
  Stream<KycIdCardFormState> get formState => _formStateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  @override
  void dispose() {
    _pageStateSubject.close();
    _formStateSubject.close();
    _routesSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {}

  void gotoSetPin() {
    _routesSubject.add(const AppRouteSpec(name: RoutesConstant.setPin));
  }
}
