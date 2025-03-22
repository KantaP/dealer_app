import 'package:flutter/widgets.dart';
import 'package:aconnec_1109_x/src/constants/firebase_storage.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_upload_id_card.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc.vm.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/capture_id_card.st.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class KycUploadIdCardViewModel extends ViewModel {
  final KycFirebaseService _firebaseService;
  KycUploadIdCardViewModel(this._firebaseService);

  final _routesSubject = PublishSubject<AppRouteSpec>();

  Stream<AppRouteSpec> get routes => _routesSubject;

  final _stateSubject = BehaviorSubject<KycUploadIdCardPageState>.seeded(
      KycUploadIdCardPageState());
  Stream<KycUploadIdCardPageState> get state => _stateSubject;

  late KycLevel2ViewModel _kycLevel2ViewModel;

  @override
  void dispose() {
    _routesSubject.close();
    _stateSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(
      state.copyWith(updateValue),
    );
  }

  void setKycLevel2ViewModel(KycLevel2ViewModel viewModel) {
    _kycLevel2ViewModel = viewModel;
  }

  Future<void> loadImages() async {
    final frontPath = await _firebaseService.getDownloadURL(
      FirebaseStorageValue.kycDocumentsFrontIdCardRef,
      FirebaseStorageValue.frontIdCardNameFile,
    );
    final backPath = await _firebaseService.getDownloadURL(
      FirebaseStorageValue.kycDocumentsBackIdCardRef,
      FirebaseStorageValue.backIdCardNameFile,
    );
    final selfiePath = await _firebaseService.getDownloadURL(
      FirebaseStorageValue.kycSelfieRef,
      FirebaseStorageValue.selfieNameFile,
    );
    updateState({
      KycUploadIdCardPageStateFields.frontIdCardPath: frontPath,
      KycUploadIdCardPageStateFields.backIdCardPath: backPath,
      KycUploadIdCardPageStateFields.selfiePath: selfiePath,
    });
  }

  void onEditFrontIdCard() {
    _routesSubject.add(
      AppRouteSpec(
        name: RoutesConstant.captureIdCard,
        arguments: {
          CaptureIdCardPageStateFields.onCapture: () {
            _routesSubject.add(const AppRouteSpec.pop());
          }
        },
      ),
    );
  }

  void onEditBackIdCard() {
    _routesSubject.add(
      AppRouteSpec(
        name: RoutesConstant.captureBackIdCard,
        arguments: {
          CaptureIdCardPageStateFields.onCapture: () {
            _routesSubject.add(const AppRouteSpec.pop());
          }
        },
      ),
    );
  }

  void onEditSelfie() {
    _routesSubject.add(
      AppRouteSpec(
        name: RoutesConstant.kycSelfieIntro,
        arguments: {
          CaptureIdCardPageStateFields.onCapture: () {
            _routesSubject.add(const AppRouteSpec.pop());
          }
        },
      ),
    );
  }

  Future<void> next() async {
    _kycLevel2ViewModel.updateState({KycLevel2PageStateFields.isLoading: true});

    final kycProgress = await _firebaseService.getKycLevel2Progress();
    final updateProgress = kycProgress.copyWith({
      KycLevel2PageStateFields.currentStepIndex: 2,
      KycLevel2PageStateFields.firstStepProgress: 100,
      KycLevel2PageStateFields.secondStepProgress: 100,
      KycLevel2PageStateFields.thirdStepProgress: 40
    });

    await _firebaseService.setKycLevel2Progress(updateProgress);
    _kycLevel2ViewModel
        .updateState({KycLevel2PageStateFields.isLoading: false});
    _kycLevel2ViewModel.pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }
}
