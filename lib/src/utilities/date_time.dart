import 'package:aconnec_1109_x/src/core/translate/generated/l10n.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  DateTimeUtils._();

  static String durationFormatMinuteSecond(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return '$twoDigitMinutes ${S.current.minute} $twoDigitSeconds ${S.current.second}';
  }

  static String durationFormatHourMinuteSecond(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitHours = twoDigits(duration.inHours.remainder(24));
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return '$twoDigitHours ${S.current.hour} $twoDigitMinutes ${S.current.minute} $twoDigitSeconds ${S.current.second}';
  }

  static String dateTimeFormat(DateTime dateTime, String format) {
    final localeDatetime = dateTime.toLocal();
    return DateFormat(format).format(localeDatetime);
  }

  static String toDateTime(String formattedString,
      {String format = 'dd-MM-yyyy, HH:mm'}) {
    if (formattedString == '') return '';
    final dateTime = DateTime.parse(formattedString).toLocal();
    return dateTimeFormat(dateTime, format);
  }
}
