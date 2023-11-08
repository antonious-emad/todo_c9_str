import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../models/task_model.dart';
import '../../network/firebase_functions.dart';
import '../../styles/colors.dart';
import '../tasks_filed.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  final TextEditingController taskTitleController = TextEditingController();

  final TextEditingController taskdescriptionController =
      TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.addNewTask,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onPrimary),

              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            TaskFiled(
              controller: taskTitleController,
              labelText: AppLocalizations.of(context)!.title,
              hintText: AppLocalizations.of(context)!.enterTitle,
            ),
            const SizedBox(
              height: 20,
            ),
            TaskFiled(
              controller: taskdescriptionController,
              labelText: AppLocalizations.of(context)!.taskDescription,
              hintText: AppLocalizations.of(context)!.enterTaskDescription,
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                selectDate(context);
              },
              child: Text(
                AppLocalizations.of(context)!.selectTime,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              selectedDate.toString().substring(0, 10),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: primryColorLight),
              onPressed: () {
                FirebaseFunctions.addTask(
                  TaskModel(
                    date: DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch,
                    description: taskdescriptionController.text,
                    title: taskTitleController.text,
                    userId:FirebaseAuth.instance.currentUser!.uid
                  ),
                );
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.white,
                    title: Text(
                      'The task have been added',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    actions: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primryColorLight),
                        onPressed: () {
                          Navigator.pop(context);
                          taskTitleController.clear();
                          taskdescriptionController.clear();
                        },
                        child: Text(
                          'Add another task',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(backgroundColor: Colors.red),
                        onPressed: () {
                          taskTitleController.clear();
                          taskdescriptionController.clear();
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Cancle',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      )
                    ],
                  ),
                );
              },
              child: Text(
                AppLocalizations.of(context)!.addNewTask,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  void selectDate(BuildContext context) async {
    DateTime? chosenDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: primryColorLight,
              onPrimary: Colors.white,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
            ),
          ),
          child: child!,
        );
      },
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );
    if (chosenDate == null) {
      return;
    }
    selectedDate = chosenDate;
    setState(() {});
  }
}
