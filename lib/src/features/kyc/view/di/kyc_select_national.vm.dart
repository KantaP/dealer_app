import 'package:injectable/injectable.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
// import 'package:aconnec_1109_x/src/features/kyc/model/kyc_general_data.m.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_new.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_select_national.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class KycSelectNationalViewModel extends ViewModel {
  final KycFirebaseService _firebaseService;

  KycSelectNationalViewModel(this._firebaseService);

  final _pageStateSubject =
      BehaviorSubject.seeded(KycSelectNationalPageState());
  Stream<KycSelectNationalPageState> get pageState => _pageStateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  @override
  void dispose() {
    _pageStateSubject.close();
    _routesSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _pageStateSubject.value;
    _pageStateSubject.add(state.copyWith(updateValue));
  }

  void selectItem(String selected) {
    updateState({
      KycSelectNationalPageStateFields.selected: selected,
    });
  }

  void submit() async {
    final progress = await _firebaseService.getKycProgress();
    final generalData = await _firebaseService.getKycGeneralData();
    await _firebaseService.setKycGeneralData(
      generalData.copyWith(isThaiNationality: true),
    );
    await _firebaseService.setKycProgress(
      progress.copyWith(
        {
          KycFinalPageStateFields.firstStepProgress: KycPageNames.fatca.name,
        },
      ),
    );

    //go to upload id card
    // _routesSubject.add(
    //   const AppRouteSpec(name: RoutesConstant.kycIntrodunction),
    // );
  }
}
