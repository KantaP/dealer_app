import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/constants/assets.dart';
import 'package:aconnec_1109_x/src/constants/enums.dart';
import 'package:aconnec_1109_x/src/model/payment_item.m.dart';

class PaymentStaticValue {
  PaymentStaticValue._();
  static final payments = [
    PaymentItemModel(
      label: S.current.dropdownPaymentChoice1,
      recommend: true,
      icon: AssetIcons.qr24,
      value: PaymentChannel.qr.name,
    ),
    PaymentItemModel(
      label: S.current.dropdownPaymentChoice2,
      icon: AssetIcons.swap24,
      value: PaymentChannel.dd.name,
    ),
    PaymentItemModel(
      label: S.current.dropdownPaymentChoice3,
      icon: AssetIcons.bookBank24,
      value: PaymentChannel.dc.name,
    ),
  ];
}
