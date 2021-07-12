import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color appBackgroundColor = Color(0xFFFFFFFF);
  static const Color resultButtonColor = Color(0xFF2D5EFF);
  static const Color cardOverEditTextColor = Color(0xFF23E6B7);
  // static const Color topBarBackgroundColor = Color(0xFFFFD974);
  // static const Color selectedTabBackgroundColor = Color(0xFFFFC442);
  // static const Color unSelectedTabBackgroundColor = Color(0xFFFFFFFC);
  // static const Color subTitleTextColor = Color(0xFF75C28C);
  // static const Color subTitleSmallTextColor = Color(0x99000000);

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppTheme.appBackgroundColor,
    brightness: Brightness.light,
    textTheme: lightTextTheme,
    fontFamily: "Vazir",
  );

  static final TextTheme lightTextTheme = TextTheme(
    headline6: _titleLight,
    button: _buttonLight,
    caption: _captionLight,
    bodyText1: _selectedTabLight,
    bodyText2: _unSelectedTabLight,
  );

  static final TextStyle _titleLight = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 35,
  );
  static final TextStyle _captionLight = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 11,
  );

  static final TextStyle _buttonLight = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 21,
  );

  static final TextStyle _selectedTabLight = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static final TextStyle _unSelectedTabLight = TextStyle(
    color: Color(0xFF75C28C),
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );
}
