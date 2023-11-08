import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class MyThemeData {

  static ThemeData lightTheme = ThemeData(
      colorScheme:const ColorScheme(
          brightness: Brightness.light,
          primary: mintColor,
          onPrimary: primryColorLight,
          secondary: Colors.black,
          onSecondary: Colors.white,
          error: Colors.white,
          onError: Colors.black,
          background: bgColorLight,
          onBackground: Colors.white,
          surface: primaryColor,
          onSurface: Colors.black),
      appBarTheme: const   AppBarTheme(elevation: 0.0, centerTitle: true,
          iconTheme: IconThemeData(
              color: primaryColor
          )
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        elevation: 0.0,
      ),
      scaffoldBackgroundColor: mintColor,
      textTheme: TextTheme(
          bodySmall: GoogleFonts.elMessiri(
              fontSize: 20, fontWeight: FontWeight.w400, color: blackColor),
          bodyMedium: GoogleFonts.elMessiri(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: const Color(0xFFFFFFFF)),
          bodyLarge: GoogleFonts.elMessiri(
              fontSize: 30, fontWeight: FontWeight.bold, color: blackColor)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: primaryColor,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
  );
  static ThemeData darkTheme = ThemeData(
    colorScheme:const ColorScheme(
        brightness: Brightness.dark,
        primary: Colors.white,
        onPrimary: primryColorLight,
        secondary: Colors.white,
        onSecondary:darkColor,
        error: darkColor,
        onError: Colors.white,
        background: darkBg,
        onBackground: darkColor,
        surface: Colors.black,
        onSurface: Colors.white),
    appBarTheme:
    const AppBarTheme(elevation: 0.0, centerTitle: true),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      elevation: 0.0,
    ),
    scaffoldBackgroundColor: darkBg,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: primryColorLight,
    ),
    textTheme: TextTheme(
        bodySmall: GoogleFonts.elMessiri(
            fontSize: 20, fontWeight: FontWeight.w400),
        bodyMedium: GoogleFonts.elMessiri(
            fontSize: 25,
            fontWeight: FontWeight.w700,),
        bodyLarge: GoogleFonts.elMessiri(
            fontSize: 30, fontWeight: FontWeight.bold)),
  );
}
