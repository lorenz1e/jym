import 'package:JYM/settings_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'data.dart';
import 'create_screen.dart';
import 'create_screen.dart';
import 'home_screen.dart';

123
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
                      children: [
                        const Spacer(),
                        const Text(
                          "Create An Exercise",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextButton.icon(
                              onPressed: () {
                                Navigator.push(context, _pageRoute());
                              },
                              label: const Text("Create", style: TextStyle(fontWeight: FontWeight.w500),),
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
                                  textStyle: const TextStyle(
                                      fontSize: 20, fontFamily: "Poppins"))),
                        ),
                        Spacer()
                      ],
                    ),
                  )));
        }

        if (snapshot.hasError) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasData) {
          return Padding(
              padding: const EdgeInsets.all(00.0),
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: 100, top: 20),
                  itemCount: data.docs.length,
                  itemBuilder: (context, index) {
                   
                    return Item(
                      data.docs[index]['name'],
                      data.docs[index]['weight'],
                      data.docs[index]['unit'],
                      data.docs[index]['reps'],
                      data.docs[index]['sets'],
                    );
                  }
                )
              );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
  
}

Route _pageRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
      CreateScreen(),
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



void editItemPopUp(name, weight, unit, reps, sets, context) {
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
      builder: (context1) {
        return Container(
          //margin: EdgeInsets.only(
              //      bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
                children: [
             Padding(
             padding: const EdgeInsets.only(bottom: 10, top: 20),
             child: Text(
               "Edit $name",
               style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
             ),
             ),
             Divider(),
             
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
                         color: Colors.grey[200],
                         borderRadius: BorderRadius.circular(25),
                       ),
                       child: Align(
                         alignment: const AlignmentDirectional(0, 0),
                         child: TextFormField(
                           controller: weightsContoller,
                           autofocus: false,
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
                         color: Colors.grey[200],
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
                                 autofocus: true,
                                 
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
                         color: Colors.grey[200],
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
                                 autofocus: false,
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
                                 autofocus: false,
                                 obscureText: false,
                                 controller: repsContollerDisplay,
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
                         child: Row(children: [
                           Spacer(),
                           Padding(
                             padding: const EdgeInsets.only(right: 20),
                             child: Align(
                               child: Container(
                                   width: 55,
                                   height: 55,
                                   child: IconButton(
                                     onPressed: () {
                                       deleteItem(name);
                                       Navigator.pop(context);
                                     },
                                     icon: Icon(Icons.delete, color: Colors.red,),
                                   ),
                                   decoration: BoxDecoration(
                                       color: Colors.grey[200],
          
                                       shape: BoxShape.circle)),
                             ),
                           ),
                           TextButton.icon(
                               onPressed: () {
                                 updateItem(exercise: name, sets: setsContoller.text, reps: repsContoller.text, weight: weightsContoller.text, unit: unit);
                                 Navigator.pop(context);
                               },
                               label: const Text("Save"),
                               icon: const Icon(Icons.save),
                               style: TextButton.styleFrom(
                                   minimumSize: const Size(
                                     160,
                                     60,
                                   ),
                                   primary: Colors.white,
                                   backgroundColor: Colors.blue,
                                   shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.circular(25)),
                                   textStyle: const TextStyle(
                                       fontSize: 18,
                                       fontFamily: "DMSans",
                                       fontWeight: FontWeight.w500))),
                           Spacer(),
                           Padding(padding: EdgeInsets.only(bottom:MediaQuery.of(context).viewInsets.bottom))

                         ]
                       )
                     )
            
             
               ]),
          );}
        );
      }
 
