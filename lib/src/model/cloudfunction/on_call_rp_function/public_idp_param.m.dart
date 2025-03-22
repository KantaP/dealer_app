import 'package:aconnec_1109_x/src/model/model.abs.dart';

class PublicIdpParamModel implements Model<PublicIdpParamModel> {
  int _identifier = 0;

  PublicIdpParamModel({
    int identifier = 0,
  }) {
    _identifier = identifier;
  }

  int get identifier => _identifier;

  @override
  PublicIdpParamModel copyWith(Map<String, dynamic> value) {
    return PublicIdpParamModel(
      identifier: value[PublicIdpParamModelFields.identifier] ?? _identifier,
    );
  }
}

class PublicIdpParamModelFields {
  PublicIdpParamModelFields._();
  static const String identifier = 'identifier';
}
