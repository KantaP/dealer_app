import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_term.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class KycPdpaViewModel extends ViewModel {
  final KycFirebaseService _firebaseService;

  KycPdpaViewModel(this._firebaseService);
  final _routesSubject = PublishSubject<AppRouteSpec>();

  Stream<AppRouteSpec> get routes => _routesSubject;

  ScrollController scrollController = ScrollController();
  late KycFinalViewModel _kycLevel2ViewModel;

  @override
  void dispose() {
    _routesSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    // TODO: implement updateState
  }

  void setKycLevel2ViewModel(KycFinalViewModel viewModel) {
    _kycLevel2ViewModel = viewModel;
  }

  Future<void> next() async {
    try {
      _kycLevel2ViewModel
          .updateState({KycLevel2PageStateFields.isLoading: true});
      final kycTermState = await _firebaseService.getKycTerm();
      final newData = kycTermState
          .copyWith({KycTermPageStateFields.acceptCollectData: true});
      await _firebaseService.saveKycTerm(newData);
      final kycProgress = await _firebaseService.getKycProgress();
      final updateProgress = kycProgress.copyWith({
        KycLevel2PageStateFields.firstStepProgress:
            KycPageNames.idUploadIntroduction.name,
      });

      await _firebaseService.setKycProgress(updateProgress);

      _kycLevel2ViewModel
          .updateState({KycLevel2PageStateFields.isLoading: false});
    } catch (e) {
      print(e);
    }
  }

  Future<void> reject() async {
    final kycProgress = await _firebaseService.getKycProgress();
    final updateProgress = kycProgress.copyWith({
      KycLevel2PageStateFields.firstStepProgress: KycPageNames.kycTerm.name,
    });

    await _firebaseService.setKycProgress(updateProgress);

    _kycLevel2ViewModel
        .updateState({KycLevel2PageStateFields.isLoading: false});
  }

  Future<String> loadPdpa() async {
    final txt = await rootBundle.loadString(Assets.documents.pdpa);
    return txt;
  }
}
