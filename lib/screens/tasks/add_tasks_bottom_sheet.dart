import 'package:flutter/material.dart';
import '../../models/tsak_model.dart';
import '../../shared/network/firebase.dart';
import '../../styles/colors.dart';
class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}
class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var titleControler = TextEditingController(); // to control TFF
  var discriptionControler = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  DateTime SelectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.onPrimary,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          Text(
            "Add New Task",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(
            height: 15,
          ),
          Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: titleControler,
                    validator: (text) {
                      if (text != null && text.isEmpty) {
                        return 'Please enter task title';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      label: Text("Title",
                          style: Theme.of(context).textTheme.displayLarge),
                      enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: primaryColor,
                        ),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: primaryColor,
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: discriptionControler,
                    validator: (text) {
                      if (text != null && text.isEmpty) {
                        return 'Please enter task description';
                      }
                      return null;
                    },
                    maxLines: 2,
                    decoration: InputDecoration(
                      label: Text("Discription",
                          style: Theme.of(context).textTheme.displayLarge),
                      enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: primaryColor,
                        ),
                      ),
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: primaryColor,
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                      "Select date",
                      style: Theme.of(context).textTheme.displayLarge),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      DisplayCleander(context);
                    },
                    child: Text(
                      '${SelectedDate.year}/${SelectedDate.month}/${SelectedDate.day}',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: primaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          TaskData task = TaskData(
                              title: titleControler.text,
                              description: discriptionControler.text,
                              Date: DateUtils.dateOnly(SelectedDate).microsecondsSinceEpoch
                          );
                          addTaskToFirebase(task); /*.then((value) {*/
                        }
                      },
                      child: Text("Add Task",
                          style: Theme.of(context).textTheme.displayLarge)),
                ],
              )),
        ],
      ),
    );
  }

  Future<void> DisplayCleander(BuildContext context) async {
    DateTime? choosen = await showDatePicker(
        context: context,
        initialDate: SelectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    setState(() {
      if (choosen == null) return;
      SelectedDate = choosen;
    });
  }
}