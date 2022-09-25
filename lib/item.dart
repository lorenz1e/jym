import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'data.dart';
import 'home_screen_body.dart';



// ITEM REGULAR

class Item extends StatelessWidget {
  Item(this.name, this.weight, this.unit, this.reps, this.sets);

  final String name, weight, unit, reps, sets;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
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

          color: Colors.white
        ),

        child: Padding(
          padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  
                  children: [
                    InkWell(
                      onTap: () => editItemPopUp(name, weight, unit, reps, sets, context),
                      child: Container(
                        width: 150,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                          
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(children: [
                            const Icon(Icons.fitness_center_rounded, color: Colors.white),
                            const Spacer(),
                            Text("$weight $unit",
                                  style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  color: Colors.white
                                )
                              ),
                            const Spacer()
                            ],
                          ),
                        )
                      ),
                    ),
          
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: InkWell(
                        onTap: () => editItemPopUp(name, weight, unit, reps, sets, context),
                        child: Container(
                          width: 150,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(children: [
                              
                              const Icon(Icons.abc, color: Colors.white),
                              Spacer(),
                              Text("${sets} x ${reps}",
                                    style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.white
                                    )
                                ),
                              Spacer()
                              ],
                            ),
                          )
                        ),
                      ),
                    ),

                    Spacer(),

                    Text(name, 
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700
                    ),
                  )
                ],
          ),
          Spacer(),
          IconButton(onPressed: () {
            editItemPopUp(name, weight, unit, reps, sets, context);
          }, icon: Icon(Icons.edit)),
          Spacer()
              ],
            ),
        ),
      )
    );
  }


}

// LAST ITEM OF LIST

class LastItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Divider(),
          ),

          // LOGOUT

          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Align(
                child: SizedBox(
                    child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context, builder: (context) => signOutPopUp());
                  },
                  child: Container(
                      width: 55,
                      height: 55,
                      child: Icon(Icons.logout, size: 28),
                      decoration: BoxDecoration(
                          color: Colors.grey[200], shape: BoxShape.circle)),
                )),
              )),
        ],
      ),
    );
  }
}



class signOutPopUp extends StatelessWidget {
  const signOutPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Sign Out?'),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('CANCEL'),
        ),
        TextButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.pop(context);
          },
          child: Text(
            'SIGN OUT',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
