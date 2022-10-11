import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../backend/google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../main.dart';
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

class EmailLoginPopUp extends StatefulWidget {
  const EmailLoginPopUp({super.key});

  @override
  State<EmailLoginPopUp> createState() => _EmailLoginPopUpState();
}

class _EmailLoginPopUpState extends State<EmailLoginPopUp> {
  String errorMsg = "";
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  bool _obscureText = true;
  String _hintText = "Password";
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      title: Text("Login with Email",
          style: Theme.of(context).textTheme.displayLarge),
      contentPadding: EdgeInsets.only(top: 30, right: 20, left: 20, bottom: 0),
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
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        controller: controllerEmail,
                        autofocus: true,
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        style: Theme.of(context).textTheme.displaySmall,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterText: "",
                            hintText: "Email"),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              width: 1000,
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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 5),
                        child: TextFormField(
                          controller: controllerPassword,
                          autofocus: false,
                          maxLength: 20,
                          obscureText: _obscureText,
                          textInputAction: TextInputAction.send,
                          onFieldSubmitted: (value) {},
                          style: Theme.of(context).textTheme.displaySmall,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              counterText: "",
                              hintText: _hintText),
                          keyboardType: TextInputType.visiblePassword,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(
                        () {
                          _obscureText = !_obscureText;
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              errorMsg,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: Theme.of(context).errorColor),
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
            setState(() {
              errorMsg = "";
            });

            if (controllerEmail.text == "") {
              setState(() {
                errorMsg = "Please enter \nEmail and Password";
              });
              return;
            } 

            if (controllerPassword.text == "") {
              setState(() {
                errorMsg = "Please enter \nEmail and Password";
              });
              return;
            }

            EmailLogin(
                email: controllerEmail.text,
                password: controllerPassword.text,
                context: context);
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

Future EmailLogin({required email, required password, context}) async {
  
  FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email, password: password);

  final User? user =  FirebaseAuth.instance.currentUser;

}
