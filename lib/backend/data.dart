import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

Future createItem({required exercise, weight, unit, sets, reps}) async {
  final User user = auth.currentUser as User;
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
  final User user = auth.currentUser as User;
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
  final User user = auth.currentUser as User;
  FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('items')
      .doc(name)
      .delete();
}

Future fetchItems() async {
  final User user = auth.currentUser as User;

  final Stream<QuerySnapshot> items = FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('items')
      .snapshots();
  return items;
}

class Items {
  late String items;
  Future fetchItems() async {
    final User user = auth.currentUser as User;

    final Stream<QuerySnapshot> items = FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('items')
        .snapshots();
    return items;
  }

  void printIt() {
    print(items);
  }
}

class UserData {
  Future update() async {
    final User user = auth.currentUser! as User;

    final doc = FirebaseFirestore.instance.collection("users").doc(user.uid);

    final data1 = {
      "uid": user.uid,
      "email": user.email,
      "name": user.displayName,
      "lastLogin": DateTime.now()
    };

    await doc.set(data1);
  }
}

class Templates {

  Stream<List<Templates>> readTemplates() => FirebaseFirestore.instance
    .collection('users')
    .snapshots()
    .map((snapshot) => 
          snapshot.docs.map((doc) => Templates.fromJson(doc.data())).toList()
        );
  late String name;

  Templates.fromJson(Map<String, dynamic> json) {
    name: json["name"];
  }
}
