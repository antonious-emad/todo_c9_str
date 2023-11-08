import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/providers/my_provider.dart';
import 'package:todo/screens/register/register.dart';
import 'package:todo/shared/styles/themeing.dart';

import 'firebase_options.dart';
import 'layout/home_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FirebaseFirestore.instance.disableNetwork();
  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      initialRoute: provider.firebaseUser != null ? HomeLayout.routeName : RegisterScreen.routeName,
      theme: MyThemeData.lightTheme,
      themeMode: provider.appTheme,
      darkTheme: MyThemeData.darkTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: Locale(provider.languageCode),
      supportedLocales: AppLocalizations.supportedLocales,
      routes: {
        RegisterScreen.routeName: (context) => RegisterScreen(),
        HomeLayout.routeName: (context) => HomeLayout(),
      },
    );
  }
}
