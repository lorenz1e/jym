import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final List templates = [
  'Butterfly',
  'Reverse Butterfly',
  'Push Up',
  "asdf1",
  "asdf2",
  "asdf3",
  "asdf4",
  "asdf5"
];

final user = FirebaseAuth.instance.currentUser!;

Future updateUserData() async {
  final doc = FirebaseFirestore.instance.collection("users").doc(user.uid);

  final data1 = {
    "uid": user.uid,
    "email": user.email,
    "name": user.displayName,
    "lastLogin": DateTime.now()
  };

  await doc.set(data1);
}

Future createItem({required exercise, weight, unit, sets, reps}) async {
  final doc = FirebaseFirestore.instance
      .collection("users")
      .doc(user.uid)
      .collection('items')
      .doc(exercise);

  final data = {
    "name": exercise,
    "weight": weight,
    "unit": unit,
    "sets": sets,
    "reps": reps,
    "startDate": DateTime.now()
  };

  await doc.set(data);
}

Future updateItem(
    {required exercise,
    required weight,
    required unit,
    required sets,
    required reps}) async {
  final doc = FirebaseFirestore.instance
      .collection("users")
      .doc(user.uid)
      .collection('items')
      .doc(exercise);

  final data = {
    "name": exercise,
    "weight": weight,
    "unit": unit,
    "sets": sets,
    "reps": reps,
    "lastUpdate": DateTime.now()
  };

  final doc1 = FirebaseFirestore.instance.collection("users").doc(user.uid);

  final data1 = {
    "uid": user.uid,
    "email": user.email,
    "name": user.displayName,
  };
  await doc.set(
    data,
    SetOptions(merge: true),
  );
  await doc1.set(data1);
}

Future deleteItem(name) async {
  FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('items')
      .doc(name)
      .delete();
}

