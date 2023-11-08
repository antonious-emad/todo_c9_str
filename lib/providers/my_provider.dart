import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/providers/sharedprefrence.dart';

import '../models/user_model.dart';
import '../shared/network/firebase_functions.dart';


class MyProvider extends ChangeNotifier {
  String languageCode = 'en';
  ThemeMode appTheme = ThemeMode.light;
  SharedPreferences? prefs;
  void initializeSharedpref() async {
    prefs= await SharedPreferences.getInstance();
  }
  void getThemeAndLang(){
    String language=Shared.prefs?.getString("lang")??"en";
    languageCode=language;
    String theme=Shared.prefs?.getString("theme")??"$appTheme";
    if(theme=='$appTheme'){
      appTheme=ThemeMode.light;
    }
    else{
      appTheme=ThemeMode.dark;
    }
  }
  void changeLanguage(String language) {
    languageCode = language;
    saveLanguage(language);
    notifyListeners();
  }
  void setCurrentLanguage(String newLocale){
    languageCode = newLocale;
    notifyListeners();
  }
  UserModel? userModel;
  User? firebaseUser;
  MyProvider() {
    firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      initMyUser();
    }
  }
  void changeTheme(ThemeMode newTheme) {
    appTheme = newTheme;
    savingTheme(newTheme);
    notifyListeners();
  }

  void initMyUser() async {
    firebaseUser=FirebaseAuth.instance.currentUser;
    userModel = await FirebaseFunctions.readUser(
        firebaseUser!.uid);
    notifyListeners();
  }

  void savingTheme(ThemeMode themeMode) async {
    String theme = themeMode == ThemeMode.dark ? 'dark' : 'light';
    await prefs!.setString('theme', theme);
    notifyListeners();
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
    notifyListeners();
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
