import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static final AppTheme instance = AppTheme._();

  //dark theme
  static ThemeData dark = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
      useMaterial3: true,
      scaffoldBackgroundColor: Color.fromARGB(255, 26, 41, 35),
      textTheme: TextTheme(titleLarge: TextStyle(color: Colors.white)),
      primaryColor: Colors.yellow,
      cardColor: Color.fromARGB(255, 19, 24, 19)
      );

      //light theme
  static ThemeData light = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.green);
}
