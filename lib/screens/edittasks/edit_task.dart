import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../models/task_model.dart';
import '../../shared/network/firebase_functions.dart';
import '../../shared/styles/colors.dart';
import '../../shared/widgets/tasks_filed.dart';


class EditTaskPage extends StatefulWidget {
  const EditTaskPage({super.key, required this.task});
  final TaskModel task;

  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {
  DateTime selectedDate = DateTime.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  void initState() {
    super.initState();
    titleController.text = widget.task.title;
    descriptionController.text = widget.task.description;
    selectedDate = DateTime.fromMillisecondsSinceEpoch(widget.task.date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          'To Do List',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:
              const EdgeInsets.only(bottom: 36, top: 16, left: 16, right: 16),
          margin:
              const EdgeInsets.only(top: 20, bottom: 50, left: 20, right: 20),
          decoration: BoxDecoration(
            border: Border.all(color: primryColorLight),
            borderRadius: BorderRadius.circular(18),
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Edit Task',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onError),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              TaskFiled(
                  controller: titleController,
                  labelText: 'Edit title',
                  hintText: 'title'),
              const SizedBox(
                height: 20,
              ),
              TaskFiled(
                  controller: descriptionController,
                  labelText: 'Edit desciption',
                  hintText: 'desciption'),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  selectDate();
                },
                child: Text(
                  'Seleted date',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onError),
                  textAlign: TextAlign.start,
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
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primryColorLight,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                  onPressed: () {
                    FirebaseFunctions.updateTask(TaskModel(
                        date: selectedDate.millisecondsSinceEpoch,
                        description: descriptionController.text,
                        title: titleController.text,
                        id: widget.task.id,
                        isDone: widget.task.isDone, userId:FirebaseAuth.instance.currentUser!.uid ));
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Save Changes',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Theme.of(context).colorScheme.onError),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectDate() async {
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(
          const Duration(days: 365),
        ));
    if (chosenDate == null) {
      return;
    }
    selectedDate = chosenDate;
    setState(() {});
  }
}
