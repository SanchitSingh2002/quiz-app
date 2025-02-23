import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/screens/questions_summary.dart';
import 'package:quiz_app/widgets/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(this.chosenAnswers, {super.key, required this.restartQuiz});

  final List<String> chosenAnswers;
  final VoidCallback restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numOfTotalQuestions = questions.length;
    final numOfCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    });

    return Center(
      child: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You've Answered ${numOfCorrectQuestions.length} out of $numOfTotalQuestions questions correctly",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              QuestionsSummary(summaryData),
              SizedBox(height: 30),
              CustomButton(onTap: restartQuiz, answerText: "Restart Quiz")
            ],
          ),
        ),
      ),
    );
  }
}
