import 'package:flutter/material.dart';

import 'colors.dart';

class MyTheme {
  static const TextStyle appBarTextStyle = TextStyle(fontWeight: FontWeight.bold,
      fontSize: 22, color: Colors.white);
  static const TextStyle taskTitleTextStyle = TextStyle(fontWeight: FontWeight.bold,
      fontSize: 22, color: primaryColor);
  static const TextStyle taskDescriptionTextStyle = TextStyle(fontWeight: FontWeight.normal,
      fontSize: 14, color: lightBlack);
  static const TextStyle bottomSheetTitleTextStyle = TextStyle(fontWeight: FontWeight.normal,
      fontSize: 20, color: Colors.black);
  static ThemeData lightTheme = ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: greenBackground,
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: primaryColor,
          onPrimary: Colors.white,
          secondary: greenBackground,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: greenBackground,
          onBackground: primaryColor,
          surface: Colors.grey,
          onSurface: colorBlack),
      appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          iconTheme: IconThemeData(color: Colors.white)),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: colorBlack),
        titleMedium: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: primaryColor),
        titleSmall: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: primaryColor),
      ),
      floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: primaryColor),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey));

  static ThemeData darkTheme = ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: darkPrimary,
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: primaryColor,
          onPrimary: colorBlack,
          secondary: greenBackground,
          onSecondary: colorBlack,
          error: Colors.red,
          onError: Colors.white,
          background: greenBackground,
          onBackground: primaryColor,
          surface: colorBlack,
          onSurface: Colors.white),
      appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          iconTheme: IconThemeData(color: Colors.white)),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        titleMedium: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: primaryColor),
        titleSmall: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: primaryColor),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: colorBlack,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.grey));
}