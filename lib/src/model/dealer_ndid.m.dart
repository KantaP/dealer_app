import 'package:aconnec_1109_x/src/model/model.abs.dart';

class DealerNdidModel implements Model<DealerNdidModel> {
  int _id = 0;
  String _dealerName = '';
  String _dealerImgUrl = '';

  DealerNdidModel({
    final int id = 0,
    final String dealerName = '',
    final String dealerImgUrl = '',
  }) {
    _id = id;
    _dealerName = dealerName;
    _dealerImgUrl = dealerImgUrl;
  }

  int get id => _id;
  String get dealerName => _dealerName;
  String get dealerImgUrl => _dealerImgUrl;

  @override
  DealerNdidModel copyWith(Map<String, dynamic> value) {
    return DealerNdidModel(
      id: value[DealerNdidModelFields.id] ?? _id,
      dealerName: value[DealerNdidModelFields.dealerName] ?? _dealerName,
      dealerImgUrl: value[DealerNdidModelFields.dealerImgUrl] ?? _dealerImgUrl,
    );
  }
}

class DealerNdidModelFields {
  DealerNdidModelFields._();

  static const String id = 'id';
  static const String dealerName = 'dealerName';
  static const String dealerImgUrl = 'dealerImgUrl';
}
