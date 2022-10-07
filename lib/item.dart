import 'package:flutter/material.dart';
import 'home_screen_body.dart';
import 'main.dart';

// ITEM REGULAR

class Item extends StatelessWidget {
  Item(this.name, this.weight, this.unit, this.reps, this.sets);

  final String name, weight, unit, reps, sets;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: InkWell(
        onTap: () => {
          editItemPopUp(name, weight, unit, reps, sets, context,
              focusMode1: true, focusMode2: false, focusMode3: false),
        },
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        child: Container(
          width: 340,
          height: 220,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    blurRadius: 20,
                    offset: const Offset(0, 3),
                    spreadRadius: -3)
              ],
              color: Theme.of(context).cardColor),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () => editItemPopUp(
                          name, weight, unit, reps, sets, context,
                          focusMode1: true, focusMode2: false, focusMode3: false),
                      child: Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(18)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.fitness_center_rounded,
                                  color: Colors.white,
                                ),
                                const Spacer(),
                                Text("$weight $unit",
                                    style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Colors.white)
                                ),
                                const Spacer()
                              ],
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: InkWell(
                        onTap: () => editItemPopUp(
                            name, weight, unit, reps, sets, context,
                            focusMode1: false, focusMode2: true, focusMode3: false),
                        onDoubleTap: () => editItemPopUp(
                            name, weight, unit, reps, sets, context,
                            focusMode1: false, focusMode2: false, focusMode3: true),
                        child: Container(
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(18)),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.refresh_rounded,
                                    size: 28,
                                    color: Colors.white,
                                  ),
                                  const Spacer(),
                                  Text(
                                    "${sets} x ${reps}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayLarge!
                                        .copyWith(color: Colors.white),
                                  ),
                                  const Spacer()
                                ],
                              ),
                            )),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      name,
                      style: Theme.of(context).textTheme.headlineMedium,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
