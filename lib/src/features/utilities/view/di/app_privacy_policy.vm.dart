import 'package:aconnec_1109_x/src/core/custom_stream_subject.dart';
import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/view_model/view_model_new.abs.dart';
import 'package:aconnec_1109_x/src/features/utilities/model/app_privacy_policy.st.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@singleton
@Injectable()
class AppPrivacyPolicyViewModel
    extends CustomViewModel<AppPrivacyPolicyPageState> {
  final stateSubject = CustomStreamSubject(const AppPrivacyPolicyPageState());

  @override
  void dispose() {
    stateSubject.dispose();
  }

  @override
  void updateState(AppPrivacyPolicyPageState updateValue) {
    stateSubject.subject.add(updateValue);
  }

  Future<String> loadPrivacy() async {
    final txt = await rootBundle.loadString(Assets.documents.appPrivacyPolicy);
    return txt;
  }
}
