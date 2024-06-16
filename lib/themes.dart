import 'package:flutter/material.dart';

// Light theme data
final ThemeData lightTheme = ThemeData(
  // primaryColor: Color(0xff155E7D),
  primaryColorLight: Colors.white,
  primaryColorDark: Colors.black,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.light().copyWith(
    primary: Colors.white,
    secondary: Colors.black,
    tertiary: Colors.grey,
    // surface: Color(0xffE7E7E7),
  ),
  fontFamily: "MSYI",
);

// Dark theme data
final ThemeData darkTheme = ThemeData(
  // primaryColor: Color(0xff155E7D),
  primaryColorLight: Colors.black,
  primaryColorDark: Colors.white,
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.dark().copyWith(
    primary: Colors.black,
    secondary: Colors.white,
    tertiary: Colors.grey,
    // surface: Color(0xff292929),
  ),
  fontFamily: "MSYI",
);

