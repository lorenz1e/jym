import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:JYM/home_screen.dart';
import 'package:provider/provider.dart';
import 'google_sign_in.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    
    body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Container(
              width: 600,
              child: const Text(
                "Sign Up",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 28,
                    fontFamily: "DMSans",
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: TextButton.icon(
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
                },
                label: const Text("Sign Up with Google"),
                icon: const Icon(FontAwesomeIcons.google),
                
                style: TextButton.styleFrom(
                    minimumSize: const Size(
                      500,
                      60,
                    ),
                    primary: Colors.white,
                    backgroundColor: Colors.blue,
                    
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    textStyle:
                        const TextStyle(fontSize: 18, fontFamily: "DMSans")
                        )
                    ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: TextButton.icon(
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
                },
                label: const Text("Sign Up with Apple"),
                icon: const Icon(FontAwesomeIcons.apple, size: 30,),
                
                style: TextButton.styleFrom(
                    minimumSize: const Size(
                      500,
                      60,
                    ),
                    primary: Colors.white,
                    backgroundColor: Colors.grey[900],
                    
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    textStyle:
                        const TextStyle(fontSize: 18, fontFamily: "DMSans")
                        )
                    ),
          ),

          
        ],
      ),
    ));
  }
}


Route _pageRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Homepage(),
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
