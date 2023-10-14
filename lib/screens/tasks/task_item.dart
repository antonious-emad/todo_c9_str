import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/screens/tasks/update_tasks.dart';
import '../../models/tsak_model.dart';
import '../../shared/network/firebase.dart';
import '../../styles/colors.dart';
class TaskItem extends StatelessWidget {
  TaskData task;
  TaskItem(this.task, {super.key});
  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(motion: const BehindMotion(), children: [
        SlidableAction(
          onPressed: (context) {
            deleteTaskFromFirebase(task.id);
          },
          borderRadius: BorderRadius.circular(12),
          backgroundColor: colorRed,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: "delete",
        ),
        SlidableAction(
          onPressed: (context) {
            Navigator.pushNamed(context, UpdateScreen.routeName,
                arguments: task);
          },
          borderRadius: BorderRadius.circular(12),
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          icon: Icons.edit,
          label: "edit",
        ),
      ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(14)
          ),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                Container(
                  width: 3,
                  height: 80,
                  color: task.isDone ? colorGreen : Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: task.isDone
                          ? Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: colorGreen)
                          : Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(task.description,
                        style: Theme.of(context).textTheme.displayLarge),
                  ],
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    if (!task.isDone) {
                      UpdateDone(task);
                    }
                  },
                  child: task.isDone
                      ? const Text(
                    "Done!",
                    style: TextStyle(color: colorGreen),
                  )
                      : Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(6)),
                    child: Icon(Icons.done_outlined,color: Colors.white,size: 20,),
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