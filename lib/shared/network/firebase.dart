import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../models/tsak_model.dart';

CollectionReference<TaskData> getCollection() {
  return FirebaseFirestore.instance.collection('tasks').withConverter<TaskData>(
      fromFirestore: (snapshot, options) => TaskData.fromJson(snapshot.data()!),
      toFirestore: (task, option) => task.toJson());
}

Future<void> addTaskToFirebase(TaskData taskData) {
  var collection = getCollection();
  var documentRefrence = collection.doc();
  taskData.id = documentRefrence.id;
  return documentRefrence.set(taskData);
}

Stream<QuerySnapshot<TaskData>> getTaskFromFirebase(DateTime dateTime) {
  return getCollection()
      .where('Date',
      isEqualTo: DateUtils.dateOnly(dateTime).microsecondsSinceEpoch)
      .snapshots();
}

Future<void> deleteTaskFromFirebase(String id) {
  return getCollection().doc(id).delete();
}

Future<void> updateTaskToFirebase(TaskData taskData) {
  return getCollection().doc(taskData.id).update({
    "Date": taskData.Date,
    "description": taskData.description,
    "isDone": taskData.isDone,
    "title": taskData.title
  });
}

Future<void> UpdateDone(TaskData taskData) {
  return getCollection().doc(taskData.id).update({
    "isDone": true,
  });
}