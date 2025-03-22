import 'package:aconnec_1109_x/src/features/kyc/model/suiteable_question.st.dart';
import 'package:aconnec_1109_x/src/model/model.abs.dart';

class SuiteablePrefillModel implements Model<SuiteablePrefillModel> {
  String _riskLevel = '';
  List<UserChoiceModel> _userChoices = [];

  SuiteablePrefillModel({
    String riskLevel = '',
    List<UserChoiceModel> userChoices = const [],
  }) {
    _riskLevel = riskLevel;
    _userChoices = userChoices;
  }

  String get riskLevel => _riskLevel;
  List<UserChoiceModel> get userChoices => _userChoices;

  @override
  SuiteablePrefillModel copyWith(Map<String, dynamic> value) {
    return SuiteablePrefillModel();
  }
}

class SuiteablePrefillModelFields {
  SuiteablePrefillModelFields._();

  static const String riskLevel = 'riskLevel';
  static const String userChoices = 'userChoices';
}

class SuiteablePrefillModelPersistence
    implements ModelJson<SuiteablePrefillModel> {
  @override
  List<SuiteablePrefillModel> fromArrayJson(List arrJson) {
    return arrJson.map((e) => fromJson(e)).toList();
  }

  @override
  SuiteablePrefillModel fromJson(Map<String, dynamic> json) {
    return SuiteablePrefillModel(
      riskLevel: json[SuiteablePrefillModelFields.riskLevel],
      userChoices: UserChoiceModelPersistence()
          .fromArrayJson(json[SuiteablePrefillModelFields.userChoices]),
    );
  }

  @override
  Map<String, dynamic> toJson(SuiteablePrefillModel json) {
    return {
      SuiteablePrefillModelFields.riskLevel: json.riskLevel,
      SuiteablePrefillModelFields.userChoices:
          UserChoiceModelPersistence().toArrayJson(json.userChoices),
    };
  }
}
