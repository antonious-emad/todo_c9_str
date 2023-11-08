import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';
import '../network/firebase_functions.dart';


class AppProvider extends ChangeNotifier {
  String languageCode = 'en';
  ThemeMode appTheme = ThemeMode.light;
  SharedPreferences? prefs;

  void changeLanguage(String language) {
    languageCode = language;
    saveLanguage(language);
    notifyListeners();
  }

  User? firebaseUser;
  UserModel? userModel;
  AppProvider() {
    firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      initUser();
    }
  }
  void changeTheme(ThemeMode newTheme) {
    appTheme = newTheme;
    savingTheme(newTheme);
    notifyListeners();
  }

  initUser() async {
     firebaseUser = FirebaseAuth.instance.currentUser;
    userModel = await FirebaseFunctions.readUser(firebaseUser!.uid);
    notifyListeners();
  }

  void savingTheme(ThemeMode themeMode) async {
    String theme = themeMode == ThemeMode.dark ? 'dark' : 'light';
    await prefs!.setString('theme', theme);
  }

  String? getTheme() {
    return prefs!.getString('theme');
  }

  Future<void> cashTheme() async {
    prefs = await SharedPreferences.getInstance();
    String? oldTheme = getTheme();
    if (oldTheme != null) {
      appTheme = oldTheme == 'dark' ? ThemeMode.dark : ThemeMode.light;
    }
  }

  Future<void> saveLanguage(String lang) async {
    String language = lang == 'en' ? 'en' : 'ar';
    await prefs!.setString('language', language);
  }

  Future<void> cashLanguage() async {
    prefs = await SharedPreferences.getInstance();
    String? oldLanguage = getLanguage();
    if (oldLanguage != null) {
      languageCode = oldLanguage == 'en' ? 'en' : 'ar';
    }
  }

  String? getLanguage() {
    return prefs!.getString('language');
  }
}
