import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../models/task_model.dart';
import '../../screens/edittasks/edit_task.dart';
import '../../screens/task_details/task_details.dart';
import '../network/firebase_functions.dart';
import '../styles/colors.dart';


class TaskItem extends StatelessWidget {
  final TaskModel task;
  TaskItem(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      margin: const EdgeInsets.all(20),
      child: Slidable(
        startActionPane: ActionPane(motion: const ScrollMotion(), children: [
          SlidableAction(
            onPressed: (context) {
              FirebaseFunctions.deleteTask(task.id);
            },
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (context) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditTaskPage(task: task),
                  ));
            },
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ]),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskDetails(task: task),
                ));
          },
          child: Container(
            height: 115,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondary,
                borderRadius: BorderRadius.circular(
                  15,
                ),
                border: Border.all(
                  color: Colors.transparent,
                )),
            child: Row(
              children: [
                VerticalDivider(
                  thickness: 4,
                  color:task.isDone!=true? primryColorLight:Colors.green,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(
                        task.title,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: primryColorLight),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: Text(
                        task.description,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: primryColorLight,
                            ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: task.isDone == true
                          ? Colors.green
                          : primryColorLight,
                      elevation: task.isDone == true ? 0 : 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: Colors.transparent))),
                  onPressed: () {
                    task.isDone = true;
                    FirebaseFunctions.updateTask(task);
                  },
                  child: task.isDone == true
                      ? Text(
                          'Done',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        )
                      : const Icon(
                          Icons.done,
                          color: Colors.white,
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
