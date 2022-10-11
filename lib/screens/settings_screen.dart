import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Settings",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
                child: TextButton.icon(
                  onPressed: () {},
                  label: Text(
                    "Information",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  icon: Icon(Icons.info,
                      color: Theme.of(context).iconTheme.color),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    minimumSize: const Size(
                      500,
                      60,
                    ),
                    backgroundColor: Theme.of(context).buttonColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: TextButton.icon(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) => const signOutPopUp());
                  },
                  label: Text(
                    "Sign Out",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  icon: Icon(Icons.logout,
                      color: Theme.of(context).iconTheme.color),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    minimumSize: const Size(
                      500,
                      60,
                    ),
                    backgroundColor: Theme.of(context).buttonColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    textStyle:
                        const TextStyle(fontSize: 18, fontFamily: "Poppins"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                      color: Theme.of(context).buttonColor,
                      shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back,
                        color: Theme.of(context).iconTheme.color),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class signOutPopUp extends StatelessWidget {
  const signOutPopUp({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      
      title:
          Text("Sign Out?", style: Theme.of(context).textTheme.headlineSmall),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).buttonColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            textStyle: Theme.of(context).textTheme.displaySmall,
            foregroundColor: Colors.black,
            
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              textStyle: Theme.of(context).textTheme.displaySmall),
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.pop(context);
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text('Sign Out',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins")),
          ),
        ),
      ],
    );
  }
}
