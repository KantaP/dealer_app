import 'package:aconnec_1109_x/src/features/utilities/model/select_payment_arguments.dart';
import 'package:flutter/material.dart';
import 'package:aconnec_1109_x/src/constants/payment.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/features/authenticate/service/di/authentication.firebase.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/dropdown_payment.st.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/select_payment.st.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class SelectPaymentViewModel extends ViewModel {
  final AuthenticationFirebaseService _firebaseService;
  SelectPaymentViewModel(this._firebaseService);

  final _routesSubject = PublishSubject<AppRouteSpec>();

  Stream<AppRouteSpec> get routes => _routesSubject;

  final _stateSubject = BehaviorSubject.seeded(SelectPaymentPageState());
  Stream<SelectPaymentPageState> get state => _stateSubject;

  final _formSubject = BehaviorSubject.seeded(SelectPaymentFormState());
  Stream<SelectPaymentFormState> get formState => _formSubject;

  final payments = PaymentStaticValue.payments;

  final TextEditingController dropdownController = TextEditingController();

  @override
  void dispose() {
    _routesSubject.close();
    _stateSubject.close();
    _formSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(state.copyWith(updateValue));
  }

  void updateFormState(Map<String, dynamic> updateValue) {
    final state = _formSubject.value;
    _formSubject.add(state.copyWith(updateValue));
  }

  void goBack() {
    _routesSubject.add(const AppRouteSpec.pop());
  }

  void addBank() {
    _routesSubject.add(const AppRouteSpec(name: RoutesConstant.addBankAccount));
  }

  void selectPayment() {
    _routesSubject.add(
      AppRouteSpec(name: RoutesConstant.dropdownPayment, arguments: {
        DropdownPaymentPageStateFields.onSelect: onSelectPayment
      }),
    );
  }

  void onSelectPayment(String selectedValue) {
    final paymentSelected =
        payments.where((e) => e.value == selectedValue).toList();

    updateFormState(
        {SelectPaymentFormStateFields.selectedPayment: paymentSelected[0]});
    dropdownController.value = TextEditingValue(text: paymentSelected[0].label);
  }

  Future<void> getMyBanks() async {
    updateState({
      SelectPaymentPageStateFields.isLoading: true,
    });
    final user = await _firebaseService.getCurrentUser();
    final bankList = user.bankAccount;
    await Future.delayed(const Duration(milliseconds: 1000));
    updateState({
      SelectPaymentPageStateFields.myBanks: bankList,
      SelectPaymentPageStateFields.initDone: true,
      SelectPaymentPageStateFields.isLoading: false,
    });
  }

  bool validate() {
    final formState = _formSubject.value;
    if (formState.selectedBank.bankAccountNumber.isEmpty) return false;
    if (formState.selectedBank.bankStatus != 'verified') return false;
    // if (formState.selectedPayment.value.isEmpty) return false;
    return true;
  }

  void submit() {
    final formState = _formSubject.value;

    _routesSubject.add(
      AppRouteSpec.pop(
        arguments: SelectPaymentCallbackArgument(
          bankData: formState.selectedBank,
          index: formState.selectedBankIndex,
        ),
      ),
    );
  }
}
