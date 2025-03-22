import 'package:aconnec_1109_x/src/core/custom_stream_subject.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model_new.abs.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/app_term.st.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@singleton
@Injectable()
class RiskConditionViewModel extends CustomViewModel {
  @override
  void dispose() {}

  Future<String> loadTerm() async {
    final txt = await rootBundle.loadString(Assets.documents.kycTermCondition);
    return txt;
  }

  @override
  void updateState(updateValue) {
    // TODO: implement updateState
  }
}
