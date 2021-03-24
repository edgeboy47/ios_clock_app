import 'package:flutter/material.dart';

class Themes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Lato',
    primaryColor: Colors.white,
    accentColor: const Color(0xFFFF97B3),
    canvasColor: kLightThemeCanvasColor,
    iconTheme: const IconThemeData(
      color: Color(0xFFA1B0CA),
      size: 32,
    ),
    textTheme: lightTextTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Lato',
    primaryColor: Colors.black,
    accentColor: const Color(0xFFFF97B3),
    canvasColor: kDarkThemeCanvasColor,
    iconTheme: const IconThemeData(
      color: Color(0xFF7C7C7C),
      size: 32,
    ),
    textTheme: darkTextTheme,
  );

  static final lightTextTheme = TextTheme(
    headline1: _headline1.copyWith(color: Colors.black),
    headline4: _headline4.copyWith(color: Colors.black),
    headline6: _headline6.copyWith(color: kLightThemeTextColor),
    bodyText1: _bodyText1.copyWith(color: Colors.black),
    bodyText2: _bodyText2.copyWith(color: kLightThemeTextColor),
    caption: _caption.copyWith(color: kLightThemeTextColor),
  );

  static final darkTextTheme = TextTheme(
    headline1: _headline1.copyWith(color: Colors.white),
    headline4: _headline4.copyWith(color: Colors.white),
    headline6: _headline6.copyWith(color: kDarkThemeTextColor),
    bodyText1: _bodyText1.copyWith(color: Colors.white),
    bodyText2: _bodyText2.copyWith(color: kDarkThemeTextColor),
    caption: _caption.copyWith(color: kDarkThemeTextColor),
  );

  static const kLightThemeTextColor = Color(0xFFA1B0CA);
  static const kLightThemeCanvasColor = Colors.white;

  static const kDarkThemeTextColor = Color(0xFF7C7C7C);
  static const kDarkThemeCanvasColor = Color(0xFF222225);

  /// Clock Colours
  static const kLightThemeInnerCircleColor = Color(0xFFECEFF5);
  static const kLightThemeOuterCircleColor = Colors.white;
  static const kLightThemeSecondHandColor = Color(0xFFFF97B3);
  static const kLightThemeMinuteHandColor = Color(0xFFB3BFD7);
  static const kLightThemeHourHandColor = Color(0xFFE4E9F2);

  static const kDarkThemeInnerCircleColor = Color(0xFF232323);
  static const kDarkThemeOuterCircleColor = Color(0xFF3A3A3A);
  static const kDarkThemeSecondHandColor = Color(0xFFFF97B3);
  static const kDarkThemeMinuteHandColor = Color(0xFF4E4E4E);
  static const kDarkThemeHourHandColor = Color(0xFF404040);

  /// TextStyles
  static const TextStyle _headline1 = TextStyle(
    fontSize: 80,
    letterSpacing: 3,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle _headline4 = TextStyle(
    fontSize: 32,
    letterSpacing: 1,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle _headline6 = TextStyle(
    fontSize: 18,
    letterSpacing: 0.64,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle _bodyText1 = TextStyle(
    fontSize: 16,
    letterSpacing: 1.07,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle _bodyText2 = TextStyle(
    fontSize: 14,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle _caption = TextStyle(
    fontSize: 12,
    letterSpacing: 0,
    fontWeight: FontWeight.w400,
  );
}
