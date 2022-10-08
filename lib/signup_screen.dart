import 'package:JYM/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'main.dart';
import 'package:firebase_auth/firebase_auth.dart';



class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                "Sign Up / Login",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
              child: TextButton.icon(
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
                },
                label: const Text(
                  "Sign Up with Google",
                ),
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
                  textStyle: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),
         /*   Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
              child: TextButton.icon(
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
                },
                label: const Text(
                  "Sign Up with Apple",
                ),
                icon: const Icon(FontAwesomeIcons.apple, size: 30),
                style: TextButton.styleFrom(
                  minimumSize: const Size(
                    500,
                    60,
                  ),
                  primary: Colors.white,
                  backgroundColor: Colors.grey[900],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  textStyle: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),      */
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
              child: TextButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => EmailLoginPopUp(),
                  );
                },
                label: const Text(
                  "Login with Email",
                ),
                icon: const Icon(Icons.mail),
                style: TextButton.styleFrom(
                  minimumSize: const Size(
                    500,
                    60,
                  ),
                  primary: Colors.black,
                  backgroundColor: Theme.of(context).buttonColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  textStyle: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

final controllerEmail = TextEditingController();
final controllerPassword= TextEditingController();

class EmailLoginPopUp extends StatelessWidget {

  const EmailLoginPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      title: Text("Login with Email",
          style: Theme.of(context).textTheme.headlineSmall),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Theme.of(context).buttonColor,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: TextFormField(
                      controller: controllerEmail,
                      
                      autofocus: false,
                      obscureText: false,
                      style: Theme.of(context).textTheme.displaySmall,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          border: InputBorder.none, counterText: ""),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                ),
                
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Theme.of(context).buttonColor,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: TextFormField(
                        controller: controllerPassword,
                        autofocus: false,
                        obscureText: false,
                        style: Theme.of(context).textTheme.displaySmall,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            border: InputBorder.none, counterText: ""),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).buttonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              textStyle: Theme.of(context).textTheme.displaySmall,
              foregroundColor: Colors.black),
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
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              textStyle: Theme.of(context).textTheme.displaySmall),
          onPressed: () {
            EmailLogin(email: controllerEmail.text, password: controllerPassword.text);
          },
          child: const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text('Login',
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

Future EmailLogin({required email, required password}) async {
  FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
}