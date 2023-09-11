import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String input = "";
  String eqn = "";
  String ans = "";
  bool focus = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator",
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontFamily: "Times new roman")),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TweenAnimationBuilder(
                    tween: Tween<double?>(
                      begin: 20,
                      end: !focus ? 40 : 20,
                    ),
                    duration: const Duration(milliseconds: 200),
                    builder: (context, value, child) {
                      return Text(
                        input,
                        style: TextStyle(
                            color: !focus ? Colors.black : Colors.grey,
                            fontSize: value),
                      );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TweenAnimationBuilder(
                    tween: Tween<double?>(
                      begin: 20,
                      end: focus ? 40 : 20,
                    ),
                    duration: const Duration(milliseconds: 200),
                    builder: (context, value, child) {
                      return Text(
                        ans.toString(),
                        style: TextStyle(
                            color: focus ? Colors.black : Colors.grey,
                            fontSize: value),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(), fixedSize: Size(80, 60)),
                  onPressed: () {
                    setState(() {
                      focus = false;

                      ans = "";
                      input = "";
                      eqn = "";
                    });
                  },
                  child: Text(
                    "C",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(), fixedSize: Size(80, 60)),
                    onPressed: () {
                      setState(() {
                        if (focus == true) {
                          input = ans;
                          eqn = ans;
                        }

                        focus = false;
                        input = '$input/100';
                        eqn = '$eqn/100';
                      });
                    },
                    child: Text(
                      "%",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(), fixedSize: Size(80, 60)),
                    onPressed: () {
                      setState(() {
                        focus = false;
                        if (input.length > 0) {
                          input = input.substring(0, input.length - 1);
                        }
                        if (eqn.length > 0) {
                          eqn = eqn.substring(0, eqn.length - 1);
                        }
                      });
                    },
                    child: Icon(
                      Icons.backspace_outlined,
                      color: Colors.black,
                      size: 25,
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(), fixedSize: Size(80, 60)),
                    onPressed: () {
                      setState(() {
                        if (focus == true) {
                          input = ans;
                          ans = "";
                        }
                        focus = false;
                        input = input + "÷";
                        eqn = eqn + "/";
                      });
                    },
                    child: Text(
                      "÷",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(), fixedSize: Size(80, 60)),
                    onPressed: () {
                      setState(() {
                        focus = false;
                        input = input + "7";
                        eqn = eqn + "7";
                      });
                    },
                    child: Text(
                      "7",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(), fixedSize: Size(80, 60)),
                    onPressed: () {
                      setState(() {
                        focus = false;
                        input = input + "8";
                        eqn = eqn + "8";
                      });
                    },
                    child: Text(
                      "8",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(), fixedSize: Size(80, 60)),
                    onPressed: () {
                      setState(() {
                        focus = false;
                        input = input + "9";
                        eqn = eqn + "9";
                      });
                    },
                    child: Text(
                      "9",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(), fixedSize: Size(80, 60)),
                    onPressed: () {
                      setState(() {
                        if (focus == true) {
                          input = ans;
                          ans = "";
                        }
                        focus = false;
                        input = input + "×";
                        eqn = eqn + "*";
                      });
                    },
                    child: Text(
                      "×",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(), fixedSize: Size(80, 60)),
                    onPressed: () {
                      setState(() {
                        focus = false;
                        input = input + "4";
                        eqn = eqn + "4";
                      });
                    },
                    child: Text(
                      "4",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(), fixedSize: Size(80, 60)),
                    onPressed: () {
                      setState(() {
                        focus = false;
                        input = input + "5";
                        eqn = eqn + "5";
                      });
                    },
                    child: Text(
                      "5",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(), fixedSize: Size(80, 60)),
                    onPressed: () {
                      setState(() {
                        focus = false;
                        input = input + "6";
                        eqn = eqn + "6";
                      });
                    },
                    child: Text(
                      "6",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(), fixedSize: Size(80, 60)),
                    onPressed: () {
                      setState(() {
                        if (focus == true) {
                          input = ans;
                          ans = "";
                        }
                        focus = false;
                        input = input + "-";
                        eqn = eqn + "-";
                      });
                    },
                    child: Text(
                      "-",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(), fixedSize: Size(80, 60)),
                    onPressed: () {
                      setState(() {
                        focus = false;
                        input = input + "1";
                        eqn = eqn + "1";
                      });
                    },
                    child: Text(
                      "1",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(), fixedSize: Size(80, 60)),
                    onPressed: () {
                      setState(() {
                        focus = false;
                        input = input + "2";
                        eqn = eqn + "2";
                      });
                    },
                    child: Text(
                      "2",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(), fixedSize: Size(80, 60)),
                    onPressed: () {
                      setState(() {
                        focus = false;
                        input = input + "3";
                        eqn = eqn + "3";
                      });
                    },
                    child: Text(
                      "3",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(), fixedSize: Size(80, 60)),
                    onPressed: () {
                      setState(() {
                        if (focus == true) {
                          input = ans;
                          ans = "";
                        }
                        focus = false;
                        input = input + "+";
                        eqn = eqn + "+";
                      });
                    },
                    child: Text(
                      "+",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(), fixedSize: Size(80, 60)),
                    onPressed: () {
                      setState(() {
                        focus = false;
                        input = input + "00";
                        eqn = eqn + "00";
                      });
                    },
                    child: Text(
                      "00",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(), fixedSize: Size(80, 60)),
                    onPressed: () {
                      setState(() {
                        focus = false;
                        input = input + "0";
                        eqn = eqn + "0";
                      });
                    },
                    child: Text(
                      "0",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(), fixedSize: Size(80, 60)),
                    onPressed: () {
                      setState(() {
                        focus = false;
                        input = input + ".";
                        eqn = eqn + ".";
                      });
                    },
                    child: Text(
                      ".",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: Colors.pink[300],
                        fixedSize: Size(80, 60)),
                    onPressed: () {
                      setState(() {
                        focus = true;
                        ans = (eqn.interpret()).toString();
                      });
                    },
                    child: Text(
                      "=",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
