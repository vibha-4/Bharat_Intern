import 'package:flutter/material.dart';
import 'package:flutter_application_quiz_app/start.dart';
// import 'package:quiz_app/quiz.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: StartPage());
  }
}
