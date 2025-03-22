import 'dart:async';

import 'package:aconnec_1109_x/src/core/gen/assets.gen.dart';
import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:aconnec_1109_x/src/theme/custom_theme.dart';
import 'package:aconnec_1109_x/src/utilities/date_time.dart';
import 'package:aconnec_1109_x/src/widgets/hilight_text.dart';
import 'package:flutter/material.dart';

import '../constants/spacing.dart';

class TimerWarningText extends StatefulWidget {
  final DateTime dateTimeExpire;
  final Function? onExpire;
  final bool intervalCheck;
  final int intervalSecond;

  const TimerWarningText(
      {super.key,
      required this.dateTimeExpire,
      this.onExpire,
      this.intervalCheck = false,
      this.intervalSecond = 0});

  @override
  State<TimerWarningText> createState() => _TimerWarningTextState();
}

class _TimerWarningTextState extends State<TimerWarningText> {
  final DateTime today = DateTime.now();
  Duration diffTime = const Duration();

  late Timer _timeCountdownInterval;

  void countdown() {
    _timeCountdownInterval =
        Timer.periodic(const Duration(seconds: 1), (timer) {
      final expire = widget.dateTimeExpire;
      final now = DateTime.now();
      final diff = expire.difference(now);
      if (diff.inSeconds <= 0) {
        _timeCountdownInterval.cancel();
        if (widget.onExpire != null) {
          widget.onExpire!.call();
        }
        return;
      }
      setState(() {
        diffTime = diff;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    countdown();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: blueColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Spacing.spacing20,
          vertical: Spacing.spacing10,
        ),
        child: Row(
          children: [
            Assets.svgImages.clock.svg(),
            const SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HilightText(
                    text:
                        '${S.current.waitingPaymentCancelDesc} %${DateTimeUtils.durationFormatMinuteSecond(diffTime)}%',
                    hilightStyle: paragraph2MediumStyle?.merge(
                      const TextStyle(color: blueColor),
                    ),
                    normalStyle:
                        paragraph2LightStyle?.copyWith(color: blueColor),
                  ),
                  const SizedBox(
                    height: Spacing.spacing10,
                  ),
                  Text(
                    '${S.of(context).dueText} ${DateTimeUtils.dateTimeFormat(widget.dateTimeExpire, 'dd-MM-yyyy, HH:mm')}',
                    style: paragraph3Style?.copyWith(
                        color: darkBlueColor.withOpacity(0.5)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
