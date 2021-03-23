import 'package:flutter/material.dart';

class Themes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Lato',
    primaryColor: Colors.white,
    accentColor: const Color(0xFFFAA361),
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

  static const kDarkThemeTextColor = Color(0xFF7C7C7C);

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
