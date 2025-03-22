import 'dart:io';

import 'package:aconnec_1109_x/src/features/kyc/model/suiteable_question.st.dart';
import 'package:aconnec_1109_x/src/model/politic_question.m.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/widgets/custom_radio_field.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/error_status.dart';
import 'package:aconnec_1109_x/src/constants/firebase_storage.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/constants/strings.dart';
import 'package:aconnec_1109_x/src/data/local/json_data.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/address.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/fund.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/enums/form_type.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/select_item.st.dart';
import 'package:aconnec_1109_x/src/model/district.m.dart';
import 'package:aconnec_1109_x/src/model/occupation.m.dart';
import 'package:aconnec_1109_x/src/model/province.m.dart';
import 'package:aconnec_1109_x/src/model/sub_district.m.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../widgets/custom_checkbox_field.dart';

enum SelectOccupation {
  normal,
  another,
}

@Injectable()
class KycFundViewModel extends ViewModel {
  final KycFirebaseService _firebaseService;
  KycFundViewModel(this._firebaseService);

  late final KycFinalViewModel _kycViewModel;

  final _fundPageState =
      BehaviorSubject<KycFundPageState>.seeded(KycFundPageState());
  Stream<KycFundPageState> get fundPageState => _fundPageState;

  final _fundFormSubject =
      BehaviorSubject<KycFundFormState>.seeded(KycFundFormState());

  Stream<KycFundFormState> get fundFormState => _fundFormSubject;

  final _fundFormErrorSubject =
      BehaviorSubject<KycFundFormErrorState>.seeded(KycFundFormErrorState());

  Stream<KycFundFormErrorState> get fundFormErrorState => _fundFormErrorSubject;

  final _workingAddressFormSubject =
      BehaviorSubject<KycAddressFormState>.seeded(KycAddressFormState());
  Stream<KycAddressFormState> get workingAddressFormState =>
      _workingAddressFormSubject;

  final _workingAddressFormErrorSubject =
      BehaviorSubject<KycWorkingAddressFormErrorState>.seeded(
          KycWorkingAddressFormErrorState());

  Stream<KycWorkingAddressFormErrorState> get workingAddressFormErrorState =>
      _workingAddressFormErrorSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  //working place form controller
  final w_provinceTextController = TextEditingController();
  final w_districtTextController = TextEditingController();
  final w_subDistrictTextController = TextEditingController();
  final w_postCodeTextController = TextEditingController();
  final w_addressNumberTextController = TextEditingController();
  final w_mooNumberTextController = TextEditingController();
  final w_houseNameTextController = TextEditingController();
  final w_soiTextController = TextEditingController();
  final w_roadTextController = TextEditingController();
  Map<String, TextEditingController> get workingPlaceAddressControllers =>
      <String, TextEditingController>{
        KycAddressFormStateFields.province: w_provinceTextController,
        KycAddressFormStateFields.district: w_districtTextController,
        KycAddressFormStateFields.subDistrict: w_subDistrictTextController,
        KycAddressFormStateFields.postCode: w_postCodeTextController,
        KycAddressFormStateFields.houseNumber: w_addressNumberTextController,
        KycAddressFormStateFields.moo: w_mooNumberTextController,
        KycAddressFormStateFields.soi: w_soiTextController,
        KycAddressFormStateFields.road: w_roadTextController,
        KycAddressFormStateFields.houseName: w_houseNameTextController,
      };
  //end

  //fund form controller
  final occupationGroupController = TextEditingController();
  final occupationController = TextEditingController();
  final anotherOccupationGroupController = TextEditingController();
  final anotherOccupationController = TextEditingController();
  final workingPlaceNameController = TextEditingController();
  final salaryRangeController = TextEditingController();
  final anotherJobSalaryController = TextEditingController();
  final occupationOtherController = TextEditingController();
  final anotherOccupationOtherController = TextEditingController();
  // final hasAnotherJobController = TextEditingController();
  Map<String, TextEditingController> get fundFormControllers =>
      <String, TextEditingController>{
        KycFundFormStateFields.occupationGroupName: occupationGroupController,
        KycFundFormStateFields.occupation: occupationController,
        // KycFundFormStateFields.workingPlaceName: workingPlaceNameController,
        // KycFundFormStateFields.salaryRange: salaryRangeController,
        KycFundFormStateFields.anotherJobSalaryRange:
            anotherJobSalaryController,
        KycFundFormStateFields.showAnotherSubOccupationOther:
            anotherOccupationOtherController,
        KycFundFormStateFields.showSubOccupationOther:
            occupationOtherController,
        KycFundFormStateFields.anotherOccupationGroupName:
            anotherOccupationGroupController,
        KycFundFormStateFields.anotherOccupationName:
            anotherOccupationController,
      };
  //end

