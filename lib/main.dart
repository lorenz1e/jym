import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'signup_screen.dart';
import 'package:JYM/home_screen.dart';
import 'data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String appFont = 'Poppins';
bool connectionStatus = false;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  updateUserData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: false,
        splitScreenMode: false,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              useMaterial3: true,
              primaryTextTheme: const TextTheme(
                  headline1: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                  headline2: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black)),
              cardColor: Colors.white,
              fontFamily: appFont,
              primaryColor: Colors.blue,
              primarySwatch: Colors.blue,
              buttonColor: Colors.grey[300],
              backgroundColor: const Color.fromARGB(255, 247, 247, 247),
              scaffoldBackgroundColor: const Color.fromARGB(255, 247, 247, 247),
              brightness: Brightness.light,
              iconTheme:
                  const IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                ),
              ),
              textTheme: TextTheme(
                headlineLarge: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 38,
                    color: Colors.black,
                    fontFamily: appFont),
                headlineMedium: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                    color: Colors.black,
                    fontFamily: appFont),
                headlineSmall: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 26,
                    color: Colors.black,
                    fontFamily: appFont),
                displayLarge: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: appFont,
                    color: Colors.black,
                    fontSize: 22),
                displayMedium: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: appFont,
                    color: Colors.black,
                    fontSize: 20),
                displaySmall: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: appFont,
                    color: Colors.black,
                    fontSize: 16),
              )),

          /*    darkTheme: ThemeData(
            useMaterial3: true,
            cardColor: Colors.grey[900],
            fontFamily: appFont,
            iconTheme: IconThemeData(
              color: Colors.white
            ),
            dialogBackgroundColor: Color.fromARGB(255, 25, 25, 25),
            primaryColor: Colors.blue,
            primarySwatch: Colors.blue,
            buttonColor: Colors.grey[900],
            backgroundColor: Color.fromARGB(255, 25, 25, 25),
            scaffoldBackgroundColor: Color.fromARGB(255, 25, 25, 25),
            brightness: Brightness.light,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                foregroundColor: Colors.white,
              ),
            ),
            textTheme: TextTheme(
              headlineLarge: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 38,
                  color: Colors.white,
                  fontFamily: appFont
                  ),
              headlineMedium: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                  color: Colors.white,
                  fontFamily: appFont),

              headlineSmall: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 26,
                  color: Colors.white,
                  fontFamily: appFont),
              displayLarge: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: appFont,
                  color: Colors.white,
                  fontSize: 22),
              displayMedium: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: appFont,
                  color: Colors.white,
                  fontSize: 20),
              displaySmall: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: appFont,
                  color: Colors.white,
                  fontSize: 16),
                ),
            ), */
          home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const Homepage();
              } else {
                return const SignUpScreen();
              }
            },
          ),
        ),
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
