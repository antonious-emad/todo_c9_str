import 'package:flutter/material.dart';
import '../../models/tsak_model.dart';
import '../../shared/network/firebase.dart';
import '../../styles/colors.dart';
class UpdateScreen extends StatefulWidget {
  static String routeName = 'update';

  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}
class _UpdateScreenState extends State<UpdateScreen> {
  late TextEditingController titleControler;

  // to control TFF
  late TextEditingController discriptionControler;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  DateTime SelectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    TaskData task = ModalRoute.of(context)!.settings.arguments as TaskData;
    titleControler = TextEditingController(text: task.title);
    discriptionControler = TextEditingController(text: task.description);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                title: const Text("Todo"),
                backgroundColor: primaryColor,
                toolbarHeight: MediaQuery.of(context).size.height * .18,
                flexibleSpace: SizedBox(
                  height: MediaQuery.of(context).size.height * .18,
                ),
                titleSpacing: MediaQuery.of(context).size.width * 0.1,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.06,
                    vertical: MediaQuery.of(context).size.width * 0.06),
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.06,
                    vertical: MediaQuery.of(context).size.width * 0.06),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Edit Task",
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
                              onChanged: (text) {
                                task.title = text;
                              },
                              validator: (text) {
                                if (text != null && text.isEmpty) {
                                  return 'Please enter task title';
                                }

                                return null;
                              },
                              decoration: InputDecoration(
                                label: Text(
                                  "Edit Title",
                                  style:
                                  Theme.of(context).textTheme.displayLarge,
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
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
                              onChanged: (text) {
                                task.description = text;
                              },
                              validator: (text) {
                                if (text != null && text.isEmpty) {
                                  return 'Please enter task description';
                                }
                                return null;
                              },
                              maxLines: 2,
                              decoration: InputDecoration(
                                label: Text(
                                  "Edit Discription",
                                  style:
                                  Theme.of(context).textTheme.displayLarge,
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
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
                              "Select Edit date",
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              onTap: () {
                                DisplayCleander(context);
                              },
                              child: Text(
                                '${SelectedDate.year}/${SelectedDate.month}/${SelectedDate.day}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
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
                                    TaskData task1 = TaskData(
                                        id: task.id,
                                        title: titleControler.text,
                                        description: discriptionControler.text,
                                        Date: DateUtils.dateOnly(SelectedDate)
                                            .microsecondsSinceEpoch);
                                    // showLoding(context, 'Loding....');
                                    updateTaskToFirebase(task1); /*.then((value) {*/
                                    // hideLoding(context);
                                    // showMessage(context, "Task Updated", 'Ok', () {
                                    //       Navigator.pop(context);
                                    //       Navigator.pop(context);
                                    //     });
                                    /*}).catchError((error) {
                          print("error");
                        });*/
                                  }
                                },
                                child: const Text("Save Changes")),
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
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