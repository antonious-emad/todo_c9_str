import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/screens/tasks/task_item.dart';
import 'package:todo/styles/colors.dart';
import '../../models/tsak_model.dart';
import '../../shared/network/firebase.dart';
class TasksTab extends StatefulWidget {
  const TasksTab({super.key});
  @override
  State<TasksTab> createState() => _TasksTabState();
}
class _TasksTabState extends State<TasksTab> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CalendarTimeline(
          initialDate: selectedDate,
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          onDateSelected: (date) {
            selectedDate = date;
            setState(() {});
          },
          leftMargin: 20,
          monthColor: Theme.of(context).colorScheme.onSurface,
          dayColor: primaryColor.withOpacity(0.7),
          activeDayColor: Colors.white,
          activeBackgroundDayColor: Theme.of(context).primaryColor,
          dotsColor: Colors.white,
          selectableDayPredicate: (date) => true,
          locale: 'en',
        ),
        StreamBuilder<QuerySnapshot<TaskData>>(
            stream: getTaskFromFirebase(selectedDate),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(child: Text("Something went wrong"));
              }
              var tasks =
                  snapshot.data?.docs.map((doc) => doc.data()).toList() ?? [];
              if (tasks.isEmpty) {
                return const Center(child: Text("No Data"));
              }
              return Expanded(
                child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (c, index) {
                      return TaskItem(tasks[index]);
                    }),
              );
            })
      ],
    );
  }
}