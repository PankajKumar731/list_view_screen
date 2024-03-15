import 'package:flutter/material.dart';

class listscreen extends StatefulWidget {
  const listscreen({super.key});

  @override
  State<listscreen> createState() => _listscreenState();
}

class _listscreenState extends State<listscreen> {
  var countController = TextEditingController();
  var countFocus = FocusNode();
  var color = -1;
  var inverseColor = false;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(110, 151, 151, 151),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        fixedSize: const MaterialStatePropertyAll(Size(90, 30)),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.yellow)),
                    onPressed: () {
                      setState(() {
                        color = 0;
                      });
                    },
                    child: const Text(
                      "YELLOW",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        fixedSize: const MaterialStatePropertyAll(Size(90, 30)),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.purple)),
                    onPressed: () {
                      setState(() {
                        color = 1;
                      });
                    },
                    child: const Text(
                      "PURPLE",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        fixedSize: const MaterialStatePropertyAll(Size(90, 30)),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.orange)),
                    onPressed: () {
                      setState(() {
                        color = 2;
                      });
                    },
                    child: const Text(
                      "ORANGE",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(7),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: countController,
                    decoration: const InputDecoration(
                        icon: Icon(
                          Icons.numbers,
                          size: 36,
                          color: Colors.black,
                        ),
                        labelText: "Count",
                        labelStyle: TextStyle(color: Colors.black),
                        counterText: "",
                        enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.5))),
                    maxLength: 2,
                    focusNode: countFocus,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2),
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      fixedSize: const MaterialStatePropertyAll(Size(90, 30)),
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.yellow)),
                  onPressed: () {
                    setState(() {
                      count = int.tryParse(countController.text) ?? 0;
                    });
                  },
                  child: const Text(
                    "Done",
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          inverseColor = !inverseColor;
                        });
                      },
                      style: ButtonStyle(
                          shape:
                              MaterialStatePropertyAll<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                          fixedSize:
                              const MaterialStatePropertyAll(Size(90, 30)),
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.grey)),
                      child: Icon(
                        inverseColor
                            ? Icons.check_circle_outline_outlined
                            : Icons.cancel_outlined,
                        color: Colors.black,
                        size: 36,
                      )),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: count,
                itemBuilder: (((context, index) {
                  return Container(
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: inverseColor == true
                            ? index % 2 == 0
                                ? Color.fromARGB(255, 159, 64, 150)
                                : color == -1
                                    ? Colors.white
                                    : color == 0
                                        ? Colors.yellow
                                        : color == 1
                                            ? Colors.purple
                                            : Colors.orange
                            : color == -1
                                ? Colors.white
                                : color == 0
                                    ? Colors.yellow
                                    : color == 1
                                        ? Colors.purple
                                        : Colors.orange),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.circle,
                          size: 36,
                        ),
                      ],
                    ),
                  );
                }))),
          ),
        ],
      ),
    );
  }
}
