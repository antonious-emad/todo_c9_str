import 'package:flutter/material.dart';
import 'package:todo/screens/tasks/add_tasks_bottom_sheet.dart';
import '../screens/settings/Settings_tab.dart';
import '../screens/tasks/tasks_tab.dart';
class HomeLayout extends StatefulWidget {
  static const String routeName="Layout";
  const HomeLayout({super.key});
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}
class _HomeLayoutState extends State<HomeLayout> {
  int index=0;
  List<Widget>tabs=[
    const TasksTab(),
    const SettingsTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        toolbarHeight: 90,
        title: const Text("Todo"),
      ),
      body: tabs[index],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: (){showSheet();},
        shape: const CircleBorder(side: BorderSide(
          color: Colors.white,
          width: 3
        ) ),
          child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
         color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          showUnselectedLabels: false,
            showSelectedLabels: false,
            iconSize: 30,
          onTap: (value){index=value;setState(() {});},
          currentIndex: index,
          items: const [
              BottomNavigationBarItem(icon:  Icon(Icons.menu),label: ""),
              BottomNavigationBarItem(icon:  Icon(Icons.settings),label: ""),
        ],
        ),
      ),
    );
  }

  void showSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
        context: context,
        builder: (context)=>Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: const AddTaskBottomSheet(),
        ));
  }
}
