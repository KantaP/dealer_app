import 'package:aconnec_1109_x/src/constants/spacing.dart';
import 'package:aconnec_1109_x/src/core/navigator_service.dart';
import 'package:flutter/material.dart';

// Color from ci
const blueColor = Color(0xFF565EFF);
const blackColor = Color(0xFF242438);
const darkGreyColor = Color.fromRGBO(132, 137, 142, 1);
const midGreyColor = Color(0xFFBCBCBC);
const lightGrey1Color = Color(0xFFF0F0F0);
const lightGrey2Color = Color.fromRGBO(249, 249, 249, 1);
const whiteColor = Colors.white;
const whitePurpleColor = Color(0xFFEEE9FF);
const redColor = Color(0xFFD45A6F);
const greenColor = Color(0xFF5ABB75);
const purpleColor = Color.fromRGBO(109, 80, 141, 1);
const yellowColor = Color(0xFFF0C852);
const darkBlueColor = Color(0xFF3D45E5);
const dividerColor = Color.fromRGBO(188, 188, 188, 1);
const lightGreenColor = Color(0xFF5ABB75);
const lightBlueColor = Color.fromARGB(255, 89, 152, 229);
const List<Color> homeGradientColors = [
  Color(0xFF347BFF),
  Color(0xFF3200C1),
];
const userTagCardColor = Color.fromRGBO(22, 23, 29, 0.8);
const lightBlue10 = Color(0xFF565EFF);
const seaBlue = Color(0xFF8DC2E0);
const lightGreen30 = Color.fromRGBO(90, 187, 117, 0.3);
const lightRed = Color(0xFFF1647D);
const boxShadowBlueColor = Color(0xFF0050B5);

const yellowText = Color(0xFFD4A513);
const hintTextColor = Color(0xFF939393);
const termsColor = Color(0xFF84898E);

const softBlue = Color(0xFF676EFF);
const warningTextBoxColor = Color(0xFFFFE8A5);
final blueColor30 = Color(0xFF565EFF).withOpacity(0.3);

const defaultLineHeight = 21.0;

class CustomTheme {
  static ThemeData get normalTheme {
    return ThemeData(
      primaryColor: blueColor,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: customAppBarTheme,
      outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle),
      elevatedButtonTheme: ElevatedButtonThemeData(style: elevatedButton),
      textButtonTheme: TextButtonThemeData(style: textButtonStyle),
      textTheme: customTextTheme,
      dividerTheme: DividerThemeData(
        color: midGreyColor.withOpacity(0.3),
      ),
      datePickerTheme: datePickerTheme,
      textSelectionTheme: textSelectionTheme,
    );
  }

  static DatePickerThemeData get datePickerTheme {
    return const DatePickerThemeData(
      surfaceTintColor: Colors.transparent,
    );
  }

  static TextSelectionThemeData get textSelectionTheme {
    return const TextSelectionThemeData(
      cursorColor: blueColor,
      selectionColor: softBlue,
      selectionHandleColor: softBlue,
    );
  }
}

final outlineBoxShadow = BoxShadow(
  color: blueColor.withOpacity(0.2),
  blurRadius: 2,
  spreadRadius: 2,
  offset: const Offset(0, 0),
);

final ButtonStyle elevatedButton = ElevatedButton.styleFrom(
  foregroundColor: whiteColor,
  minimumSize: const Size(88, 50),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  ),
  backgroundColor: blueColor,
  disabledBackgroundColor: midGreyColor,
  disabledForegroundColor: whiteColor,
  textStyle: textInButtonStyle,
);

final ButtonStyle elevatedLightGreyButton = ElevatedButton.styleFrom(
  foregroundColor: whiteColor,
  minimumSize: const Size(88, 50),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  ),
  backgroundColor: lightGrey1Color,
  disabledBackgroundColor: midGreyColor,
  disabledForegroundColor: whiteColor,
  textStyle: textInButtonStyle?.copyWith(color: darkGreyColor),
);

final ButtonStyle elevatedWhiteButton = ElevatedButton.styleFrom(
  foregroundColor: blackColor,
  minimumSize: const Size(88, 50),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  ),
  backgroundColor: whiteColor,
  disabledBackgroundColor: midGreyColor,
  disabledForegroundColor: whiteColor,
  textStyle: textInButtonStyle,
);

final ButtonStyle elevatedTransparentButton = ElevatedButton.styleFrom(
  foregroundColor: Colors.transparent,
  minimumSize: const Size(88, 50),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  ),
  backgroundColor: Colors.transparent,
  disabledBackgroundColor: Colors.transparent,
  disabledForegroundColor: Colors.transparent,
  textStyle: textInButtonStyle,
);

final ButtonStyle elevatedDisabledButton = ElevatedButton.styleFrom(
  foregroundColor: midGreyColor,
  minimumSize: const Size(88, 50),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  ),
  backgroundColor: midGreyColor,
  disabledBackgroundColor: midGreyColor,
  disabledForegroundColor: midGreyColor,
  textStyle: textInButtonStyle,
);

