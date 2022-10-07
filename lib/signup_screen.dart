import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'google_sign_in.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'main.dart';

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
            Padding(
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
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
              child: TextButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const EmailLoginPopUp(),
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
                  backgroundColor: Colors.grey[200],
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

class EmailLoginPopUp extends StatelessWidget {
  const EmailLoginPopUp({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Login with Email",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 500,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(25),
            ),
            child: const Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              width: 300,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                    autofocus: false,
                    obscureText: false,
                    decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                    ),
                    maxLines: 1,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.grey[200],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            textStyle: const TextStyle(fontSize: 16, fontFamily: "Poppins"),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: Text(
              'Cancel',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            textStyle: const TextStyle(
                fontSize: 16,
                fontFamily: "Poppins",
                color: Colors.white,
                fontWeight: FontWeight.w600),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: Text(
              'Login',
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
