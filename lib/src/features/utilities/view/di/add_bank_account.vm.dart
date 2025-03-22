import 'dart:io';

import 'package:aconnec_1109_x/src/constants/firebase_storage.dart';
import 'package:aconnec_1109_x/src/model/request_user_bank_account.m.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/banks.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/add_bank_account.st.dart';
import 'package:aconnec_1109_x/src/features/utilities/service/utilitiy.firebase.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class AddBankAccountViewModel extends ViewModel {
  final UtilityFirebaseService _utilityFirebaseService;

  AddBankAccountViewModel(this._utilityFirebaseService);

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final _stateSubject = BehaviorSubject.seeded(AddBankAccountPageState());
  Stream<AddBankAccountPageState> get state => _stateSubject;

  final _formSubject = BehaviorSubject.seeded(AddBankAccountFormState());
  Stream<AddBankAccountFormState> get formState => _formSubject;
  //controller
  final TextEditingController bankAccountNameController =
      TextEditingController();
  final TextEditingController bankAccountBranchController =
      TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController bankAccountNumberController =
      TextEditingController();

  Map<String, TextEditingController> get formControllers => {
        AddBankAccountFormStateFields.bankAccountName:
            bankAccountNameController,
        AddBankAccountFormStateFields.bankAccountBranch:
            bankAccountBranchController,
        AddBankAccountFormStateFields.bankAccountNumber:
            bankAccountNumberController,
        AddBankAccountFormStateFields.bankName: bankNameController,
      };
  //end

  @override
  void dispose() {
    _routesSubject.close();
    _formSubject.close();
    _stateSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(state.copyWith(updateValue));
  }

  void updateFormState(Map<String, dynamic> updateValue) {
    final formState = _formSubject.value;
    _formSubject.add(formState.copyWith(updateValue));
  }

  void goBack() {
    _routesSubject.add(const AppRouteSpec.pop());
  }

  BankItemModel getBankData() {
    final formstate = _formSubject.value;
    final bank =
        BankData.bankList.where((e) => e.code == formstate.bankCode).toList();
    return bank[0];
  }

  Future<void> goToSelectBank() async {
    final result =
        await Navigator.of(NavigationService.navigatorKey.currentContext!)
            .pushNamed(RoutesConstant.selectBank) as Map<String, dynamic>;
    final bank =
        BankData.bankList.where((e) => e.code == result['callback']).toList();
    updateFormState(
      {
        AddBankAccountFormStateFields.bankCode: result['callback'],
        AddBankAccountFormStateFields.bankName: bank[0].label
      },
    );
    bankNameController.value = TextEditingValue(text: bank[0].label);
  }

  Future<void> onUploadBookBank() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      updateFormState({
        AddBankAccountFormStateFields.bookBankImage: image.path,
        AddBankAccountFormStateFields.uploadBookBank: true,
      });
    }
  }

  void onRemoveBookBank() {
    updateFormState({
      AddBankAccountFormStateFields.bookBankImage: '',
      AddBankAccountFormStateFields.uploadBookBank: false,
    });
  }

  bool validateForm() {
    final formState = _formSubject.value;

    if (formState.bankAccountBranch.isEmpty) return false;
    if (formState.bankAccountName.isEmpty) return false;
    if (formState.bankAccountNumber.isEmpty) return false;
    if (formState.bankName.isEmpty) return false;
    if (formState.uploadBookBank == false) return false;

    return true;
  }

  Future<void> submit() async {
    updateState({AddBankAccountPageStateFiedls.isLoading: true});
    try {
      final formState = _formSubject.value;

      await Future.delayed(const Duration(milliseconds: 1000));
      File imgFile = File(formState.bookBankImagePath);
      final uplodPath = await _utilityFirebaseService.uploadFile(
        FirebaseStorageValue.bookBankRef,
        imgFile,
        'book-bank-${formState.bankAccountNumber}-${formState.bankCode}',
      );

      final request = UserBankAccountModel(
        bankAccountName: formState.bankAccountName,
        bankAccountNumber: formState.bankAccountNumber,
        branchCode: formState.bankAccountBranch,
        bankCode: formState.bankCode,
        bookBankStoragePath: uplodPath,
        bankStatus: 'pending',
        bankName: formState.bankName,
      );
      await _utilityFirebaseService.addBankAccount(request);

      updateState({AddBankAccountPageStateFiedls.isLoading: false});
      _routesSubject.add(const AppRouteSpec.pop());
    } catch (e) {
      //Sentry.captureException(e);

      updateState({AddBankAccountPageStateFiedls.isLoading: false});
      DialogUtils.showToast(msg: S.current.somethingWentWrong);
    }
  }
}
