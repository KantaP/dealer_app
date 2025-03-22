import 'dart:async';

import 'package:injectable/injectable.dart';

import '../../../../core/custom_stream_subject.dart';

@Singleton(order: -1)
class PhoneAuthCountDownService {
  final countdownState = CustomStreamSubject<int>(0);
  StreamSubscription<int>? countdownSubscription;
  void timerListener() {
    if (countdownSubscription != null) {
      countdownSubscription!.cancel();
    }

    countdownSubscription = countdownState.subject.listen(
      (value) {
        if (value > 0) {
          Future.delayed(const Duration(seconds: 1), () {
            countdownState.setValue(value - 1);
          });
        }
      },
    );
  }
}
