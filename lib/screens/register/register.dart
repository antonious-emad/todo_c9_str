import 'package:flutter/material.dart';
import 'package:todo/screens/register/signup.dart';


import 'login.dart';

class RegisterScreen extends StatelessWidget {
 static const String routeName="Logi";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(child: Text("Login")),
              Tab(child: Text("Sign Up")),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LoginTab(),
            SignUpTab()
          ],
        ),
      ),
    );
  }
}