final ButtonStyle elevatedDisabledBlueButton = ElevatedButton.styleFrom(
  foregroundColor: softBlue,
  minimumSize: const Size(88, 50),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  ),
  backgroundColor: softBlue,
  disabledBackgroundColor: softBlue,
  disabledForegroundColor: softBlue,
  textStyle: textInButtonStyle,
);

final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
  foregroundColor: blueColor,
  backgroundColor: Colors.transparent,
  minimumSize: const Size(88, 50),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  side: const BorderSide(color: blueColor),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  ),
  textStyle: textInButtonStyle?.copyWith(color: blueColor),
);

final ButtonStyle outlineDisabledButtonStyle = OutlinedButton.styleFrom(
  foregroundColor: midGreyColor,
  backgroundColor: Colors.transparent,
  minimumSize: const Size(88, 50),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  side: const BorderSide(color: midGreyColor),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  ),
  textStyle: textInButtonStyle?.copyWith(color: midGreyColor),
);

final ButtonStyle outlineWhiteButtonStyle = OutlinedButton.styleFrom(
  foregroundColor: whiteColor,
  backgroundColor: Colors.transparent,
  minimumSize: const Size(88, 50),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  side: const BorderSide(color: whiteColor),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  ),
  textStyle: textInButtonStyle?.copyWith(color: whiteColor),
);

final ButtonStyle outlineAlertButtonStyle = OutlinedButton.styleFrom(
  foregroundColor: redColor,
  minimumSize: const Size(88, 50),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  side: const BorderSide(color: redColor),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  ),
  textStyle: textInButtonStyle?.copyWith(color: redColor),
);

final ButtonStyle textButtonStyle = TextButton.styleFrom(
  foregroundColor: blackColor,
  textStyle: textInButtonStyle,
);

final TextTheme customTextTheme = const TextTheme(
  headlineLarge: TextStyle(fontSize: 48, decoration: TextDecoration.none),
  headlineMedium: TextStyle(fontSize: 32, decoration: TextDecoration.none),
  headlineSmall: TextStyle(fontSize: 22, decoration: TextDecoration.none),
  bodyLarge: TextStyle(fontSize: 16, decoration: TextDecoration.none),
  bodyMedium: TextStyle(fontSize: 14, decoration: TextDecoration.none),
  bodySmall: TextStyle(fontSize: 12, decoration: TextDecoration.none),
  titleLarge: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20,
      decoration: TextDecoration.none),
  titleMedium: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      decoration: TextDecoration.none),
  titleSmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      decoration: TextDecoration.none),
).apply(bodyColor: blackColor, fontFamily: 'Kanit');

TextStyle? get headline1Style =>
    customTextTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w400);

TextStyle? get headline2Style =>
    customTextTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w400);

TextStyle? get headline2MediumStyle =>
    customTextTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w500);

TextStyle? get headline4Style =>
    customTextTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w500);

TextStyle? get headline4RegularStyle =>
    customTextTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w400);

TextStyle? get headline4BoldStyle =>
    customTextTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600);

TextStyle? get headline4LightStyle =>
    customTextTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w300);

TextStyle? get titlePageStyle =>
    customTextTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500);

TextStyle? get titleStyle =>
    customTextTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500);

TextStyle? get paragraph1RegularStyle =>
    customTextTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400);

TextStyle? get paragraph1LightStyle =>
    customTextTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w300);

TextStyle? get paragraph1MediumStyle =>
    customTextTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600);

TextStyle? get paragraph2Style =>
    customTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400);

TextStyle? get paragraph2LightStyle =>
    customTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w300);

TextStyle? get paragraph2MediumStyle =>
    customTextTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500);

TextStyle? get paragraph3Style =>
    customTextTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400);

TextStyle? get textInButtonStyle =>
    customTextTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400);

TextStyle? get noticeText =>
    customTextTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500);

TextStyle? get regular11Text => customTextTheme.bodySmall
    ?.copyWith(fontSize: 11, fontWeight: FontWeight.w400);

TextStyle? get regular14Text => customTextTheme.bodySmall
    ?.copyWith(fontSize: 14, fontWeight: FontWeight.w400);

TextStyle? get noticeTextUnderline => customTextTheme.bodySmall?.copyWith(
      color: darkGreyColor,
      fontWeight: FontWeight.w500,
      decoration: TextDecoration.underline,
      decorationColor: blueColor,
    );

final TextStyle lightNavTitleTextStyle =
    customAppBarTheme.titleTextStyle!.merge(const TextStyle(color: whiteColor));

const AppBarTheme customAppBarTheme = AppBarTheme(
  backgroundColor: Colors.white,
  foregroundColor: Color.fromRGBO(22, 23, 29, 1),
  shadowColor: Colors.white,
  titleTextStyle:
      TextStyle(color: blackColor, fontSize: 20, fontFamily: 'Kanit'),
  elevation: 0,
  centerTitle: true,
);

double paddingBottom() =>
    (MediaQuery.of(NavigationService.navigatorKey.currentContext!)
                .padding
                .bottom >
            0)
        ? MediaQuery.of(NavigationService.navigatorKey.currentContext!)
            .padding
            .bottom
        : Spacing.spacing24;
