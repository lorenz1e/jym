import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  
  int currentIndex = 0;

  void onChange(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
     
          onTap: onChange,
          items: const [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "adf"),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.add), label: "asdf")
        ],
      );
  }
}


