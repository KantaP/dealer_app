import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/firebase_storage.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/accept_law.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/address.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/fund.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_information_summary.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc.vm.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class KycInformationSummaryViewModel extends ViewModel {
  final KycFirebaseService _firebaseService;
  KycInformationSummaryViewModel(this._firebaseService);

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final _stateSubject = BehaviorSubject<KycInformationSummaryPageState>.seeded(
    KycInformationSummaryPageState(),
  );
  Stream<KycInformationSummaryPageState> get state => _stateSubject;

  late KycLevel2ViewModel _kycViewModel;
  late StreamSubscription<DatabaseEvent> _idCardAddressSubscriber;
  late StreamSubscription<DatabaseEvent> _currentAddressSubscriber;
  late StreamSubscription<DatabaseEvent> _workingAddressSubscriber;
  late StreamSubscription<DatabaseEvent> _fundSubscriber;
  late StreamSubscription<DatabaseEvent> _acceptionLawSubscriber;

  @override
  void dispose() {
    _routesSubject.close();
    _idCardAddressSubscriber.cancel();
    _currentAddressSubscriber.cancel();
    _workingAddressSubscriber.cancel();
    _fundSubscriber.cancel();
    _acceptionLawSubscriber.cancel();
  }

  void setKycViewModel(KycLevel2ViewModel viewModel) {
    _kycViewModel = viewModel;
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(state.copyWith(updateValue));
  }

  Future<void> next() async {
    final kycProgress = await _firebaseService.getKycLevel2Progress();
    final updateProgress = kycProgress.copyWith({
      KycLevel2PageStateFields.currentStepIndex: 1,
      KycLevel2PageStateFields.firstStepProgress: 100,
      KycLevel2PageStateFields.secondStepProgress: 0,
      KycLevel2PageStateFields.thirdStepProgress: 0
    });

    await _firebaseService.setKycLevel2Progress(updateProgress);
    _kycViewModel.pageController.nextPage(
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  Future<String>? getIdCardAddress() async {
    final state = await _firebaseService.getAddressFormState();
    if (state != null) {
      return getAddress(state);
    }
    return '';
  }

  Future<String>? getCurrentAddress() async {
    final state = await _firebaseService.getCurrentAddressFormState();
    if (state != null) {
      return getAddress(state);
    }
    return '';
  }

  Future<KycFundFormState>? getFundFormState() {
    return _firebaseService.getFundFormState();
  }

  Future<String>? getWorkingAddress() async {
    final state = await _firebaseService.getWorkingAddressState();
    if (state != null) {
      return getAddress(state);
    }
    return '';
  }

  String getAddress(KycAddressFormState state) {
    final homeNumber = (state.houseNumber.isNotEmpty)
        ? '${S.current.kycAddressNumber} ${state.houseNumber}'
        : '';
    final moo =
        (state.moo.isNotEmpty) ? '${S.current.kycAddressMoo} ${state.moo}' : '';
    final houseName = (state.houseName.isNotEmpty)
        ? '${S.current.kycAddressOptional1} ${state.houseName}'
        : '';
    final soi =
        (state.soi.isNotEmpty) ? '${S.current.kycAddressSoi} ${state.soi}' : '';
    final road = (state.road.isNotEmpty)
        ? '${S.current.kycAddressRoad} ${state.road}'
        : '';
    final province = (state.province.isNotEmpty)
        ? '${S.current.kycAddressProvince} ${state.province}'
        : '';
    final district = (state.district.isNotEmpty)
        ? '${S.current.kycAddressDistinct} ${state.district}'
        : '';
    final subDistrict = (state.subDistrict.isNotEmpty)
        ? '${S.current.kycAddressSubDistinct} ${state.subDistrict}'
        : '';
    final postCode = (state.postCode.isNotEmpty)
        ? '${S.current.kycAddressPostCode} ${state.postCode}'
        : '';
    return '$homeNumber $moo $houseName $soi $road $subDistrict $district $province $postCode';
  }

  Future<String> getAnotherJobDocImage() {
    return _firebaseService.getDownloadURL(
      FirebaseStorageValue.fundAnotherJobDoc,
      FirebaseStorageValue.anotherJobDocNameFile,
    );
  }

  Future<String> getAnotherJobAssetDocImage() {
    return _firebaseService.getDownloadURL(
      FirebaseStorageValue.fundAnotherJobAssetDoc,
      FirebaseStorageValue.anotherJobAssetDocNameFile,
    );
  }

  Future<AcceptLawState>? getAcceptLawState() {
    return _firebaseService.getAcceptLawState();
  }

  void editData({required int pageNumber}) {
    _kycViewModel.updateState({KycLevel2PageStateFields.editMode: true});
    _kycViewModel.pageController.jumpToPage(pageNumber);
  }

  void firebaseListener() {
    // _idCardAddressSubscriber =
    //     _firebaseService.onIdCardAddressValue().listen((event) {
    //   if (event.snapshot.value != null) {
    //     final data = Map<String, dynamic>.from(event.snapshot.value as dynamic);
    //     final state = KycAddressFormStatePersistence().fromJson(data);
    //     updateState({
    //       KycInformationSummaryPageStateFields.idCardAddressState: state,
    //     });
    //   }
    // });

    // _currentAddressSubscriber =
    //     _firebaseService.onCurrentAddressValue().listen((event) {
    //   if (event.snapshot.value != null) {
    //     final data = Map<String, dynamic>.from(event.snapshot.value as dynamic);
    //     final state = KycAddressFormStatePersistence().fromJson(data);
    //     updateState({
    //       KycInformationSummaryPageStateFields.currentAddressState: state,
    //     });
    //   }
    // });

    // _workingAddressSubscriber =
    //     _firebaseService.onWorkingAddressValue().listen((event) {
    //   if (event.snapshot.value != null) {
    //     final data = Map<String, dynamic>.from(event.snapshot.value as dynamic);
    //     final state = KycAddressFormStatePersistence().fromJson(data);
    //     updateState({
    //       KycInformationSummaryPageStateFields.workingAddressState: state,
    //     });
    //   }
    // });

    // _fundSubscriber = _firebaseService.onFundValue().listen((event) {
    //   if (event.snapshot.value != null) {
    //     final data = Map<String, dynamic>.from(event.snapshot.value as dynamic);
    //     final state = KycFundFormStatePersistence().fromJson(data);
    //     updateState({
    //       KycInformationSummaryPageStateFields.fundState: state,
    //     });
    //   }
    // });

    // _acceptionLawSubscriber =
    //     _firebaseService.onLawAcceptionValue().listen((event) {
    //   if (event.snapshot.value != null) {
    //     final data = Map<String, dynamic>.from(event.snapshot.value as dynamic);
    //     final state = AcceptLawStatePersistence().fromJson(data);
    //     updateState({
    //       KycInformationSummaryPageStateFields.acceptLawState: state,
    //     });
    //   }
    // });
  }
}
