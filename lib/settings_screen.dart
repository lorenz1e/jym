import 'package:flutter/material.dart';

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
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Settings",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
            child: TextButton.icon(
                onPressed: () {},
                label: Text(
                  "Information",
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontFamily: "Poppins"),
                ),
                icon: const Icon(Icons.info),
                style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    minimumSize: const Size(
                      500,
                      60,
                    ),
                    backgroundColor: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    textStyle:
                        const TextStyle(fontSize: 18, fontFamily: "DMSans"))),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Align(
              child: Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.grey[200], shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  )),
            ),
          ),
        ])));
  }
}
