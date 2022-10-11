/* import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../backend/data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  var _error = "";
  var exerciseButtonText = "Select";
  var exerciseButtonTextColor = Colors.black;

  var exerciseButtonColor = Colors.grey[300];

  var weightsUnitButtonText = "kg";

  final controllerName = TextEditingController();
  final controllerWeights = TextEditingController(text: "10");
  final controllerSets = TextEditingController(text: "3");
  final controllerReps = TextEditingController(text: "8");

  final controllerSetsDisplay = TextEditingController(text: "Sets");
  final controllerRepsDisplay = TextEditingController(text: "Reps");

  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  "Create",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              StreamBuilder<List<Templates>>(
                stream: readTemplates(),
                builder: (context, snapshot) {
                  final asdf = snapshot.data!.toList();
                  return Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 20),
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Theme.of(context).buttonColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: TypeAheadField(
                            suggestionsCallback: (pattern) => asdf.map(
                              (template) => template
                                  .toLowerCase()
                                  .contains(pattern.toLowerCase()),
                            ),
                            itemBuilder: (_, String template) =>
                                ListTile(title: Text(template)),

                            onSuggestionSelected: (String val) {
                              controllerName.text = val;
                            },
                           // minCharsForSuggestions: 1,
                            textFieldConfiguration: TextFieldConfiguration(
                              controller: controllerName,
                              maxLength: 24,
                              autofocus: true,
                              obscureText: false,
                              decoration: const InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  counterText: ""),
                              textInputAction: TextInputAction.next,
                              textAlignVertical: TextAlignVertical.center,
                              style: Theme.of(context).textTheme.displayLarge,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.name,
                            ),
                            hideOnEmpty: true,
                            hideOnLoading: true,
                            hideOnError: true,
                          ),
                        ),
                      ),
                    );
                  }),
              
                
                    
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
                            color: Theme.of(context).buttonColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0, 0),
                            child: TextFormField(
                              controller: controllerWeights,
                              autofocus: false,
                              obscureText: false,
                              maxLength: 6,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: const InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  counterText: ""),
                              style: Theme.of(context).textTheme.displayMedium,
                              textAlign: TextAlign.center,
                              textInputAction: TextInputAction.next,
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

              //        SETS AND REPS

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
                            color: Theme.of(context).buttonColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              //    SETS

                              Expanded(
                                child: Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: TextFormField(
                                    controller: controllerSets,
                                    autofocus: false,
                                    obscureText: false,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                    textAlign: TextAlign.center,
                                    maxLength: 4,
                                    textAlignVertical: TextAlignVertical.center,
                                    cursorColor: Theme.of(context).primaryColor,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        counterText: ""),
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
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
                                    textAlignVertical: TextAlignVertical.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
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

                    //    REPS

                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Container(
                          width: 100,
                          height: 60,
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
                                    controller: controllerReps,
                                    maxLength: 4,
                                    autofocus: false,
                                    obscureText: false,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
                                    textAlign: TextAlign.center,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        counterText: ""),
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
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
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none),
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Align(
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
                            )),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (controllerName.text == "") {
                          setState(() {
                            _error = "Type in a name";
                          });
                        } else {
                          createItem(
                            exercise: controllerName.text,
                            weight: controllerWeights.text,
                            unit: selectedItem,
                            reps: controllerReps.text,
                            sets: controllerSets.text,
                          );
                          UserData().update();
                          Navigator.pop(context);
                        }
                      },
                      label: const Text("Create"),
                      icon: const Icon(Icons.add),
                      style: TextButton.styleFrom(
                        elevation: 0,
                        minimumSize: const Size(
                          160,
                          60,
                        ),
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        textStyle: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(.0),
                child: Text(
                  _error,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(color: Theme.of(context).errorColor),
                ),
              ),
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
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10, top: 20),
              child: Text(
                "Select",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: templates.length,
                itemBuilder: (BuildContext context, int index) {
                  return (ListTile(
                    title: Text(
                      templates[index],
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    leading: const Icon(Icons.sports_gymnastics),
                    onTap: () {
                      setState(() {
                        exerciseButtonText = (templates[index]);
                        exerciseButtonColor = Colors.blue;
                        exerciseButtonTextColor = Colors.white;
                        _error = "";
                      });
                      Navigator.pop(context);
                    },
                  ));
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

String? selectedItem = "kg";
List items = ["kg", "lbs"];

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
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(25)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: DropdownButton<String>(
            iconEnabledColor: Theme.of(context).iconTheme.color,
            value: selectedItem,
            underline: const SizedBox(),
            borderRadius: BorderRadius.circular(25),
            onChanged: (item) => setState(() => selectedItem = item),
            dropdownColor: Theme.of(context).buttonColor,
            style: Theme.of(context).textTheme.displayMedium,
            elevation: 0,
            items: items
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
 */