import 'dart:async';

import 'package:aconnec_1109_x/src/core/custom_stream_subject.dart';
import 'package:aconnec_1109_x/src/data/network/firebase_client.dart';
import 'package:aconnec_1109_x/src/di/components/injection.dart';
import 'package:injectable/injectable.dart';

@singleton
class SendResetPasswordViewModel {
  final countdownSubject = CustomStreamSubject(0);
  final emailSubject = CustomStreamSubject('');
  Timer? timer;

  final _firebaseClient = getIt<FirebaseClient>();

  void dispose() {
    countdownSubject.setValue(0);
    emailSubject.setValue('');
    timer?.cancel();
  }

  void initSendResetPasswordEmail() {
    sendResetPasswordEmail();
  }

  void countdownResend() {
    countdownSubject.setValue(countdownSubject.subject.value - 1);
    if (countdownSubject.subject.value == 0) {
      timer?.cancel();
    }
  }

  Future<void> sendResetPasswordEmail() async {
    if (emailSubject.subject.value.isEmpty ||
        countdownSubject.subject.value > 0) return;
    _firebaseClient.sendResetPasswordEmail(emailSubject.subject.value);
    countdownSubject.setValue(60);
    timer =
        Timer.periodic(const Duration(seconds: 1), (_) => countdownResend());
    return;
  }
}
