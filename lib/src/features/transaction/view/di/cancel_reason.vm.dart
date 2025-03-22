import 'dart:async';

import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/order_cancel_arguments.dart';
import 'package:aconnec_1109_x/src/features/transaction/service/di/order.service.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_cancel.m.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/cancel_reason.st.dart';
import 'package:aconnec_1109_x/src/features/transaction/service/di/transaction.firebase.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../constants/enums.dart';
import '../../../../core/custom_stream_subject.dart';
import '../../../../model/cloudfunction/on_call_pure_fiat_function/pure_fiat_cancel.m.dart';
import '../../../../model/cloudfunction/on_call_pure_fiat_function/pure_fiat_open_check.m.dart';
import '../../../../model/realtime_database/coin_price.m.dart';
import '../../../authenticate/bindings/authenticate.binding.dart';
import '../../../bank/bindings/bank.binding.dart';
import '../../model/cancel_reason_radio.st.dart';

@Injectable()
class CancelReasonViewModel extends ViewModel {
  final TransactionFirebaseService _firebaseService;
  final OrderFunctionService _orderService;
  CancelReasonViewModel(this._firebaseService, this._orderService);

  final _routesSubject = PublishSubject<AppRouteSpec>();

  Stream<AppRouteSpec> get routes => _routesSubject;

  final _stateSubject =
      BehaviorSubject<CancelReasonPageState>.seeded(CancelReasonPageState());
  Stream<CancelReasonPageState> get state => _stateSubject;

  final radioSubject =
      CustomStreamSubject<CancelReasonRadio>(const CancelReasonRadio());

  final TextEditingController otherTextController = TextEditingController();
  late StreamSubscription<DatabaseEvent> _transactionPaymentTracking;

  final _authenticationFirebaseService =
      AuthenticateBinding.authenticationFirebaseService;

  final _bankFirebaseService = BankBinding.bankFirebaseService;

  @override
  void dispose() {
    _routesSubject.close();
    _stateSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(state.copyWith(updateValue));
  }

  void goBack() {
    _routesSubject.add(const AppRouteSpec.pop());
  }

  Future<void> submit(int idOrder, String refCode) async {
    updateState({
      CancelReasonPageStateFields.isLoading: true,
    });
    try {
      Future.delayed(const Duration(milliseconds: 1000));
      await _orderService.orderCancel(
        RequestOrderCancelModel(
          idOrder: idOrder,
          cancelReason:
              '${radioSubject.subject.value.selectedChoice} ${otherTextController.text}',
          ref: refCode,
        ),
      );
      try {
        final user = await _authenticationFirebaseService.getCurrentUser();
        final result = await _bankFirebaseService.pureFiatOpenCheck(
            params: PureFiatOpenCheckRequest(
                idUser: user.uid, paymentType: PureFiatType.trxfiat.name));
      
        await _bankFirebaseService.pureFiatCancel(
            params: PureFiatCancelRequest(
                idPureFiat: result.idPureFiat,
                cancelReason:
                    '${radioSubject.subject.value.selectedChoice} ${otherTextController.text}',
                refcode: result.refcode));
      } catch (e) {
        print('no purefiat order');
      }
      updateState({
        CancelReasonPageStateFields.isLoading: false,
      });
      NavigationService.toReplacementWithNamed(RoutesConstant.orderCancel,
          arguments:
              OrderCancelArgumentsScreen(idOrder: idOrder, refCode: refCode));
      // _routesSubject.add(
      //   AppRouteSpec(
      //     name: RoutesConstant.orderCancel,
      //     arguments:
      //         OrderCancelArgumentsScreen(idOrder: idOrder, refCode: refCode),
      //     action: AppRouteAction.replaceWith,
      //   ),
      // );
    } catch (e) {
      print(e);
      DialogUtils.showToast(msg: S.current.somethingWentWrong, type: 'error');
      updateState({
        CancelReasonPageStateFields.isLoading: false,
      });
    }
  }
}
