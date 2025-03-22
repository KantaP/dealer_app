import 'package:aconnec_1109_x/src/model/cloudfunction/update_dopa_status_function/request_update_dopa_status.m.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/utilities/date_time.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/error_status.dart';
import 'package:aconnec_1109_x/src/features/kyc/model/kyc_new.st.dart';
import 'package:aconnec_1109_x/src/features/kyc/service/di/kyc.firebase.dart';
import 'package:aconnec_1109_x/src/features/kyc/view/di/kyc_new.vm.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/utilities/encrypted.dart';
import 'package:aconnec_1109_x/src/utilities/identity.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:aconnec_1109_x/src/widgets/custom_dialog_box.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

import '../../model/information.st.dart';

@Injectable()
class KycInformationViewModel extends ViewModel {
  final KycFirebaseService _firebaseService;
  KycInformationViewModel(this._firebaseService);

  final logger = Logger('kyc-information-view-model');

  late final KycFinalViewModel _kycViewModel;

  final _informationFormSubject =
      BehaviorSubject<KycInformationFormState>.seeded(
          KycInformationFormState());
  Stream<KycInformationFormState> get informationFormState =>
      _informationFormSubject;

  final _informationFormErrorSubject =
      BehaviorSubject<KycInformationFormErrorState>.seeded(
          KycInformationFormErrorState());
  Stream<KycInformationFormErrorState> get informationFormErrorState =>
      _informationFormErrorSubject;

  final _informationFormSubmitState =
      BehaviorSubject<KycInformationFormSubmitState>.seeded(
          KycInformationFormSubmitState());
  Stream<KycInformationFormSubmitState> get informationFormSubmitState =>
      _informationFormSubmitState;

  //information form controller
  final firstNameEngController = TextEditingController();
  final lastNameEngController = TextEditingController();
  final firstNameThaiController = TextEditingController();
  final lastNameThaiController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final idCardController = TextEditingController();
  final laserIdCardController = TextEditingController();
  final genderController = TextEditingController();
  final idCardExpireAtController = TextEditingController();

  Map<String, TextEditingController> get informationFormControllers =>
      <String, TextEditingController>{
        KycInformationFormStateFields.firstNameEng: firstNameEngController,
        KycInformationFormStateFields.lastNameEng: lastNameEngController,
        KycInformationFormStateFields.firstNameThai: firstNameThaiController,
        KycInformationFormStateFields.lastNameThai: lastNameThaiController,
        KycInformationFormStateFields.dateOfBirth: dateOfBirthController,
        KycInformationFormStateFields.idCard: idCardController,
        KycInformationFormStateFields.laserIdCard: laserIdCardController,
        KycInformationFormStateFields.gender: genderController,
        KycInformationFormStateFields.idCardExpireAt: idCardExpireAtController,
      };
  //end

  late BuildContext _pageContext;

