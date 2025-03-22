import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/constants/routes.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/transaction_history.st.dart';
import 'package:aconnec_1109_x/src/features/transaction/service/di/order.service.dart';
import 'package:aconnec_1109_x/src/features/transaction/service/di/transaction.firebase.dart';
import 'package:aconnec_1109_x/src/model/cloudfunction/order_function/order_list.m.dart';
import 'package:aconnec_1109_x/src/model/request_payment_transaction.m.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model.abs.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

class TransactionListItem {
  int? id;
  String? label;
  Function()? onTap;
  TransactionListItem({
    this.id,
    this.label,
    this.onTap,
  });
}

class TransactionListFilterItem {
  int? id;
  String? label;
  String? value;
  TransactionListFilterItem({
    this.id,
    this.label,
    this.value,
  });
}

@Injectable()
class TransactionHistoryViewModel extends ViewModel {
  final TransactionFirebaseService _firebaseService;
  final OrderFunctionService _orderService;

  TransactionHistoryViewModel(this._firebaseService, this._orderService);

  final List<TransactionListFilterItem> buySellFilterStatus = [
    TransactionListFilterItem(
      id: 1,
      label: S.current.transactionHistoryBuySellFilterStatus1,
      value: S.current.transactionHistoryBuySellFilterStatus1,
    ),
    TransactionListFilterItem(
      id: 2,
      label: S.current.transactionHistoryBuySellFilterStatus2,
      value: S.current.transactionHistoryBuySellFilterStatus3,
    ),
    TransactionListFilterItem(
      id: 3,
      label: S.current.transactionHistoryBuySellFilterStatus3,
      value: S.current.transactionHistoryBuySellFilterStatus3,
    ),
    TransactionListFilterItem(
      id: 4,
      label: S.current.transactionHistoryBuySellFilterStatus4,
      value: S.current.transactionHistoryBuySellFilterStatus4,
    ),
    TransactionListFilterItem(
      id: 5,
      label: 'Cancelled',
      value: 'Cancelled',
    )
  ];

  final List<TransactionListItem> menuList = [
    TransactionListItem(label: S.current.HistoryTabBuy, onTap: () {}, id: 1),
    TransactionListItem(label: S.current.HistoryTabSell, onTap: () {}, id: 2),
    // TransactionListItem(
    //     label: S.current.transactionHistoryListMenu3, onTap: () {}, id: 3),
    // TransactionListItem(
    //     label: S.current.transactionHistoryListMenu4, onTap: () {}, id: 4),
    // TransactionListItem(
    //     label: S.current.transactionHistoryListMenu5, onTap: () {}, id: 5),
  ];

  final List<TransactionListFilterItem> filters = [
    TransactionListFilterItem(
      id: 1,
      label: S.current.all,
      value: ListFilter.all.name,
    ),
    TransactionListFilterItem(
      id: 2,
      label: S.current.pending,
      value: ListFilter.pending.name,
    ),
    TransactionListFilterItem(
      id: 3,
      label: S.current.complete,
      value: ListFilter.complete.name,
    ),
    TransactionListFilterItem(
      id: 4,
      label: S.current.canceled,
      value: ListFilter.canceled.name,
    )
  ];

  final _routesSubject = PublishSubject<AppRouteSpec>();

  Stream<AppRouteSpec> get routes => _routesSubject;

  final _stateSubject = BehaviorSubject<TransactionHistoryPageState>.seeded(
      TransactionHistoryPageState());
  Stream<TransactionHistoryPageState> get state => _stateSubject;

  final _loadingStateSubject =
      BehaviorSubject<TransactionHistoryLoadingState>.seeded(
          TransactionHistoryLoadingState());
  Stream<TransactionHistoryLoadingState> get loadingState =>
      _loadingStateSubject;

  @override
  void dispose() {
    _routesSubject.close();
    _stateSubject.close();
    _loadingStateSubject.close();
  }

  @override
  void updateState(Map<String, dynamic> updateValue) {
    final state = _stateSubject.value;
    _stateSubject.add(state.copyWith(updateValue));
  }

  void updateLoadingState(Map<String, dynamic> updateValue) {
    final state = _loadingStateSubject.value;
    _loadingStateSubject.add(state.copyWith(updateValue));
  }

  void goBack() {
    _routesSubject.add(const AppRouteSpec.pop());
  }

  void selecteMenu(int id) {
    updateState({TransactionHistoryPageStateFields.selectedMenuIndex: id});
  }

  void selectFilter(int id) {
    updateState({TransactionHistoryPageStateFields.selectedFilterIndex: id});
  }

  Future<List<PaymentTransactionModel>> getHistories() async {
    try {
      updateLoadingState({'isLoading': true});
      await Future.delayed(const Duration(milliseconds: 1000));
      final data = await _firebaseService.getPaymentTransactions(
          transactionType: getTransactionTypeSelected(),
          status: getStatusSelected());
      updateLoadingState({'isLoading': false});
      return data;
    } catch (e) {
      //Sentry.captureException(e);
      updateLoadingState({'isLoading': false});
      return [];
    }
  }

  String? getTransactionTypeSelected() {
    final state = _stateSubject.value;
    if (state.selectedMenuIndex == 1) {
      return 'buy';
    }
    if (state.selectedMenuIndex == 2) {
      return 'sell';
    }
    return null;
  }

  String? getStatusSelected() {
    final state = _stateSubject.value;
    if (state.selectedFilterIndex == 1) {
      return filters[0].value ?? '';
    }
    if (state.selectedFilterIndex == 2) {
      return filters[1].value ?? '';
    }
    if (state.selectedFilterIndex == 3) {
      return filters[2].value ?? '';
    }
    if (state.selectedFilterIndex == 4) {
      return filters[3].value ?? '';
    }
    if (state.selectedFilterIndex == 5) {
      return filters[4].value ?? '';
    }
    return null;
  }

  List<TransactionListFilterItem> getFilterMenu() {
    final menu = getTransactionTypeSelected();
    if (menu == 'buy' || menu == 'sell') {
      return buySellFilterStatus;
    }
    return [];
  }

  void goToDownload() {
    _routesSubject
        .add(const AppRouteSpec(name: RoutesConstant.transactioDownload));
  }

  Future<ResponseOrderListModel> loadOrderList() async {
    try {
      final state = _stateSubject.value;

      final orderSide = state.selectedMenuIndex == 1 ? 'buy' : 'sell';
      String? status;
      switch (state.selectedFilterIndex) {
        case 2:
          status = OrderStatus.topay.name;
        case 3:
          status = OrderStatus.toreceive.name;
        case 4:
          status = OrderStatus.completed.name;
        case 5:
          status = OrderStatus.cancelled.name;
        default:
      }
      final list = await _orderService.orderList(RequestOrderListModel(
        orderSide: orderSide,
        status: status,
      ));

      return list;
    } catch (e) {
      //Sentry.captureException(e);
      throw Exception(e);
    }
  }

  Future<bool> goToHome() async {
    _routesSubject.add(const AppRouteSpec(
        name: RoutesConstant.home, action: AppRouteAction.replaceAllWith));
    return false;
  }
}
