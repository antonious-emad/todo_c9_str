import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName="Layout";

  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: const Text("Todo"),
      ),
    );
  }
}
