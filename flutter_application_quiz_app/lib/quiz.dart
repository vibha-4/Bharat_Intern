import 'package:flutter/material.dart';
import 'package:flutter_application_quiz_app/result.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

Map questions = {
  "q1": "What is 2*4",
  "q2": "What is 3+5",
  "q3": "What is 4-6",
  "q4": "What is 20+5",
  "q5": "What is 7+4",
  "q6": "What is 7*9",
  "q7": "what is 11*11",
  "q8": "What is 0*11",
  "q9": "What is 12*12",
  "q10": "What is 5*1"
};

Map options = {
  "q1": {"a": "1", "b": "2", "c": "3", "d": "8"},
  "q2": {"a": "1", "b": "2", "c": "3", "d": "8"},
  "q3": {"a": "1", "b": "2", "c": "3", "d": "-2"},
  "q4": {"a": "5", "b": "4", "c": "7", "d": "25"},
  "q5": {"a": "1", "b": "2", "c": "3", "d": "11"},
  "q6": {"a": "1", "b": "2", "c": "3", "d": "63"},
  "q7": {"a": "1", "b": "2", "c": "3", "d": "121"},
  "q8": {"a": "1", "b": "2", "c": "3", "d": "0"},
  "q9": {"a": "1", "b": "2", "c": "3", "d": "144"},
  "q10": {"a": "1", "b": "2", "c": "3", "d": "5"}
};

Map answers = {
  "q1": "d",
  "q2": "d",
  "q3": "d",
  "q4": "d",
  "q5": "d",
  "q6": "d",
  "q7": "d",
  "q8": "d",
  "q9": "d",
  "q10": "d"
};

Map selectedAnswers = {
  "q1": "",
  "q2": "",
  "q3": "",
  "q4": "",
  "q5": "",
  "q6": "",
  "q7": "",
  "q8": "",
  "q9": "",
  "q10": ""
};

class _QuizPageState extends State<QuizPage> {
  bool lastQuestion = false;

  int questionCount = 1;

  bool notAnswered = false;

  int correctAnswerCount = 0;

  void reInitalize() {
    // correctAnswerCount = 0;

    questionCount = 1;

    selectedAnswers = {
      "q1": "",
      "q2": "",
      "q3": "",
      "q4": "",
      "q5": "",
      "q6": "",
      "q7": "",
      "q8": "",
      "q9": "",
      "q10": ""
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Colors.black,
        title: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calculate,
              size: 30,
            ),
            Text("  MATH QUIZ"),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "$questionCount. ${questions["q$questionCount"]}",
                style: const TextStyle(fontSize: 30),
              ),
            ),
          ]),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              minLeadingWidth: 20,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade600, width: 1),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.elliptical(16, 16),
                      topRight: Radius.elliptical(16, 16),
                      bottomRight: Radius.elliptical(16, 16),
                      bottomLeft: Radius.elliptical(16, 16))),
              tileColor: selectedAnswers["q$questionCount"] == "a"
                  ? Colors.amber
                  : Colors.grey.shade200,
              onTap: () {
                setState(() {
                  notAnswered = false;
                  selectedAnswers["q$questionCount"] = "a";
                });
              },
              leading: Container(
                  width: 25,
                  height: 25,
                  // alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black87),
                  child: const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Center(
                      child: Text(
                        "A",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )),
              title: Text(options["q$questionCount"]["a"]),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              minLeadingWidth: 20,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade600, width: 1),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.elliptical(16, 16),
                      topRight: Radius.elliptical(16, 16),
                      bottomRight: Radius.elliptical(16, 16),
                      bottomLeft: Radius.elliptical(16, 16))),
              tileColor: selectedAnswers["q$questionCount"] == "b"
                  ? Colors.amber
                  : Colors.grey.shade200,
              onTap: () {
                setState(() {
                  notAnswered = false;

                  selectedAnswers["q$questionCount"] = "b";
                });
              },
              leading: Container(
                  width: 25,
                  height: 25,
                  // alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black87),
                  child: const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Center(
                      child: Text(
                        "B",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )),
              title: Text(options["q$questionCount"]["b"]),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              minLeadingWidth: 20,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade600, width: 1),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.elliptical(16, 16),
                      topRight: Radius.elliptical(16, 16),
                      bottomRight: Radius.elliptical(16, 16),
                      bottomLeft: Radius.elliptical(16, 16))),
              tileColor: selectedAnswers["q$questionCount"] == "c"
                  ? Colors.amber
                  : Colors.grey.shade200,
              onTap: () {
                setState(() {
                  notAnswered = false;

                  selectedAnswers["q$questionCount"] = "c";
                });
              },
              leading: Container(
                  width: 25,
                  height: 25,
                  // alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black87),
                  child: const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Center(
                      child: Text(
                        "C",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )),
              title: Text(options["q$questionCount"]["c"]),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              minLeadingWidth: 20,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade600, width: 1),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.elliptical(16, 16),
                      topRight: Radius.elliptical(16, 16),
                      bottomRight: Radius.elliptical(16, 16),
                      bottomLeft: Radius.elliptical(16, 16))),
              tileColor: selectedAnswers["q$questionCount"] == "d"
                  ? Colors.amber
                  : Colors.grey.shade200,
              onTap: () {
                setState(() {
                  notAnswered = false;
                  selectedAnswers["q$questionCount"] = "d";
                });
              },
              leading: Container(
                  width: 25,
                  height: 25,
                  // alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black87),
                  child: const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Center(
                      child: Text(
                        "D",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )),
              title: Text(options["q$questionCount"]["d"]),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: notAnswered
                ? const Text(
                    'Choose an option first!',
                    style: TextStyle(color: Colors.red),
                  )
                : const Text(''),
          ),

          //
          const Expanded(child: SizedBox()),

          //
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87),
                    onPressed: () {
                      if (questionCount >= 2) {
                        setState(() {
                          lastQuestion = false;

                          questionCount--;
                          correctAnswerCount--;
                        });
                        debugPrint(correctAnswerCount.toString());
                      } else {}
                    },
                    child: const Text('Prev question')),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87),
                    onPressed: () {
                      if (questionCount <= 9 &&
                          selectedAnswers["q$questionCount"] != "") {
                        setState(() {
                          notAnswered = false;
                          if (selectedAnswers["q$questionCount"] ==
                              answers["q$questionCount"]) {
                            correctAnswerCount++;
                          }
                          if (questionCount == 9) {
                            setState(() {
                              lastQuestion = true;
                            });
                          }
                          questionCount++;
                        });
                        debugPrint(correctAnswerCount.toString());
                      } else if (questionCount > 9) {
                        setState(() {
                          notAnswered = false;
                        });
                        if (selectedAnswers["q$questionCount"] ==
                            answers["q$questionCount"]) {
                          correctAnswerCount++;
                        }
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultPage(
                                  correctAnswerCount: correctAnswerCount)),
                        );

                        reInitalize();
                      } else {
                        setState(() {
                          notAnswered = true;
                        });
                      }
                    },
                    child: Text(lastQuestion ? 'Submit' : 'Next question')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
