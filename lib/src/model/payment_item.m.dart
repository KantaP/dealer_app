import 'package:aconnec_1109_x/src/model/model.abs.dart';

class PaymentItemModel implements Model<PaymentItemModel> {
  String _label = '';
  bool _recommend = false;
  String _icon = '';
  String _value = '';

  PaymentItemModel(
      {String label = '',
      bool recommend = false,
      String icon = '',
      String value = ''}) {
    _label = label;
    _recommend = recommend;
    _icon = icon;
    _value = value;
  }

  String get label => _label;
  String get icon => _icon;
  bool get recommend => _recommend;
  String get value => _value;

  @override
  PaymentItemModel copyWith(Map<String, dynamic> value) {
    return PaymentItemModel(
      label: value[PaymentItemModelFields.label] ?? _label,
      icon: value[PaymentItemModelFields.icon] ?? _icon,
      recommend: value[PaymentItemModelFields.recommend] ?? _recommend,
      value: value[PaymentItemModelFields.value] ?? _value,
    );
  }
}

class PaymentItemModelFields {
  PaymentItemModelFields._();

  static const String label = 'label';
  static const String icon = 'icon';
  static const String recommend = 'recommend';
  static const String value = 'value';
}
