import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_term_sensitive.st.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model_new.abs.dart';
import 'package:flutter/services.dart';
import 'package:rxdart/rxdart.dart';

class KycTermSensitiveViewModel
    extends CustomViewModel<KycTermSensitivePageState> {
  final _routesSubject = PublishSubject<AppRouteSpec>();

  Stream<AppRouteSpec> get routes => _routesSubject;

  final _stateSubject =
      BehaviorSubject.seeded(const KycTermSensitivePageState());
  Stream<KycTermSensitivePageState> get state => _stateSubject;

  @override
  void dispose() {
    _stateSubject.close();
    _routesSubject.close();
  }

  @override
  void updateState(KycTermSensitivePageState updateValue) {
    _stateSubject.add(updateValue);
  }

  Future<String> loadDoc() async {
    final txt = await rootBundle.loadString(Assets.documents.kycTermSensitive);
    return txt;
  }
}
