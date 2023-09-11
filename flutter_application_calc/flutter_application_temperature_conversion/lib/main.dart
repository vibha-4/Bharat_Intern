import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Temp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

TextEditingController input = TextEditingController();

String output = "";

class Temp extends StatefulWidget {
  const Temp({super.key});

  @override
  State<Temp> createState() => _TempState();
}

class _TempState extends State<Temp> {
  String dropdownValue = 'Farenheit';
  String dropdownValue2 = 'Farenheit';

  double convert(String a, String b) {
    if (a == "Kelvin" && b == "Celcius") {
      return (int.parse(input.text) - 273);
    } else if (a == "Kelvin" && b == "Farenheit") {
      return ((int.parse(input.text) - 273) * 1.8 + 32);
    } else if (a == "Kelvin" && b == "Kelvin") {
      return int.parse(input.text).toDouble();
    } else if (a == "Farenheit" && b == "Farenheit") {
      return int.parse(input.text).toDouble();
    } else if (a == "Farenheit" && b == "Celcius") {
      return (int.parse(input.text) - 32) * 0.55555555555;
    } else if (a == "Farenheit" && b == "Kelvin") {
      return (int.parse(input.text) - 32) * 0.55555555555 + 273;
    } else if (a == "Celcius" && b == "Celcius") {
      return int.parse(input.text).toDouble();
    } else if (a == "Celcius" && b == "Farenheit") {
      return int.parse(input.text) * 1.8 + 32;
    } else if (a == "Celcius" && b == "Kelvin") {
      return int.parse(input.text) + 273;
    }

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromARGB(255, 255, 160, 182)),
              child: TextField(
                style: TextStyle(fontSize: 40),
                decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none),
                textAlign: TextAlign.center,
                controller: input,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: dropdownValue,

                  items: <String>['Farenheit', 'Celcius', 'Kelvin']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 25),
                      ),
                    );
                  }).toList(),
                  // Step 5.
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    String tem = "";
                    setState(() {
                      tem = dropdownValue;
                      dropdownValue = dropdownValue2;
                      dropdownValue2 = tem;
                    });
                  },
                  child: Icon(
                    Icons.swap_horiz_sharp,
                    size: 30,
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(), fixedSize: Size(60, 60)),
                ),
                DropdownButton<String>(
                  value: dropdownValue2,

                  items: <String>['Farenheit', 'Celcius', 'Kelvin']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 25),
                      ),
                    );
                  }).toList(),
                  // Step 5.
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue2 = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width - 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color.fromARGB(255, 138, 125, 255)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          output,
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          dropdownValue2 == "Farenheit"
                              ? " F"
                              : dropdownValue2 == "Celcius"
                                  ? " C"
                                  : " K",
                          style: TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                output = convert(dropdownValue, dropdownValue2).toString();
              });
            },
            child: Text(
              "Convert",
              style: TextStyle(fontSize: 20),
            ),
            style: ElevatedButton.styleFrom(
                shape: StadiumBorder(), fixedSize: Size(150, 50)),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text(
          "Temperature Convertor",
          style: TextStyle(
              fontFamily: "times new roman",
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
    );
  }
}
