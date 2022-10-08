import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'data.dart';
import 'create_screen.dart';
import 'create_screen.dart';

final user = FirebaseAuth.instance.currentUser!;

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  final Stream<QuerySnapshot> items = FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('items')
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: items,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        final data = snapshot.requireData;

        if (data.size == 0) {
          return Center(
            child: Container(
              width: 340,
              height: 220,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 215, 215, 215),
                        blurRadius: 20,
                        offset: Offset(0, 3),
                        spreadRadius: -3)
                  ],
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create An Exercise",
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.push(context, _pageRoute());
                        },
                        label: const Text(
                          "Create",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        icon: const Icon(Icons.add),
                        style: TextButton.styleFrom(
                          minimumSize: const Size(
                            160,
                            60,
                          ),
                          primary: Colors.white,
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          textStyle: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        if (snapshot.hasError) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.all(00.0),
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 100, top: 20),
              itemCount: data.docs.length,
              itemBuilder: (context, index) {
                return Item(
                  data.docs[index]['name'],
                  data.docs[index]['weight'],
                  data.docs[index]['unit'],
                  data.docs[index]['reps'],
                  data.docs[index]['sets'],
                );
              },
            ),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

Route _pageRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const CreateScreen(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

void editItemPopUp(name, weight, unit, reps, sets, context,
    {required focusMode1, required focusMode2, required focusMode3}) {
  selectedItem = unit;

  final weightsContoller = TextEditingController(text: weight);
  final setsContoller = TextEditingController(text: sets);
  final repsContoller = TextEditingController(text: reps);

  final weightsContollerDisplay = TextEditingController(text: "kg");
  final setsContollerDisplay = TextEditingController(text: "Sets");
  final repsContollerDisplay = TextEditingController(text: "Reps");

  showModalBottomSheet(
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        child: Container(
          padding: MediaQuery.of(context).viewInsets,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 20),
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, bottom: 20, top: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                        child: Container(
                          width: 100,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Theme.of(context).buttonColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: TextFormField(
                              controller: weightsContoller,
                              autofocus: focusMode1,
                              textInputAction: TextInputAction.next,
                              obscureText: false,
                              decoration: const InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                              ),
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const WeightDropdown()
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                        child: Container(
                          width: 100,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Theme.of(context).buttonColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: TextFormField(
                                    controller: setsContoller,
                                    autofocus: focusMode2,
                                    obscureText: false,
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                    maxLength: 4,
                                    cursorColor: Colors.blue,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        counterText: ""),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: TextFormField(
                                    controller: setsContollerDisplay,
                                    autofocus: false,
                                    obscureText: false,
                                    readOnly: true,
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.center,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Container(
                          width: 100,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Theme.of(context).buttonColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: TextFormField(
                                    controller: repsContoller,
                                    autofocus: focusMode3,
                                    obscureText: false,
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: TextFormField(
                                    obscureText: false,
                                    controller: repsContollerDisplay,
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Align(
                        child: Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                              color: Theme.of(context).errorColor,
                              shape: BoxShape.circle),
                          child: IconButton(
                            onPressed: () {
                              print(name);
                              showDialog(
                                  context: context,
                                  builder: (context) =>
                                      deletePopUp(name1: name));
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        updateItem(
                            exercise: name,
                            sets: setsContoller.text,
                            reps: repsContoller.text,
                            weight: weightsContoller.text,
                            unit: selectedItem);
                        Navigator.pop(context);
                      },
                      label: const Text("Save"),
                      icon: const Icon(Icons.save_rounded),
                      style: TextButton.styleFrom(
                        elevation: 0,
                        minimumSize: const Size(
                          160,
                          60,
                        ),
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}

class deletePopUp extends StatelessWidget {
  var name1;
  deletePopUp({super.key, this.name1});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Delete $name1",
          style: Theme.of(context).textTheme.headlineSmall),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).buttonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              textStyle: Theme.of(context).textTheme.displaySmall,
              foregroundColor: Colors.black
            ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Cancel',
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).errorColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            textStyle: Theme.of(context).textTheme.displaySmall,
          ),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
            deleteItem(name1);
          },
          child: const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Delete',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins"),
            ),
          ),
        ),
      ],
    );
  }
}