  @override
  void dispose() {
    _informationFormSubject.close();
    _informationFormErrorSubject.close();
    _informationFormSubmitState.close();
    informationFormControllers.keys.map(
      (e) => informationFormControllers[e]!.dispose(),
    );
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {}

  void setKycViewModel(KycFinalViewModel viewModel) {
    _kycViewModel = viewModel;
  }

  void setPageContext(BuildContext context) {
    _pageContext = context;
  }

  void updateInformationFormState(Map<String, dynamic> updateValue) {
    final state = _informationFormSubject.value;
    _informationFormSubject.add(
      state.copyWith(updateValue),
    );
  }

  void updateInformationFormErrorState(Map<String, dynamic> updateValue) {
    final state = _informationFormErrorSubject.value;
    _informationFormErrorSubject.add(
      state.copyWith(updateValue),
    );
  }

  void updateFormSubmitState(Map<String, dynamic> updateValue) {
    final state = _informationFormSubmitState.value;
    _informationFormSubmitState.add(
      state.copyWith(updateValue),
    );
  }

  void onInformationValidate(
    String controllerName, {
    List<Enum> validateTypes = const [EnumValidateTypes.isNotEmpty],
  }) {
    // final informationFormSubmitState = _informationFormSubmitState.value;
    final text = informationFormControllers[controllerName]?.value.text ?? '';
    if (text.isEmpty) return;
    // if (informationFormSubmitState.canSubmit) {
    if (validateTypes.isNotEmpty) {
      if (validateTypes.contains(EnumValidateTypes.isNotEmpty)) {
        if (text.isEmpty) {
          updateInformationFormErrorState({
            controllerName: S.current.validateTextFieldIsEmpty,
          });
          return;
        }
      }
      if (validateTypes.contains(EnumValidateTypes.isLaserIdCard)) {
        if (text.length < 13) {
          // updateInformationFormErrorState({
          //   controllerName: S.current.validateTextLaserIdCardPrefix,
          // });
          return;
        }
      }
      if (validateTypes.contains(EnumValidateTypes.isIdCard)) {
        if (text.length < 13) {
          // updateInformationFormErrorState({
          //   controllerName: S.current.validateTextIdCard,
          // });
          return;
        } else {
          if (UtilsIdentity.checkIdCardDigits(text) == false) {
            updateInformationFormErrorState({
              controllerName: S.current.validateTextIdCard,
            });
            return;
          }
        }
      }
      updateInformationFormErrorState(
        {controllerName: ''},
      );
      return;
    }
  }

  Future<String> onRequestSaveInformation() async {
    final informationFormError = _informationFormErrorSubject.value;
    if (informationFormError.hasError) {
      return ErrorStatus.invalidForm;
    }

    updateInformationFormState(
        {KycInformationFormStateFields.gender: genderController.text});

    final informationFormState = _informationFormSubject.value;

    if (informationFormState.idCard.isNotEmpty) {
      try {
        final idCardEncrypted =
            EncryptedUtils.encrypt(informationFormState.idCard);
        final empty = await _firebaseService.checkIdCard(idCardEncrypted);
        if (empty == false) {
          return ErrorStatus.duplicateIdCard;
        }
      } catch (e) {
        // print(e);
        return ErrorStatus.firebaseFailed;
      }
    }

    //check DoPa
    try {
      final birthDateSplit = informationFormState.dateOfBirth.split('-');
      final birthDate = DateTimeUtils.dateTimeFormat(
        DateTime(
          int.parse(birthDateSplit[2]),
          int.parse(birthDateSplit[1]),
          int.parse(birthDateSplit[0]),
        ),
        'yyyyMMdd',
      );
      final responseDopa = await _firebaseService.updateDopaStatus(
        request: RequestUpdateDopaStatusModel(
          pid: informationFormState.idCard,
          firstName: informationFormState.firstNameThai,
          lastName: informationFormState.lastNameThai,
          birthDay: birthDate,
          laser: informationFormState.laserIdCard.replaceAll('-', ''),
        ),
      );
      if (responseDopa.dopaCheckStatus == false) {
        return ErrorStatus.dopaFailed;
      }
    } catch (e) {
      // print(e);
      return ErrorStatus.firebaseFailed;
    }

    try {
      await _firebaseService.saveInformationForm(informationFormState);
    } catch (e) {
      return ErrorStatus.firebaseFailed;
    }

    return ErrorStatus.nonError;
  }

  Future<void> onInformationFormSubmit() async {
    FocusManager.instance.primaryFocus?.unfocus();
    _kycViewModel.updateState({KycFinalPageStateFields.isLoading: true});

    String result = await onRequestSaveInformation();
    // print(result);
    if (result == ErrorStatus.nonError) {
      final kycProgress = await _firebaseService.getKycProgress();
      final updateProgress = kycProgress.copyWith({
        KycFinalPageStateFields.firstStepProgress:
            KycPageNames.personalCheck.name
      });

      await _firebaseService.setKycProgress(updateProgress);
    } else if (result == ErrorStatus.duplicateIdCard) {
      duplicateIdCardAlert();
    } else if (result == ErrorStatus.dopaFailed) {
      dopaFailedAlert();
    } else {
      DialogUtils.showToast(msg: S.current.somethingWentWrong);
    }
    _kycViewModel.updateState({KycFinalPageStateFields.isLoading: false});
  }

  void duplicateIdCardAlert() {
    DialogUtils.customShowDialog(
      context: NavigationService.navigatorKey.currentContext!,
      dialog: (BuildContext _) => CustomDialogAlert(
        title: Text(
          S.current.noticeDialogTitle,
          style: titleStyle,
        ),
        descriptions: Text(
          S.current.idCardDuplicate,
          style: paragraph1RegularStyle?.copyWith(color: darkGreyColor),
          textAlign: TextAlign.center,
        ),
        submitButton: ElevatedButton(
          style: elevatedButton,
          onPressed: () {
            Navigator.of(NavigationService.navigatorKey.currentContext!).pop();
          },
          child: Text(
            S.current.submitButton,
          ),
        ),
      ),
    );
  }

  void dopaFailedAlert() {
    DialogUtils.customShowDialog(
      context: NavigationService.navigatorKey.currentContext!,
      dialog: (BuildContext _) => CustomDialogAlert(
        title: Text(
          S.current.dopaFailedTitle,
          style: titleStyle,
        ),
        descriptions: Text(
          S.current.dopaFailedMessage,
          style: paragraph1RegularStyle?.copyWith(color: darkGreyColor),
          textAlign: TextAlign.center,
        ),
        submitButton: ElevatedButton(
          style: elevatedButton,
          onPressed: () {
            NavigationService.back(NavigationResult(null));
          },
          child: Text(
            S.current.okButton,
          ),
        ),
      ),
    );
  }

  void formStateListener() {
    _informationFormSubject.listen((value) {
      updateFormSubmitState({'canSubmit': validateController()});
      return;
    });
  }

  bool validateController() {
    final errorFormState = _informationFormErrorSubject.value;
    final formState = _informationFormSubject.value;
    if (errorFormState.firstNameEng == null ||
        formState.firstNameEng.isEmpty ||
        errorFormState.firstNameEng!.isNotEmpty) {
      return false;
    }
    if (errorFormState.firstNameThai == null ||
        formState.firstNameThai.isEmpty ||
        errorFormState.firstNameThai!.isNotEmpty) {
      return false;
    }
    if (errorFormState.lastNameEng == null ||
        formState.lastNameEng.isEmpty ||
        errorFormState.lastNameEng!.isNotEmpty) {
      return false;
    }
    if (errorFormState.lastNameThai == null ||
        formState.lastNameThai.isEmpty ||
        errorFormState.lastNameThai!.isNotEmpty) {
      return false;
    }
    if (errorFormState.gender == null ||
        formState.gender.isEmpty ||
        errorFormState.gender!.isNotEmpty) {
      return false;
    }
    if (errorFormState.dateOfBirth == null ||
        formState.dateOfBirth.isEmpty ||
        errorFormState.dateOfBirth!.isNotEmpty) {
      return false;
    }
    if (errorFormState.idCard == null ||
        formState.idCard.isEmpty ||
        errorFormState.idCard!.isNotEmpty) {
      return false;
    }
    if (errorFormState.laserIdCard == null ||
        formState.laserIdCard.isEmpty ||
        errorFormState.laserIdCard!.isNotEmpty) {
      return false;
    }
    if (formState.idCardLifetime == false) {
      if (errorFormState.idCardExpireAt == null ||
          formState.idCardExpireAt.isEmpty ||
          errorFormState.idCardExpireAt!.isNotEmpty) {
        return false;
      }
    }

    return true;
  }

  void controllerListener() {
    informationFormControllers.forEach((key, value) {
      informationFormControllers[key]!.addListener(() {
        if (key == KycInformationFormStateFields.idCard) {
          onInformationValidate(
            KycInformationFormStateFields.idCard,
            validateTypes: [
              EnumValidateTypes.isNotEmpty,
              EnumValidateTypes.isIdCard
            ],
          );
        } else if (key == KycInformationFormStateFields.laserIdCard) {
          onInformationValidate(
            KycInformationFormStateFields.laserIdCard,
            validateTypes: [
              EnumValidateTypes.isNotEmpty,
              EnumValidateTypes.isLaserIdCard
            ],
          );
        } else {
          onInformationValidate(
            key,
          );
        }
      });
    });
  }
}
