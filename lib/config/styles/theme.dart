import 'package:flutter/material.dart';

String fontFamily = "Metro";

ThemeData themeData = ThemeData(
  fontFamily: fontFamily,
  textTheme: TextTheme(
    displayLarge: TextStyle(fontFamily: fontFamily, fontSize: 50, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(fontFamily: fontFamily, fontSize: 32),
    displaySmall: TextStyle(fontFamily: fontFamily, fontSize: 28),
    titleLarge: TextStyle(fontFamily: fontFamily, fontSize: 24),
    titleMedium: TextStyle(fontFamily: fontFamily, fontSize: 20),
  ),
);
