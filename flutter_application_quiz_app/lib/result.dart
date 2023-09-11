import 'package:flutter/material.dart';
import 'package:flutter_application_quiz_app/quiz.dart';

class ResultPage extends StatefulWidget {
  final int correctAnswerCount;
  const ResultPage({super.key, required this.correctAnswerCount});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.celebration,
            size: 100,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Your score is ',
                      style: TextStyle(fontSize: 35),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.amber),
                      child: Text(
                        widget.correctAnswerCount.toString(),
                        style:
                            const TextStyle(fontSize: 29, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(14),
                      backgroundColor: Colors.black87),
                  onPressed: () {
                    {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QuizPage()),
                      );
                    }
                  },
                  child: const Text(
                    'Take quiz again',
                    style: TextStyle(fontSize: 20),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
