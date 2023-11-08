import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/task_model.dart';
import '../../shared/network/firebase_functions.dart';
import '../../shared/styles/colors.dart';

class AddTaskBottomSheet extends StatefulWidget {
  AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime selectedDate = DateTime.now();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Text(
          //   "Add New Task",
          //   textAlign: TextAlign.center,
          //   style:
          //       Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 22),
          // ),
          Text(
            AppLocalizations.of(context)!.addNewTask,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onPrimary),
            textAlign: TextAlign.center,
          ),
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: primaryColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: primaryColor)),
              labelText: AppLocalizations.of(context)!.title,
              hintText: AppLocalizations.of(context)!.enterTitle,
            ),
          ),
          SizedBox(
            height: 22,
          ),
          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: primaryColor)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: primaryColor)),
              labelText: AppLocalizations.of(context)!.taskDescription,
              hintText: AppLocalizations.of(context)!.enterTaskDescription,
            ),
          ),
          SizedBox(
            height: 22,
          ),
          InkWell(
            onTap: () {
              showPicker(context: context);            },
            child: Text(
              textAlign: TextAlign.start,
              AppLocalizations.of(context)!.selectTime,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.blue),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            selectedDate.toString().substring(0, 10),
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.blue),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),

          // Text("Select Date",
          //     textAlign: TextAlign.start,
          //     style: Theme.of(context).textTheme.bodySmall),
          // InkWell(
          //   onTap: () {
          //     showPicker(context: context);
          //   },
          //   child: Text(
          //     "${selectedDate.toString().substring(0, 10)}",
          //     style: Theme.of(context)
          //         .textTheme
          //         .bodySmall!
          //         .copyWith(color: Colors.blue),
          //     textAlign: TextAlign.center,
          //   ),
          // ),
          ElevatedButton(
              onPressed: () {
                TaskModel task = TaskModel(
                    userId: FirebaseAuth.instance.currentUser!.uid,
                    title: titleController.text,
                    description: descriptionController.text,
                    date: DateUtils.dateOnly(selectedDate)
                        .millisecondsSinceEpoch);

                print(selectedDate);
                FirebaseFunctions.addTask(task);
                Navigator.pop(context);
              },
              child: Text(
                AppLocalizations.of(context)!.addNewTask,

              ))
        ],
      ),
    );
  }

  showPicker({required BuildContext context}) async {
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));

    if (chosenDate == null) return;
    selectedDate = chosenDate;
    setState(() {});
  }

// SELECT * FROM TABLE NAME where
// "INSERT int TAble name value()"
}
