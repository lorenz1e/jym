import 'package:flutter/material.dart';
import 'data.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  var exerciseButtonText = "Exercise";

  var color1 = Colors.blue;

  var weightsUnitButtonText = "kg";

  final controllerWeights = TextEditingController(text: "10");
  final controllerSets = TextEditingController(text: "3");
  final controllerReps = TextEditingController(text: "8");

  final controllerSetsDisplay = TextEditingController(text: "Sets");
  final controllerRepsDisplay = TextEditingController(text: "Reps");

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (index) => Navigator.pop(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Create",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                child: TextButton.icon(
                    onPressed: () {
                      exercisePopUp();
                    },
                    label: Text(
                      exerciseButtonText,
                      style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    icon: const Icon(Icons.sports_gymnastics),
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.white, minimumSize: const Size(
                          500,
                          60,
                        ),
                        backgroundColor: color1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        textStyle: const TextStyle(
                            fontSize: 20, fontFamily: "DMSans"))),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, bottom: 20, top: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                        child: Container(
                          width: 100,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: TextFormField(
                              controller: controllerWeights,
                              autofocus: false,
                              obscureText: false,
                              decoration: const InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                              ),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const WeightDropdown()
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                        child: Container(
                          width: 100,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: TextFormField(
    
                                    controller: controllerSets,
                                    autofocus: false,
                                    
                                    obscureText: false,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                    maxLength: 4,
                                    cursorColor: color1,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        counterText: ""),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: TextFormField(
                                    controller: controllerSetsDisplay,
                                    autofocus: false,
                                    obscureText: false,
                                    readOnly: true,
                                    
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.center,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Container(
                          width: 100,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: TextFormField(
                                    controller: controllerReps,
                                    autofocus: false,
                                    obscureText: false,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.center,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: TextFormField(
                                    autofocus: false,
                                    obscureText: false,
                                    controller: controllerRepsDisplay,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                            padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                            child: Row(children: [
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Align(
                                  child: Container(
                                      width: 55,
                                      height: 55,
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          shape: BoxShape.circle),
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(Icons.arrow_back),
                                      )),
                                ),
                              ),
                              TextButton.icon(
                                  onPressed: () {
                                    createItem(
                                      exercise: exerciseButtonText, 
                                      weight: controllerWeights.text, 
                                      unit: selectedItem,
                                      reps: controllerReps.text, 
                                      sets: controllerSets.text, 
                                    );
                                    updateUserData();
                                    Navigator.pop(context);
                                  },
                                  label: const Text("Create"),
                                  icon: const Icon(Icons.add),
                                  style: TextButton.styleFrom(
                                      foregroundColor: Colors.white, minimumSize: const Size(
                                        160,
                                        60,
                                      ),
                                      backgroundColor: color1,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25)),
                                      textStyle: const TextStyle(
                                          fontSize: 20,
                                          fontFamily: "DMSans",
                                          fontWeight: FontWeight.w500))),
                              const Spacer()
                            ]
                          )
                        )
            ],
          ),
        ),
      ),
    );
  }

  void exercisePopUp() {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        context: context,
        builder: (context1) {
          return ListView.builder(
            itemCount: templates.length,
            itemBuilder: (BuildContext context, int index) {
              return (ListTile(
                title: Text(templates[index]),
                leading: const Icon(Icons.sports_gymnastics),
                onTap: () {
                  setState(() {
                    exerciseButtonText = (templates[index]);
                  });
                  Navigator.pop(context);
                },
              ));
            },
          );
        });
  }
}

String? selectedItem = "kg";
List items = ["kg", "lbs"];

void checkDropdown() {
  if (selectedItem == "kg") {
    print("asdf");
  }
}

class WeightDropdown extends StatefulWidget {
  const WeightDropdown({super.key});

  @override
  State<WeightDropdown> createState() => _WeightDropdownState();
}

class _WeightDropdownState extends State<WeightDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: DropdownButton<String>(
              value: selectedItem,
              underline: const SizedBox(),
              borderRadius: BorderRadius.circular(25),
              onChanged: (item) => setState(() => selectedItem = item),
              dropdownColor: Colors.grey[200],
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: "DMSans",
                  fontWeight: FontWeight.w500),
              elevation: 0,
              items: items
                  .map((item) =>
                      DropdownMenuItem<String>(value: item, child: Text(item)))
                  .toList()),
        ),
      ),
    );
  }
}
