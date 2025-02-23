import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/questions.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({required this.chosenAnswer, super.key});

  final void Function(String answer) chosenAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.chosenAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(color: Colors.white, fontSize: 25),
            ),
            SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return CustomButton(
                onTap: () {
                  answerQuestion(answer);
                },
                answerText: answer,
              );
            }),
          ],
        ),
      ),
    );
  }
}
