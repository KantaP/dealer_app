import 'package:flutter/painting.dart';

class ColorPalette {
  const ColorPalette();

  static Color get successColor => green.green400;
  static Color get warningColor => yellow.yellow400;
  static Color get infoColor => blue.blue400;
  static Color get errorColor => red.red400;

  static Color get primaryColor => primary.cyan;
  static Color get disabledColor => grey.grey100;

  static Color get textPrimary => grey.grey800;
  static Color get textSecondary => grey.grey600;
  static Color get textTertiary => grey.grey500;
  static Color get textDisabled => grey.grey400;

  static Color get shadowLightColor => const Color(0xFF7E92A7).withOpacity(0.2);
  static Color get shadowColor => const Color(0xFF7E92A7).withOpacity(0.4);

  static Color get lineColor => grey.grey300;

  static Color get badgeColor => const Color(0xFFFF827A);

  static const primary = PrimaryPalette();
  static const secondary = SecondaryPalette();
  static const tertiary = TertiaryPalette();
  static const gradient = GradientPalette();
  static const grey = GreyPalette();
  static const cyan = CyanPalette();
  static const green = GreenPalette();
  static const blue = BluePalette();
  static const red = RedPalette();
  static const violet = VioletPalette();
  static const peach = PeachPalette();
  static const orange = OrangePalette();
  static const yellow = YellowPalette();
}

class PrimaryPalette {
  const PrimaryPalette();

  Color get white => const Color(0xFFFFFFFF);
  Color get grey => const Color(0xFF303446);
  Color get cyan => const Color(0xFF5BC0BE);
}

class SecondaryPalette {
  const SecondaryPalette();
  Color get green => const Color(0xFF52BD94);
  Color get red => const Color(0xFFF35656);
  Color get blue => const Color(0xFF579AFF);
}

class TertiaryPalette {
  const TertiaryPalette();
  Color get violet => const Color(0xFF8B79F8);
  Color get peach => const Color(0xFFFFB4A2);
  Color get orange => const Color(0xFFFFA345);
  Color get yellow => const Color(0xFFFFCC40);
}

class GradientPalette {
  const GradientPalette();
  static const List<Color> greenLifeLive = [
    Color(0xFFD1F2F2),
    Color(0xFF2FDFDC),
  ];
  static const List<Color> salmonPink = [
    Color(0xFFFFC5BA),
    Color(0xFFFF7E85),
  ];
  static const List<Color> blueViolet = [
    Color(0xFFC1BAFA),
    Color(0xFF8B79F8),
  ];
  static const List<Color> greeny = [
    Color(0xFF97ECD8),
    Color(0xFF55DBA8),
  ];
  static const List<Color> shiningStar = [
    Color(0xFFFEE397),
    Color(0xFFFFC56F),
  ];
  static const List<Color> honeyYellow = [
    Color(0xFFFFDC7C),
    Color(0xFFFFC85F),
  ];
}

class GreyPalette {
  const GreyPalette();
  Color get grey800 => const Color(0xFF303446);
  Color get grey600 => const Color(0xFF646773);
  Color get grey500 => const Color(0xFFADADB2);
  Color get grey400 => const Color(0xFFD4D5D7);
  Color get grey300 => const Color(0xFFE5E5E5);
  Color get grey100 => const Color(0xFFF5F5F5);
  Color get grey50 => const Color(0xFFFAFAFA);
  Color get grey0 => const Color(0xFFFFFFFF);
}

class CyanPalette {
  const CyanPalette();
  Color get cyan1000 => const Color(0xFF285554);
  Color get cyan900 => const Color(0xFF397978);
  Color get cyan800 => const Color(0xFF469493);
  Color get cyan700 => const Color(0xFF51ABA9);
  Color get cyan600 => const Color(0xFF5BC0BE);
  Color get cyan500 => const Color(0xFF8CCECC);
  Color get cyan400 => const Color(0xFFB0DBDA);
  Color get cyan300 => const Color(0xFFCDE7E7);
  Color get cyan200 => const Color(0xFFE7F3F3);
  Color get cyan100 => const Color(0xFFF3F9F9);
}

class GreenPalette {
  const GreenPalette();
  Color get green600 => const Color(0xFF317159);
  Color get green500 => const Color(0xFF429777);
  Color get green400 => const Color(0xFF52BD94);
  Color get green300 => const Color(0xFFA3E6CD);
  Color get green200 => const Color(0xFFDCF2EA);
  Color get green100 => const Color(0xFFEEF8F4);
  Color get green50 => const Color(0xFFF5FBF8);
}

class BluePalette {
  const BluePalette();
  Color get blue600 => const Color(0xFF264472);
  Color get blue500 => const Color(0xFF4377C5);
  Color get blue400 => const Color(0xFF579AFF);
  Color get blue300 => const Color(0xFFAEC8FF);
  Color get blue200 => const Color(0xFFCDDCFF);
  Color get blue100 => const Color(0xFFE7EEFF);
  Color get blue50 => const Color(0xFFF3F6FF);
}

class RedPalette {
  const RedPalette();
  Color get red600 => const Color(0xFF6C2626);
  Color get red500 => const Color(0xFFBC4242);
  Color get red400 => const Color(0xFFF35656);
  Color get red300 => const Color(0xFFF7AEAE);
  Color get red200 => const Color(0xFFFACCCC);
  Color get red100 => const Color(0xFFFCE7E7);
  Color get red50 => const Color(0xFFFDF3F3);
}

class VioletPalette {
  const VioletPalette();
  Color get violet900 => const Color(0xFF3E366E);
  Color get violet800 => const Color(0xFF574C9C);
  Color get violet700 => const Color(0xFF6B5DC0);
  Color get violet600 => const Color(0xFF7C6CDD);
  Color get violet500 => const Color(0xFF8B79F8);
  Color get violet400 => const Color(0xFFA89DF9);
  Color get violet300 => const Color(0xFFC1BAFA);
  Color get violet200 => const Color(0xFFD8D3FC);
  Color get violet100 => const Color(0xFFECEAFD);
  Color get violet50 => const Color(0xFFF5F4FE);
}

class PeachPalette {
  const PeachPalette();
  Color get pearch900 => const Color(0xFFFF7959);
  Color get peach700 => const Color(0xFFFF9D86);
  Color get peach400 => const Color(0xFFFFB4A2);
  Color get peach300 => const Color(0xFFFFD5CC);
  Color get peach200 => const Color(0xFFFFE3DE);
  Color get peach100 => const Color(0xFFFFF1EF);
  Color get peach50 => const Color(0xFFFFF8F7);
}

class OrangePalette {
  const OrangePalette();
  Color get orange700 => const Color(0xFFFF9323);
  Color get orange400 => const Color(0xFFFFA345);
  Color get orange300 => const Color(0xFFFFCCA9);
  Color get orange200 => const Color(0xFFFFDECA);
  Color get orange100 => const Color(0xFFFFEFE6);
  Color get orange50 => const Color(0xFFFFF7F2);
}

class YellowPalette {
  const YellowPalette();
  Color get yellow400 => const Color(0xFFFFCC40);
  Color get yellow300 => const Color(0xFFFFE1A8);
  Color get yellow200 => const Color(0xFFFFEBC9);
  Color get yellow100 => const Color(0xFFFFF5E5);
  Color get yellow50 => const Color(0xFFFFFAF2);
}
