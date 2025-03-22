import 'package:aconnec_1109_x/src/model/idp.m.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';

class OnCallRpIdpListResponseModel
    implements Model<OnCallRpIdpListResponseModel> {
  List<IdpModel> _data = [];

  OnCallRpIdpListResponseModel({List<IdpModel> data = const []}) {
    _data = data;
  }

  List<IdpModel> get data => _data;

  @override
  OnCallRpIdpListResponseModel copyWith(Map<String, dynamic> value) {
    return OnCallRpIdpListResponseModel(
      data: value[OnCallRpIdpListResponseModelFields.data] ?? _data,
    );
  }
}

class OnCallRpIdpListResponseModelFields {
  OnCallRpIdpListResponseModelFields._();

  static const String data = 'data';
}
