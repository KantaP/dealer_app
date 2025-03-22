import 'package:aconnec_1109_x/src/core/custom_stream_subject.dart';
import 'package:aconnec_1109_x/src/features/transaction/model/transaction_download.st.dart';
import 'package:aconnec_1109_x/src/features/transaction/service/di/transaction.firebase.dart';
import 'package:aconnec_1109_x/src/model/firestore/request_statement.m.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:aconnec_1109_x/src/core/view_model/app_routes.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model_new.abs.dart';
import 'package:aconnec_1109_x/src/utilities/dialog.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:rxdart/rxdart.dart';

enum HistoryDocType {
  statement,
  taxInvoice,
}

@Injectable()
class TransactionDownloadViewModel
    extends CustomViewModel<TransactionDownloadPageState> {
  final TransactionFirebaseService _firebaseService;

  TransactionDownloadViewModel(this._firebaseService);

  // final _stateSubject = BehaviorSubject<TransactionDownloadPageState>.seeded(
  //     const TransactionDownloadPageState());

  // Stream<TransactionDownloadPageState> get state => _stateSubject;

  final stateSubject = CustomStreamSubject<TransactionDownloadPageState>(
      const TransactionDownloadPageState());

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    _routesSubject.close();
    stateSubject.dispose();
  }

  @override
  void updateState(TransactionDownloadPageState updateValue) {
    stateSubject.subject.add(updateValue);
  }

  Future<void> onSelectStartDate() async {
    int lastYear = DateTime.now().year;
    int lastMonth = DateTime.now().month;
    int lastDate = DateTime.now().day;
    final currentDate = DateTime.now();
    // print(lastYear);
    DateTime? pickedDate = await showDatePicker(
      context: NavigationService.navigatorKey.currentContext!,
      initialDate: currentDate,
      firstDate: DateTime(lastYear, lastMonth - 6, lastDate),
      lastDate: currentDate,
    );
    if (pickedDate != null) {
      final dateFormat = DateFormat('dd-MM-yyyy');
      startDateController.value = TextEditingValue(
        text: dateFormat.format(pickedDate),
      );
      final newState =
          stateSubject.subject.value.copyWith(startDate: pickedDate.toString());
      updateState(newState);
    }

    return;
  }

  Future<void> onSelectEndDate() async {
    // int lastYear = DateTime.now().year;
    // int lastMonth = DateTime.now().month;
    // int lastDate = DateTime.now().day;
    final currentDate = DateTime.now();
    // print(lastYear);
    final pageState = stateSubject.subject.value;
    final startDateStateValue = pageState.startDate ?? '';
    if (startDateStateValue.isEmpty) return;
    final startDate = (startDateStateValue.isEmpty)
        ? DateTime.now()
        : DateTime.parse(startDateStateValue);

    DateTime? pickedDate = await showDatePicker(
      context: NavigationService.navigatorKey.currentContext!,
      initialDate: startDate,
      firstDate: startDate,
      lastDate: currentDate,
    );
    if (pickedDate != null) {
      final dateFormat = DateFormat('dd-MM-yyyy');
      endDateController.value = TextEditingValue(
        text: dateFormat.format(pickedDate),
      );

      final newState =
          stateSubject.subject.value.copyWith(endDate: pickedDate.toString());
      updateState(newState);
    }

    return;
  }

  bool canSubmit() {
    final pageState = stateSubject.subject.value;
    // if ((pageState.docType ?? '').isEmpty) {
    //   return false;
    // }
    if ((pageState.startDate ?? '').isEmpty) {
      return false;
    }
    if ((pageState.endDate ?? '').isEmpty) {
      return false;
    }

    if ((pageState.email ?? '').isEmpty) {
      return false;
    } else {
      final bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(pageState.email!);

      if (emailValid == false) return false;
    }

    return true;
  }

  Future<void> onSubmit() async {
    try {
      final pageState = stateSubject.subject.value;
      final dateFormat = DateFormat('dd-MM-yyyy');

      final request = RequestStatementModel(
        channel: 'email',
        fromDate: pageState.startDate!,
        toDate: pageState.endDate!,
        email: pageState.email!,
        requestDate: DateTime.now().toString(),
      );

      final requestId = await _firebaseService.addRequestStatement(request);
      DialogUtils.showToast(msg: 'Request successfully.');
      NavigationService.back(NavigationResult(true));
    } on Exception catch (e) {
      DialogUtils.showToast(msg: e.toString(), type: 'error');
    }
  }
}