  @override
  void dispose() {
    _fundFormSubject.close();
    _fundFormErrorSubject.close();
    _workingAddressFormSubject.close();
    _workingAddressFormErrorSubject.close();
    _routesSubject.close();
    _fundPageState.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _fundPageState.value;
    _fundPageState.add(state.copyWith(updateValue));
  }

  void setKycViewModel(KycFinalViewModel viewModel) {
    _kycViewModel = viewModel;
  }

  void updateFundFormState(Map<String, dynamic> updateValue) {
    final state = _fundFormSubject.value;
    _fundFormSubject.add(
      state.copyWith(updateValue),
    );
  }

  void updateFundFormErrorState(Map<String, dynamic> updateValue) {
    final state = _fundFormErrorSubject.value;
    _fundFormErrorSubject.add(
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

  Future<void> onSelectOccupations(SelectOccupation mode) async {
    List<OccupationGroupModel> groups = await JsonData.loadOccupationGroup();
    _routesSubject.add(
      AppRouteSpec(
        name: RoutesConstant.selectItem,
        arguments: <String, dynamic>{
          SelectItemPageFields.pageTitle: S.current.selectOccupationTitle,
          SelectItemPageFields.items: groups
              .map((e) => SelectItem(title: e.groupName, value: e.id))
              .toList(),
          SelectItemPageFields.onSelect: (SelectItem item) {
            final groupIndex = groups.indexWhere((e) => e.id == item.value);
            final groupItem = groups[groupIndex];
            if (mode == SelectOccupation.normal) {
              occupationGroupController.value =
                  TextEditingValue(text: item.title);
              occupationController.value = TextEditingValue.empty;

              updateFundFormState(
                <String, dynamic>{
                  KycFundFormStateFields.occupationGroupId: item.value,
                  KycFundFormStateFields.occupationGroupScore: groupItem.score,
                  KycFundFormStateFields.occupationGroupName: item.title,
                  KycFundFormStateFields.occupationId: 0,
                  KycFundFormStateFields.occupationScore: 0,
                  KycFundFormStateFields.occupation: '',
                  KycFundFormStateFields.anotherJob: false,
                  KycFundFormStateFields.anotherJobSalaryRange: '',
                  KycFundFormStateFields.anotherJobDocument: '',
                  KycFundFormStateFields.anotherJobAssetDocument: '',
                  KycFundFormStateFields.uploadAnotherJobDoc: false,
                  KycFundFormStateFields.uploadAnotherJobAssetDoc: false,
                  KycFundFormStateFields.anotherOccupationGroupId: 0,
                  KycFundFormStateFields.anotherOccupationGroupName: '',
                  KycFundFormStateFields.anotherOccupationGroupScore: 0,
                  KycFundFormStateFields.anotherOccupationId: 0,
                  KycFundFormStateFields.anotherOccupationName: '',
                  KycFundFormStateFields.anotherOccupationScore: 0,
                  KycFundFormStateFields.showSubOccupation:
                      groupItem.hasSubOccupation,
                  KycFundFormStateFields.showAnotherSubOccupation: false,
                  KycFundFormStateFields.showAnotherSubOccupationOther: false,
                  KycFundFormStateFields.showSubOccupationOther: false,
                },
              );
            } else {
              anotherOccupationGroupController.value =
                  TextEditingValue(text: item.title);
              anotherOccupationController.value = TextEditingValue.empty;
              updateFundFormState(
                <String, dynamic>{
                  KycFundFormStateFields.anotherOccupationGroupId: item.value,
                  KycFundFormStateFields.anotherOccupationGroupName: item.title,
                  KycFundFormStateFields.anotherOccupationGroupScore:
                      groupItem.score,
                  KycFundFormStateFields.showAnotherSubOccupation:
                      groupItem.hasSubOccupation,
                  KycFundFormStateFields.showAnotherSubOccupationOther: false,
                },
              );
            }
          }
        },
      ),
    );
  }

  Future<void> onSelectOccupationList(SelectOccupation mode) async {
    List<OccupationListItemModel> groups =
        await JsonData.loadOccupationListItems();
    final formState = _fundFormSubject.value;
    _routesSubject.add(
      AppRouteSpec(
        name: RoutesConstant.selectItem,
        arguments: <String, dynamic>{
          SelectItemPageFields.pageTitle:
              S.current.kycFundOccuptationSelectHeadline,
          SelectItemPageFields.items: groups
              .where((e) => e.groupId == formState.occupationGroupId)
              .map((e) => SelectItem(title: e.occupationName, value: e.id))
              .toList(),
          SelectItemPageFields.onSelect: (SelectItem item) {
            final groupIndex = groups.indexWhere((e) => e.id == item.value);
            final groupItem = groups[groupIndex];
            if (mode == SelectOccupation.normal) {
              occupationController.value = TextEditingValue(text: item.title);

              updateFundFormState(
                <String, dynamic>{
                  KycFundFormStateFields.occupationId: groupItem.id,
                  KycFundFormStateFields.occupationScore: groupItem.score,
                  KycFundFormStateFields.occupation: groupItem.occupationName,
                  KycFundFormStateFields.showSubOccupationOther:
                      groupItem.needInformation,
                },
              );
            } else {
              anotherOccupationController.value =
                  TextEditingValue(text: item.title);
              updateFundFormState(
                <String, dynamic>{
                  KycFundFormStateFields.anotherOccupationId: groupItem.id,
                  KycFundFormStateFields.anotherOccupationScore:
                      groupItem.score,
                  KycFundFormStateFields.anotherOccupationName:
                      groupItem.occupationName,
                  KycFundFormStateFields.showAnotherSubOccupationOther:
                      groupItem.needInformation,
                },
              );
            }
          }
        },
      ),
    );
  }

  Future<void> onSelectProvince(AddressFormType formType) async {
    final KycAddressFormState addressState = _workingAddressFormSubject.value;

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
            w_provinceTextController.value = TextEditingValue(text: item.title);
            w_districtTextController.value = TextEditingValue.empty;
            w_subDistrictTextController.value = TextEditingValue.empty;
            w_postCodeTextController.value = TextEditingValue.empty;
            updateWorkingAddressFormState(
              <String, dynamic>{
                KycAddressFormStateFields.provinceId: item.value,
                KycAddressFormStateFields.province: item.title,
                KycAddressFormStateFields.districtId: 0,
                KycAddressFormStateFields.district: '',
                KycAddressFormStateFields.subDistrictId: 0,
                KycAddressFormStateFields.subDistrict: '',
                KycAddressFormStateFields.postCode: ''
              },
            );
          }
        },
      ),
    );
  }

  Future<void> onSelectDistrict(AddressFormType formType) async {
    final KycAddressFormState addressState = _workingAddressFormSubject.value;
    if (addressState.provinceId == 0) return;

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
            w_districtTextController.value = TextEditingValue(text: item.title);
            w_subDistrictTextController.value = TextEditingValue.empty;
            updateWorkingAddressFormState(
              <String, dynamic>{
                KycAddressFormStateFields.districtId: item.value,
                KycAddressFormStateFields.district: item.title,
                KycAddressFormStateFields.subDistrictId: 0,
                KycAddressFormStateFields.subDistrict: '',
                KycAddressFormStateFields.postCode: ''
              },
            );
          }
        },
      ),
    );
  }

  Future<void> onSelectSubDistrict(AddressFormType formType) async {
    final KycAddressFormState addressState = _workingAddressFormSubject.value;

    if (addressState.provinceId == 0 || addressState.districtId == 0) return;

    List<SubDistrictModel> subDistricts = await JsonData.loadSubDistricts();

    _routesSubject.add(
      AppRouteSpec(
        name: RoutesConstant.selectItem,
        arguments: <String, dynamic>{
          SelectItemPageFields.pageTitle: S.current.selectSubDistrictHeadline,
          SelectItemPageFields.items: subDistricts
              .where((e) =>
                  e.provinceId == addressState.provinceId &&
                  e.districtId == addressState.districtId)
              .map((e) =>
                  SelectItem(title: e.subDistrictName, value: e.subDistrictId))
              .toList(),
          SelectItemPageFields.onSelect: (SelectItem item) {
            w_subDistrictTextController.value =
                TextEditingValue(text: item.title);
            updateWorkingAddressFormState(
              <String, dynamic>{
                KycAddressFormStateFields.subDistrictId: item.value,
                KycAddressFormStateFields.subDistrict: item.title,
              },
            );
            autoSelectPostCode(formType);
          }
        },
      ),
    );
  }

  Future<void> autoSelectPostCode(AddressFormType formType) async {
    final KycAddressFormState addressState = _workingAddressFormSubject.value;

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
    w_postCodeTextController.value =
        TextEditingValue(text: selectedPostCode.zipCode.toString());
    _workingAddressFormSubject.add(
      addressState.copyWith(
        <String, dynamic>{
          KycAddressFormStateFields.postCode:
              selectedPostCode.zipCode.toString()
        },
      ),
    );
  }

  Future<String> onRequestSaveFund() async {
    updateFundFormState({KycAddressFormStateFields.isSubmit: true});
    final fundFormState = _fundFormSubject.value;

    try {
      await _firebaseService.saveFundForm(fundFormState);
      if (fundFormState.anotherJob == true) {
        if (!fundFormState.anotherJobDocument.contains('http')) {
          final fullPath = await uploadImage(
            imgPath: fundFormState.anotherJobDocument,
            uploadPath: FirebaseStorageValue.fundAnotherJobDoc,
            fileName: FirebaseStorageValue.anotherJobDocNameFile,
          );
          await _firebaseService.saveKycDocument(
              KycDocuments.anotherJobDoc.name, fullPath);
        }
        if (!fundFormState.anotherJobAssetDocument.contains('http')) {
          final fullPath = await uploadImage(
            imgPath: fundFormState.anotherJobAssetDocument,
            uploadPath: FirebaseStorageValue.fundAnotherJobAssetDoc,
            fileName: FirebaseStorageValue.anotherJobAssetDocNameFile,
          );
          await _firebaseService.saveKycDocument(
              KycDocuments.anotherJobDocAsset.name, fullPath);
        }
      }
    } catch (e) {
      return ErrorStatus.firebaseFailed;
    }

    return ErrorStatus.nonError;
  }

  Future<void> onFundFormSubmit() async {
    FocusManager.instance.primaryFocus?.unfocus();
    _kycViewModel.updateState({KycLevel2PageStateFields.isLoading: true});
    try {
      String result = await onRequestSaveFund();

      if (result == ErrorStatus.nonError) {
        final kycProgress = await _firebaseService.getKycProgress();
        final updateProgress = kycProgress.copyWith({
          KycLevel2PageStateFields.currentStepIndex: 1,
          KycLevel2PageStateFields.secondStepProgress:
              KycPageNames.suiteableTestIntroduction.name,
        });
        await _firebaseService.setKycProgress(updateProgress);
        await _firebaseService
            .updateKycStatus(StaticValue.personalCheckComplete);
      } else {
        throw Exception(result);
      }
      _kycViewModel.updateState({KycLevel2PageStateFields.isLoading: false});
    } catch (e) {
      //Sentry.captureException(e);
      DialogUtils.showToast(msg: S.current.somethingWentWrong, type: 'error');
      _kycViewModel.updateState({KycLevel2PageStateFields.isLoading: false});
    }
  }

  String? onFundFormValidate(
    String controllerName, {
    List<Enum> validateTypes = const [EnumValidateTypes.isNotEmpty],
  }) {
    final fundFormState = _fundFormSubject.value;
    final text = fundFormControllers[controllerName]?.value.text ?? '';
    if (fundFormState.isSubmit) {
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
    final fundFormState = _fundFormSubject.value;
    final text =
        workingPlaceAddressControllers[controllerName]?.value.text ?? '';
    if (fundFormState.isSubmit && fundFormState.workingPlaceAddressIndex == 1) {
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

  Future<void> onUploadAnotherJobDocument() async {
    try {
      final ImagePicker picker = ImagePicker();
      // Pick an image
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      updateFundFormState({
        KycFundFormStateFields.anotherJobDocument: image?.path ?? '',
        KycFundFormStateFields.uploadAnotherJobDoc: true,
      });
    } catch (e) {
      //Sentry.captureException(e);
      DialogUtils.showToast(msg: S.current.somethingWentWrong, type: 'error');
    }
  }

  Future<void> onUploadAnotherJobAssetDocument() async {
    try {
      final ImagePicker picker = ImagePicker();
      // Pick an image
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      updateFundFormState({
        KycFundFormStateFields.anotherJobAssetDocument: image?.path ?? '',
        KycFundFormStateFields.uploadAnotherJobAssetDoc: true,
      });
    } catch (e) {
      //Sentry.captureException(e);
      DialogUtils.showToast(msg: S.current.somethingWentWrong, type: 'error');
    }
  }

  bool validateForm() {
    final KycFundFormState fundState = _fundFormSubject.value;

    if (fundState.occupation.isEmpty || fundState.occupationId == 0) {
      return false;
    }

    return true;
  }

  bool validateAnotherJob() {
    final KycFundFormState fundState = _fundFormSubject.value;
    // print(fundState.uploadAnotherJobDoc);
    if (fundState.uploadAnotherJobDoc == false ||
        fundState.uploadAnotherJobAssetDoc == false) {
      return false;
    }

    return true;
  }

  bool validateWorkingAddressForm() {
    final KycAddressFormState addressState = _workingAddressFormSubject.value;

    if (addressState.houseNumber.isEmpty ||
        addressState.moo.isEmpty ||
        addressState.province.isEmpty ||
        addressState.district.isEmpty ||
        addressState.subDistrict.isEmpty ||
        addressState.postCode.isEmpty) {
      return false;
    }

    return true;
  }

  Future<String> uploadImage({
    required String imgPath,
    required String uploadPath,
    required String fileName,
  }) {
    File file = File(imgPath);
    return _firebaseService.uploadFile(
      uploadPath,
      file,
      fileName,
    );
  }

  Future<void> getCurrentData() async {
    final fundState = await _firebaseService.getFundFormState();
    final workingAddress = await _firebaseService.getWorkingAddressState();

    final fundJson = KycFundFormStatePersistence().toJson(fundState);
    updateFundFormState(
      {
        ...fundJson,
        KycFundFormStateFields.editMode: true,
      },
    );

    for (final key in fundJson.keys) {
      if (fundFormControllers[key] != null) {
        fundFormControllers[key]!.value = TextEditingValue(
          text: fundJson[key],
        );
      }
    }

    if (fundState.uploadAnotherJobDoc == true) {
      final imagePath = await getAnotherJobDocImage();
      updateFundFormState({
        KycFundFormStateFields.anotherJobDocument: imagePath,
      });
    }
    if (fundState.uploadAnotherJobAssetDoc == true) {
      final imagePath = await getAnotherJobAssetDocImage();
      updateFundFormState({
        KycFundFormStateFields.anotherJobAssetDocument: imagePath,
      });
    }

    if (workingAddress != null) {
      updateWorkingAddressFormState(
        KycAddressFormStatePersistence().toJson(workingAddress),
      );

      //set value id card address form
      final addressJson =
          KycAddressFormStatePersistence().toJson(workingAddress);
      for (final key in addressJson.keys) {
        if (workingPlaceAddressControllers[key] != null) {
          workingPlaceAddressControllers[key]!.value = TextEditingValue(
            text: addressJson[key].toString(),
          );
        }
      }
      //end
    }
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

  Future<List<PoliticQuestionModel>> loadPoliticQuestions() async {
    final questions = await JsonData.loadPoliticQuestions();
    updateState({
      KycFundPageStateFields.politicQuestions: questions,
    });
    return questions;
  }

  void selectAnswer({String? id, String? answerId, int? point, String? type}) {
    final formState = _fundFormSubject.value;
    final userChoices = formState.politicAnswers;
    final oldAnswer = userChoices.where((e) => e.questionId == id).toList();
    if (oldAnswer.isNotEmpty) {
      var newAnswer = List<UserChoiceModel>.from(userChoices);
      newAnswer = newAnswer.map(
        (e) {
          if (e.questionId == id) {
            final List<String> answer = [];
            answer.add(answerId ?? '');
            e = e.copyWith({
              UserChoiceModelFields.answerId: answer,
              UserChoiceModelFields.point: point
            });
          }
          return e;
        },
      ).toList();
      if (newAnswer.length == 2) {
        //check answer 1
        final answer1 = newAnswer[0];
        if (answer1.point == 0) {
          newAnswer.removeAt(1);
        }
      }
      updateFundFormState(
        {KycFundFormStateFields.politicAnswers: newAnswer},
      );
    } else {
      var newAnswer = List<UserChoiceModel>.from(userChoices);
      newAnswer.add(
        UserChoiceModel(
          questionId: id.toString(),
          answerId: [answerId ?? '0'],
          point: point ?? 0,
        ),
      );
      updateFundFormState(
        {KycFundFormStateFields.politicAnswers: newAnswer},
      );
    }
  }

  List<CheckboxValue>? generateCheckboxValue(String questionId) {
    try {
      final pageState = _fundPageState.value;
      final formState = _fundFormSubject.value;
      final userChoices = formState.politicAnswers
          .where((e) => e.questionId == questionId)
          .toList();
      if (userChoices.isNotEmpty) {
        final userChoice = userChoices.first;
        final question = pageState.politicQuestions
            .where((e) => e.id == questionId)
            .toList()
            .first;

        final answers = question.answers
            .where((e) => userChoice.answerId.contains(e.id))
            .toList();
        final List<CheckboxValue> selecteValue = answers
            .map((e) => CheckboxValue(
                title: e.answer?.th ?? '',
                value: '${e.id.toString()}_${e.point.toString()}'))
            .toList();
        return selecteValue;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  RadioValue? generateRadioValue(String questionId) {
    try {
      final pageState = _fundPageState.value;
      final formState = _fundFormSubject.value;
      final userChoices = formState.politicAnswers
          .where((e) => e.questionId == questionId)
          .toList();
      if (userChoices.isNotEmpty) {
        final userChoice = userChoices.first;
        final question = pageState.politicQuestions
            .where((e) => e.id == questionId)
            .toList()
            .first;
        final answer = question.answers
            .where((e) => e.id == userChoice.answerId[0])
            .toList()
            .first;
        final selecteValue = RadioValue(
            title: answer.answer?.th.toString() ?? '',
            value: '${answer.id.toString()}_${answer.point.toString()}');
        return selecteValue;
      }
      return null;
    } catch (e) {
      //Sentry.captureException(e);
      return null;
    }
  }

  Future<List<OccupationGroupModel>> loadOccupationGroups() async {
    final groups = await JsonData.loadOccupationGroup();
    return groups;
  }

  Future<List<OccupationListItemModel>> loadOccupationListItem() async {
    final items = await JsonData.loadOccupationListItems();
    return items;
  }

  bool canSubmit() {
    final state = _fundFormSubject.value;
    if (state.occupationGroupId == 0) return false;
    if (state.showSubOccupation) {
      if (state.occupationId == 0) return false;
    }
    if (state.politicAnswers.length < 2) return false;
    if (state.workingPlaceName.isEmpty) return false;

    if (state.anotherJob == true) {
      if (state.anotherOccupationGroupId == 0) return false;
      if (state.anotherOccupationId == 0) return false;
      if (state.anotherJobSalaryRange.isEmpty) {
        return false;
      }
      if (state.uploadAnotherJobDoc == false) {
        return false;
      }
      if (state.uploadAnotherJobAssetDoc == false) {
        return false;
      }
    }
    return true;
  }
}
