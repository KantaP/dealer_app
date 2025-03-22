import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';

class BankData {
  BankData._();
  static final List<BankItemModel> bankList = [
    BankItemModel(
        code: 'scb',
        label: 'Siam Commercial Bank',
        image: Assets.icons.bankIcons.scb.path),
    BankItemModel(
        code: 'ktb', label: 'Krung Thai Bank', image: Assets.icons.ktb.path),
    BankItemModel(
        code: 'kbank',
        label: 'Kasikornbank',
        image: Assets.icons.bankIcons.kbank.path),
    BankItemModel(
        code: 'bbl',
        label: 'Bangkok Bank',
        image: Assets.icons.bankIcons.bbl.path),
    BankItemModel(
        code: 'ttb',
        label: 'TMBThanachart Bank',
        image: Assets.icons.bankIcons.ttb.path),
    BankItemModel(
        code: 'gsb',
        label: 'Government Savings Bank',
        image: Assets.icons.bankIcons.gsb.path),
    BankItemModel(
        code: 'bay',
        label: 'Bank of Ayudhaya',
        image: Assets.icons.bankIcons.bay.path),
    BankItemModel(
        code: 'baac',
        label: 'Bank for Agriculture and Agricultural Cooperatives',
        image: Assets.icons.bankIcons.baac.path),
    BankItemModel(
        code: 'cimb',
        label: 'CIMB Thai Bank',
        image: Assets.icons.bankIcons.cimb.path),
    BankItemModel(
        code: 'kkp',
        label: 'Kiatnakin Phatra Bank',
        image: Assets.icons.bankIcons.kkpb.path),
    BankItemModel(
      code: 'ghb',
      label: 'Government Housing Bank',
      image: Assets.icons.bankIcons.ghb.path,
    ),
  ];

  static BankItemModel? findBank(String code) =>
      bankList.firstWhere((e) => e.code.toLowerCase() == code.toLowerCase());
}

class BankItemModel implements Model<BankItemModel> {
  String _code = '';
  String _label = '';
  String _image = '';

  BankItemModel({
    String code = '',
    String label = '',
    String image = '',
  }) {
    _code = code;
    _label = label;
    _image = image;
  }

  String get code => _code;
  String get label => _label;
  String get image => _image;

  @override
  BankItemModel copyWith(Map<String, dynamic> value) {
    return BankItemModel(
      code: value['code'] ?? _code,
      label: value['label'] ?? _label,
      image: value['image'] ?? _image,
    );
  }
}
