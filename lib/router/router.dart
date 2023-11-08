import 'package:flutter/material.dart';
import '../layout/home_layout.dart';
import '../screens/register/login.dart';
import 'routes.dart';

class AppRouter {
  static Route<Widget> generatRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeLayout:
        return MaterialPageRoute(
          builder: (_) => HomeLayout(),
        );
      case Routes.loginPage:
        return MaterialPageRoute(
          builder: (context) =>  LoginTab(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>  LoginTab(),
        );
    }
  }
}
