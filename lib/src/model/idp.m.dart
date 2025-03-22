import 'package:aconnec_1109_x/src/model/model.abs.dart';

class IdpModel implements Model<IdpModel> {
  String _code = '';
  String _name = '';
  String _id = '';

  IdpModel({String code = '', String name = '', String id = ''}) {
    _code = code;
    _name = name;
    _id = id;
  }

  String get code => _code;
  String get id => _id;
  String get name => _name;

  @override
  IdpModel copyWith(Map<String, dynamic> value) {
    return IdpModel(
      code: value[IdpModelFields.code] ?? _code,
      name: value[IdpModelFields.name] ?? _name,
      id: value[IdpModelFields.id] ?? _id,
    );
  }
}

class IdpModelFields {
  IdpModelFields._();

  static const String code = 'code';
  static const String name = 'name';
  static const String id = 'id';
}
