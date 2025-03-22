import 'package:aconnec_1109_x/src/features/kyc/model/kyc_new.st.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/error_status.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/data/local/json_data.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/address.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/enums/form_type.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/select_item.st.dart';
import 'package:aconnec_1109_x/src/model/district.m.dart';
import 'package:aconnec_1109_x/src/model/province.m.dart';
import 'package:aconnec_1109_x/src/model/sub_district.m.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class KycAddressViewModel extends ViewModel {
  final KycFirebaseService _firebaseService;
  KycAddressViewModel(this._firebaseService);

  late final KycFinalViewModel _kycViewModel;

  final _addressFormSubject =
      BehaviorSubject<KycAddressFormState>.seeded(KycAddressFormState());

  Stream<KycAddressFormState> get addressFormState => _addressFormSubject;

  final _addressFormErrorSubject =
      BehaviorSubject<KycAddressFormErrorState>.seeded(
          KycAddressFormErrorState());
  Stream<KycAddressFormErrorState> get addressFormErrorState =>
      _addressFormErrorSubject;

  final _currentAddressFormSubject =
      BehaviorSubject<KycAddressFormState>.seeded(KycAddressFormState());
  Stream<KycAddressFormState> get currentAddressFormState =>
      _currentAddressFormSubject;

  final _currentAddressFormErrorSubject =
      BehaviorSubject<KycAddressFormErrorState>.seeded(
          KycAddressFormErrorState());
  Stream<KycAddressFormErrorState> get currentAddressFormErrorState =>
      _currentAddressFormErrorSubject;

  final _workingAddressFormSubject =
      BehaviorSubject<KycAddressFormState>.seeded(KycAddressFormState());
  Stream<KycAddressFormState> get workingAddressFormState =>
      _workingAddressFormSubject;

  final _workingAddressFormErrorSubject =
      BehaviorSubject<KycAddressFormErrorState>.seeded(
          KycAddressFormErrorState());
  Stream<KycAddressFormErrorState> get workingAddressFormErrorState =>
      _workingAddressFormErrorSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final _canSubmitSubject = BehaviorSubject<bool>.seeded(false);
  Stream<bool> get canSubmitState => _canSubmitSubject;

  //address form controller
  final provinceTextController = TextEditingController();
  final districtTextController = TextEditingController();
  final subDistrictTextController = TextEditingController();
  final postCodeTextController = TextEditingController();
  final houseNumberTextController = TextEditingController();
  final mooNumberTextController = TextEditingController();
  final houseNameTextController = TextEditingController();
  final soiTextController = TextEditingController();
  final roadTextController = TextEditingController();

  final c_provinceTextController = TextEditingController();
  final c_districtTextController = TextEditingController();
  final c_subDistrictTextController = TextEditingController();
  final c_postCodeTextController = TextEditingController();
  final c_houseNumberTextController = TextEditingController();
  final c_mooNumberTextController = TextEditingController();
  final c_houseNameTextController = TextEditingController();
  final c_soiTextController = TextEditingController();
  final c_roadTextController = TextEditingController();

  final w_provinceTextController = TextEditingController();
  final w_districtTextController = TextEditingController();
  final w_subDistrictTextController = TextEditingController();
  final w_postCodeTextController = TextEditingController();
  final w_houseNumberTextController = TextEditingController();
  final w_mooNumberTextController = TextEditingController();
  final w_houseNameTextController = TextEditingController();
  final w_soiTextController = TextEditingController();
  final w_roadTextController = TextEditingController();

  Map<String, TextEditingController> get addressFormController =>
      <String, TextEditingController>{
        KycAddressFormStateFields.province: provinceTextController,
        KycAddressFormStateFields.district: districtTextController,
        KycAddressFormStateFields.subDistrict: subDistrictTextController,
        KycAddressFormStateFields.postCode: postCodeTextController,
        KycAddressFormStateFields.houseNumber: houseNumberTextController,
        KycAddressFormStateFields.moo: mooNumberTextController,
        KycAddressFormStateFields.soi: soiTextController,
        KycAddressFormStateFields.road: roadTextController,
        KycAddressFormStateFields.houseName: houseNameTextController,
      };

  Map<String, TextEditingController> get currentAddressFormController =>
      <String, TextEditingController>{
        KycAddressFormStateFields.province: c_provinceTextController,
        KycAddressFormStateFields.district: c_districtTextController,
        KycAddressFormStateFields.subDistrict: c_subDistrictTextController,
        KycAddressFormStateFields.postCode: c_postCodeTextController,
        KycAddressFormStateFields.houseNumber: c_houseNumberTextController,
        KycAddressFormStateFields.moo: c_mooNumberTextController,
        KycAddressFormStateFields.soi: c_soiTextController,
        KycAddressFormStateFields.road: c_roadTextController,
        KycAddressFormStateFields.houseName: c_houseNameTextController
      };

  Map<String, TextEditingController> get workingAddressFormController =>
      <String, TextEditingController>{
        KycAddressFormStateFields.province: w_provinceTextController,
        KycAddressFormStateFields.district: w_districtTextController,
        KycAddressFormStateFields.subDistrict: w_subDistrictTextController,
        KycAddressFormStateFields.postCode: w_postCodeTextController,
        KycAddressFormStateFields.houseNumber: w_houseNumberTextController,
        KycAddressFormStateFields.moo: w_mooNumberTextController,
        KycAddressFormStateFields.soi: w_soiTextController,
        KycAddressFormStateFields.road: w_roadTextController,
        KycAddressFormStateFields.houseName: w_houseNameTextController
      };
  //end

  @override
  void dispose() {
    _addressFormSubject.close();
    _addressFormErrorSubject.close();
    _currentAddressFormSubject.close();
    _currentAddressFormErrorSubject.close();
    _workingAddressFormSubject.close();
    _workingAddressFormErrorSubject.close();
    _routesSubject.close();
    _canSubmitSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {}

  void setKycViewModel(KycFinalViewModel viewModel) {
    _kycViewModel = viewModel;
  }

  void updateAddressFormState(Map<String, dynamic> updateValue) {
    final state = _addressFormSubject.value;
    _addressFormSubject.add(
      state.copyWith(updateValue),
    );
  }

  void updateAddressFormErrorState(Map<String, dynamic> updateValue) {
    final state = _addressFormErrorSubject.value;
    _addressFormErrorSubject.add(
      state.copyWith(updateValue),
    );
  }

  void updateCurrentAddressFormState(Map<String, dynamic> updateValue) {
    final state = _currentAddressFormSubject.value;
    _currentAddressFormSubject.add(
      state.copyWith(updateValue),
    );
  }

  void updateCurrentAddressFormErrorState(Map<String, dynamic> updateValue) {
    final state = _currentAddressFormErrorSubject.value;
    _currentAddressFormErrorSubject.add(
      state.copyWith(updateValue),
    );
  }

  void updateWorkingAddressFormState(Map<String, dynamic> updateValue) {
    final state = _workingAddressFormSubject.value;
    _workingAddressFormSubject.add(
      state.copyWith(updateValue),
    );
  }

  void updateWorkingAddressFormErrorState(Map<String, dynamic> updateValue) {
    final state = _workingAddressFormErrorSubject.value;
    _workingAddressFormErrorSubject.add(
      state.copyWith(updateValue),
    );
  }

  Future<void> onSelectProvince(AddressFormType formType) async {
    List<ProvinceModel> provinces = await JsonData.loadProvinces();
    _routesSubject.add(
      AppRouteSpec(
        name: RoutesConstant.selectItem,
        arguments: <String, dynamic>{
          SelectItemPageFields.pageTitle: S.current.selectProvinceHeadline,
          SelectItemPageFields.items: provinces
              .map(
                  (e) => SelectItem(title: e.provinceName, value: e.provinceId))
              .toList(),
          SelectItemPageFields.onSelect: (SelectItem item) {
            if (formType == AddressFormType.idCardAddress) {
              provinceTextController.value = TextEditingValue(text: item.title);
              districtTextController.value = TextEditingValue.empty;
              subDistrictTextController.value = TextEditingValue.empty;
              postCodeTextController.value = TextEditingValue.empty;
              updateAddressFormState(
                <String, dynamic>{
                  KycAddressFormStateFields.provinceId: item.value,
                  KycAddressFormStateFields.province: item.title,
                  KycAddressFormStateFields.district: '',
                  KycAddressFormStateFields.districtId: 0,
                  KycAddressFormStateFields.subDistrict: '',
                  KycAddressFormStateFields.subDistrictId: 0,
                  KycAddressFormStateFields.postCode: ''
                },
              );
            } else if (formType == AddressFormType.currentAddress) {
              c_provinceTextController.value =
                  TextEditingValue(text: item.title);
              c_districtTextController.value = TextEditingValue.empty;
              c_subDistrictTextController.value = TextEditingValue.empty;
              c_postCodeTextController.value = TextEditingValue.empty;
              updateCurrentAddressFormState(
                <String, dynamic>{
                  KycAddressFormStateFields.provinceId: item.value,
                  KycAddressFormStateFields.province: item.title,
                  KycAddressFormStateFields.district: '',
                  KycAddressFormStateFields.districtId: 0,
                  KycAddressFormStateFields.subDistrict: '',
                  KycAddressFormStateFields.subDistrictId: 0,
                  KycAddressFormStateFields.postCode: ''
                },
              );
            } else if (formType == AddressFormType.workingPlaceAddress) {
              w_provinceTextController.value =
                  TextEditingValue(text: item.title);
              w_districtTextController.value = TextEditingValue.empty;
              w_subDistrictTextController.value = TextEditingValue.empty;
              w_postCodeTextController.value = TextEditingValue.empty;
              updateWorkingAddressFormState(
                <String, dynamic>{
                  KycAddressFormStateFields.provinceId: item.value,
                  KycAddressFormStateFields.province: item.title,
                  KycAddressFormStateFields.district: '',
                  KycAddressFormStateFields.districtId: 0,
                  KycAddressFormStateFields.subDistrict: '',
                  KycAddressFormStateFields.subDistrictId: 0,
                  KycAddressFormStateFields.postCode: ''
                },
              );
            }
          }
        },
      ),
    );
  }

  Future<void> onSelectDistrict(AddressFormType formType) async {
    late final KycAddressFormState addressState;
    if (formType == AddressFormType.idCardAddress) {
      addressState = _addressFormSubject.value;
      if (addressState.provinceId == 0) return;
    } else if (formType == AddressFormType.currentAddress) {
      addressState = _currentAddressFormSubject.value;
      if (addressState.provinceId == 0) return;
    } else if (formType == AddressFormType.workingPlaceAddress) {
      addressState = _workingAddressFormSubject.value;
      if (addressState.provinceId == 0) return;
    }

    List<DistrictModel> districts = await JsonData.loadDistricts();

    _routesSubject.add(
      AppRouteSpec(
        name: RoutesConstant.selectItem,
        arguments: <String, dynamic>{
          SelectItemPageFields.pageTitle: S.current.selectDistrictHeadline,
          SelectItemPageFields.items: districts
              .where((e) => e.provinceId == addressState.provinceId)
              .map(
                  (e) => SelectItem(title: e.districtName, value: e.districtId))
              .toList(),
          SelectItemPageFields.onSelect: (SelectItem item) {
            if (formType == AddressFormType.idCardAddress) {
              districtTextController.value = TextEditingValue(text: item.title);
              subDistrictTextController.value = TextEditingValue.empty;
              updateAddressFormState(
                <String, dynamic>{
                  KycAddressFormStateFields.districtId: item.value,
                  KycAddressFormStateFields.district: item.title,
                  KycAddressFormStateFields.subDistrict: '',
                  KycAddressFormStateFields.subDistrictId: 0,
                  KycAddressFormStateFields.postCode: ''
                },
              );
            } else if (formType == AddressFormType.currentAddress) {
              c_districtTextController.value =
                  TextEditingValue(text: item.title);
              c_subDistrictTextController.value = TextEditingValue.empty;
              updateCurrentAddressFormState(
                <String, dynamic>{
                  KycAddressFormStateFields.districtId: item.value,
                  KycAddressFormStateFields.district: item.title,
                  KycAddressFormStateFields.subDistrict: '',
                  KycAddressFormStateFields.subDistrictId: 0,
                  KycAddressFormStateFields.postCode: ''
                },
              );
            } else if (formType == AddressFormType.workingPlaceAddress) {
              w_districtTextController.value =
                  TextEditingValue(text: item.title);
              w_subDistrictTextController.value = TextEditingValue.empty;
              updateWorkingAddressFormState(
                <String, dynamic>{
                  KycAddressFormStateFields.districtId: item.value,
                  KycAddressFormStateFields.district: item.title,
                  KycAddressFormStateFields.subDistrict: '',
                  KycAddressFormStateFields.subDistrictId: 0,
                  KycAddressFormStateFields.postCode: ''
                },
              );
            }
          }
        },
      ),
    );
  }

  Future<void> onSelectSubDistrict(AddressFormType formType) async {
    late final KycAddressFormState addressState;
    if (formType == AddressFormType.idCardAddress) {
      addressState = _addressFormSubject.value;
    } else if (formType == AddressFormType.currentAddress) {
      addressState = _currentAddressFormSubject.value;
    } else if (formType == AddressFormType.workingPlaceAddress) {
      addressState = _workingAddressFormSubject.value;
    }
    if (addressState.provinceId == 0 || addressState.districtId == 0) return;

    List<SubDistrictModel> subDistricts = await JsonData.loadSubDistricts();

    _routesSubject.add(
      AppRouteSpec(
        name: RoutesConstant.selectItem,
        arguments: <String, dynamic>{
          SelectItemPageFields.pageTitle: S.current.selectSubDistrictHeadline,
          SelectItemPageFields.items: subDistricts
              .where((e) =>
                  // e.provinceId == addressState.provinceId &&
                  e.districtId == addressState.districtId)
              .map((e) =>
                  SelectItem(title: e.subDistrictName, value: e.subDistrictId))
              .toList(),
          SelectItemPageFields.onSelect: (SelectItem item) {
            if (formType == AddressFormType.idCardAddress) {
              subDistrictTextController.value =
                  TextEditingValue(text: item.title);
              updateAddressFormState({
                KycAddressFormStateFields.subDistrictId: item.value,
                KycAddressFormStateFields.subDistrict: item.title,
              });
            } else if (formType == AddressFormType.currentAddress) {
              c_subDistrictTextController.value =
                  TextEditingValue(text: item.title);
              updateCurrentAddressFormState({
                KycAddressFormStateFields.subDistrictId: item.value,
                KycAddressFormStateFields.subDistrict: item.title,
              });
            } else if (formType == AddressFormType.workingPlaceAddress) {
              w_subDistrictTextController.value =
                  TextEditingValue(text: item.title);
              updateWorkingAddressFormState({
                KycAddressFormStateFields.subDistrictId: item.value,
                KycAddressFormStateFields.subDistrict: item.title,
              });
            }
            autoSelectPostCode(formType);
          }
        },
      ),
    );
  }

  Future<void> autoSelectPostCode(AddressFormType formType) async {
    late final KycAddressFormState addressState;
    if (formType == AddressFormType.idCardAddress) {
      addressState = _addressFormSubject.value;
    } else if (formType == AddressFormType.currentAddress) {
      addressState = _currentAddressFormSubject.value;
    } else if (formType == AddressFormType.workingPlaceAddress) {
      addressState = _workingAddressFormSubject.value;
    }

    if (addressState.provinceId == 0 ||
        addressState.districtId == 0 ||
        addressState.subDistrictId == 0) {
      return;
    }

    // List<PostCodeModel> postCodes = await JsonData.loadPostCodes();
    List<SubDistrictModel> subDistricts = await JsonData.loadSubDistricts();

    SubDistrictModel selectedPostCode = subDistricts
        .where((e) => e.subDistrictId == addressState.subDistrictId)
        .toList()
        .first;
    if (formType == AddressFormType.idCardAddress) {
      postCodeTextController.value =
          TextEditingValue(text: selectedPostCode.zipCode.toString());
      updateAddressFormState({
        KycAddressFormStateFields.postCode: selectedPostCode.zipCode.toString()
      });
    } else if (formType == AddressFormType.currentAddress) {
      c_postCodeTextController.value =
          TextEditingValue(text: selectedPostCode.zipCode.toString());
      updateCurrentAddressFormState({
        KycAddressFormStateFields.postCode: selectedPostCode.zipCode.toString()
      });
    } else if (formType == AddressFormType.workingPlaceAddress) {
      w_postCodeTextController.value =
          TextEditingValue(text: selectedPostCode.zipCode.toString());
      updateWorkingAddressFormState({
        KycAddressFormStateFields.postCode: selectedPostCode.zipCode.toString()
      });
    }
  }

  Future<String> onRequestSaveAddress() async {
    updateAddressFormState({KycAddressFormStateFields.isSubmit: true});
    // final addressFormStateError = _addressFormErrorSubject.value;
    final addressFormState = _addressFormSubject.value;

    // final currentAddressFormStateError = _currentAddressFormErrorSubject.value;
    final currentAddressFormState = _currentAddressFormSubject.value;

    final workingAddressFormState = _workingAddressFormSubject.value;

    // if (!validateForm(AddressFormType.idCardAddress)) {
    //   return ErrorStatus.invalidForm;
    // }

    // if (addressFormState.currentAddressIndex == 1 &&
    //     !validateForm(AddressFormType.currentAddress)) {
    //   return ErrorStatus.invalidForm;
    // }

    // if (addressFormState.workingPlaceAddressIndex == 1 &&
    //     !validateForm(AddressFormType.workingPlaceAddress)) {
    //   return ErrorStatus.invalidForm;
    // }

    try {
      await _firebaseService.saveAddressForm(addressFormState);
    } catch (e) {
      return ErrorStatus.firebaseFailed;
    }

    if (addressFormState.currentAddressIndex == 1) {
      try {
        await _firebaseService.saveCurrentAddressForm(currentAddressFormState);
      } catch (e) {
        return ErrorStatus.firebaseFailed;
      }
    } else {
      try {
        await _firebaseService.saveCurrentAddressForm(addressFormState);
      } catch (e) {
        return ErrorStatus.firebaseFailed;
      }
    }

    if (addressFormState.workingPlaceAddressIndex == 2) {
      try {
        await _firebaseService.saveWorkingAddressForm(workingAddressFormState);
      } catch (e) {
        return ErrorStatus.firebaseFailed;
      }
    } else if (addressFormState.workingPlaceAddressIndex == 1) {
      try {
        final currentAddress =
            await _firebaseService.getCurrentAddressFormState();
        await _firebaseService
            .saveWorkingAddressForm(currentAddress ?? KycAddressFormState());
      } catch (e) {
        return ErrorStatus.firebaseFailed;
      }
    } else {
      try {
        await _firebaseService.saveWorkingAddressForm(addressFormState);
      } catch (e) {
        return ErrorStatus.firebaseFailed;
      }
    }

    return ErrorStatus.nonError;
  }

  Future<void> onAddressFormSubmit() async {
    FocusManager.instance.primaryFocus?.unfocus();
    _kycViewModel.updateState({KycLevel2PageStateFields.isLoading: true});
    try {
      String result = await onRequestSaveAddress();
      // print(result);
      if (result == ErrorStatus.nonError) {
        final kycProgress = await _firebaseService.getKycProgress();
        final updateProgress = kycProgress.copyWith(
          {
            KycFinalPageStateFields.firstStepProgress:
                KycPageNames.occupation.name,
          },
        );
        await _firebaseService.setKycProgress(updateProgress);
      } else {
        throw Exception(result);
      }
      _kycViewModel.updateState({KycLevel2PageStateFields.isLoading: false});
    } catch (e) {
      _kycViewModel.updateState({KycLevel2PageStateFields.isLoading: false});
    }
  }

  String? onAddressFormValidate(
    String controllerName, {
    List<Enum> validateTypes = const [EnumValidateTypes.isNotEmpty],
  }) {
    final addressFormState = _addressFormSubject.value;
    final text = addressFormController[controllerName]?.value.text ?? '';
    if (addressFormState.isSubmit) {
      if (validateTypes.isNotEmpty) {
        if (validateTypes.contains(EnumValidateTypes.isNotEmpty)) {
          if (text.isEmpty) {
            return S.current.validateTextFieldIsEmpty;
          }
        }
      }
    }

    return null;
  }

  String? onCurrentAddressFormValidate(
    String controllerName, {
    List<Enum> validateTypes = const [EnumValidateTypes.isNotEmpty],
  }) {
    final addressFormState = _currentAddressFormSubject.value;
    final text = currentAddressFormController[controllerName]?.value.text ?? '';
    if (addressFormState.isSubmit &&
        addressFormState.currentAddressIndex == 1) {
      if (validateTypes.isNotEmpty) {
        if (validateTypes.contains(EnumValidateTypes.isNotEmpty)) {
          if (text.isEmpty) {
            return S.current.validateTextFieldIsEmpty;
          }
        }
      }
    }

    return null;
  }

  String? onWorkingAddressFormValidate(
    String controllerName, {
    List<Enum> validateTypes = const [EnumValidateTypes.isNotEmpty],
  }) {
    final addressFormState = _workingAddressFormSubject.value;
    final text = workingAddressFormController[controllerName]?.value.text ?? '';
    if (addressFormState.isSubmit &&
        addressFormState.currentAddressIndex == 1) {
      if (validateTypes.isNotEmpty) {
        if (validateTypes.contains(EnumValidateTypes.isNotEmpty)) {
          if (text.isEmpty) {
            return S.current.validateTextFieldIsEmpty;
          }
        }
      }
    }

    return null;
  }

  bool validateForm(AddressFormType formType) {
    late KycAddressFormState addressState;
    if (formType == AddressFormType.idCardAddress) {
      addressState = _addressFormSubject.value;
      if (addressState.houseNumber.isEmpty ||
          addressState.province.isEmpty ||
          addressState.district.isEmpty ||
          addressState.subDistrict.isEmpty ||
          addressState.postCode.isEmpty) {
        return false;
      }
    }
    if (formType == AddressFormType.currentAddress) {
      final mainAddressState = _addressFormSubject.value;
      addressState = _currentAddressFormSubject.value;
      if (mainAddressState.currentAddressIndex == 1) {
        if (addressState.houseNumber.isEmpty ||
            addressState.province.isEmpty ||
            addressState.district.isEmpty ||
            addressState.subDistrict.isEmpty ||
            addressState.postCode.isEmpty) {
          return false;
        }
      }
    }
    if (formType == AddressFormType.workingPlaceAddress) {
      addressState = _workingAddressFormSubject.value;
      final currentState = _currentAddressFormSubject.value;
      final mainAddressState = _addressFormSubject.value;
      if (mainAddressState.workingPlaceAddressIndex == 2) {
        if (addressState.houseNumber.isEmpty ||
            addressState.province.isEmpty ||
            addressState.district.isEmpty ||
            addressState.subDistrict.isEmpty ||
            addressState.postCode.isEmpty) {
          return false;
        }
      } else if (mainAddressState.workingPlaceAddressIndex == 1) {
        if (mainAddressState.currentAddressIndex == 1) {
          if (currentState.houseNumber.isEmpty ||
              currentState.province.isEmpty ||
              currentState.district.isEmpty ||
              currentState.subDistrict.isEmpty ||
              currentState.postCode.isEmpty) {
            return false;
          }
        }
      }
    }

    return true;
  }

  Future<void> getCurrentData() async {
    final idCardAddressState = await _firebaseService.getAddressFormState();
    final currentAddressState =
        await _firebaseService.getCurrentAddressFormState();

    if (idCardAddressState != null) {
      updateAddressFormState(
        KycAddressFormStatePersistence().toJson(
          idCardAddressState,
        ),
      );

      //set value id card address form
      final addressJson =
          KycAddressFormStatePersistence().toJson(idCardAddressState);
      for (final key in addressJson.keys) {
        if (addressFormController[key] != null) {
          addressFormController[key]!.value = TextEditingValue(
            text: addressJson[key].toString(),
          );
        }
      }
      //end
    }

    if (currentAddressState != null) {
      updateCurrentAddressFormState(
        KycAddressFormStatePersistence().toJson(
          currentAddressState,
        ),
      );

      //set value current address form
      final currentAddressJson =
          KycAddressFormStatePersistence().toJson(currentAddressState);
      for (final key in currentAddressJson.keys) {
        if (currentAddressFormController[key] != null) {
          currentAddressFormController[key]!.value = TextEditingValue(
            text: currentAddressJson[key].toString(),
          );
        }
      }
      //end
    }
  }

  void formListener() {
    _addressFormSubject.listen((value) {
      reCheckData();
    });
    _currentAddressFormSubject.listen((value) {
      reCheckData();
    });
    _workingAddressFormSubject.listen((value) {
      reCheckData();
    });
  }

  void reCheckData() {
    final addressValid = validateForm(AddressFormType.idCardAddress);
    final currentAddressValid = validateForm(AddressFormType.currentAddress);
    final workingAddressValid =
        validateForm(AddressFormType.workingPlaceAddress);

    if (addressValid && currentAddressValid && workingAddressValid) {
      _canSubmitSubject.add(true);
    } else {
      _canSubmitSubject.add(false);
    }
  }
}
