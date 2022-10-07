import 'create_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen_body.dart';
import 'settings_screen.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomeState();
}

class _HomeState extends State<Homepage> {

 @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        floatingActionButton: Container(
          decoration: BoxDecoration(
            boxShadow: [
            BoxShadow(
                color: const Color.fromARGB(255, 0, 0, 0).withOpacity(.3),
                blurRadius: 8,
                offset: const Offset(0, 8),
                spreadRadius: -3)
          ],
            borderRadius: BorderRadius.circular(200),
            color: Theme.of(context).primaryColor
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context, _pageRouteSettingsScreen());
                    }, 
                    icon: const Icon(Icons.settings, color: Colors.white,), 
                    iconSize: 24,
               
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add, color: Colors.white,), 
                  iconSize: 26,
                  
                  onPressed: () {
                    Navigator.push(context, _pageRouteCreateScreen());
                  }
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: const HomeScreenBody()
      ),
    );
  }
}



Route _pageRouteCreateScreen() {
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

Route _pageRouteSettingsScreen() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
      const SettingsScreen(),
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