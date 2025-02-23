import 'package:flutter/material.dart';
import 'package:quiz_app/screens/question_screen.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';

import '../data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {

  List<String> selectedAnswers = [];

  var activeScreen = "start-screen";

  void switchScreen() {
    setState(() {
      activeScreen = "question-screen";
    });
  }

  void chosenAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = "result-screen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = "question-screen";
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StarterScreen(switchScreen);

    if(activeScreen == "question-screen"){
      screenWidget = QuestionScreen(chosenAnswer: chosenAnswer);
    }

    if(activeScreen == "result-screen"){
      screenWidget = ResultScreen(selectedAnswers, restartQuiz: restartQuiz,);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Color.fromARGB(
                  255, 255, 255, 255)],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: screenWidget
        ),
        ),
      );
  }
}
