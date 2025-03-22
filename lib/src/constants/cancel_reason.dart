import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/model/cancel_reason.m.dart';

class CancelReasonStaticValue {
  CancelReasonStaticValue._();

  static List<CancelReasonModel> reasons = [
    // CancelReasonModel(
    //     id: 1,
    //     reasonValue: 1,
    //     codeValue: 'SELECT_WRONG',
    //     transalateText: S.current.cancel_SELECT_WRONG),
    CancelReasonModel(
        id: 2,
        reasonValue: 2,
        codeValue: 'TECHNICAL',
        transalateText: S.current.cancel_TECHNICAL),
    CancelReasonModel(
        id: 3,
        reasonValue: 3,
        codeValue: 'TRANSFER_LIMIT',
        transalateText: S.current.cancel_TRANSFER_LIMIT),
    CancelReasonModel(
        id: 4,
        reasonValue: 4,
        codeValue: 'HOW_TO_PAY',
        transalateText: S.current.cancel_HOW_TO_PAY),
    CancelReasonModel(
        id: 5,
        reasonValue: 5,
        codeValue: 'OTHER',
        transalateText: S.current.cancel_OTHER),
  ];
}
