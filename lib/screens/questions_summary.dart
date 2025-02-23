import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/circle.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  QuestionsSummary(this.summaryData, {super.key});

  List<Map<String, Object>> summaryData = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data){
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              CircleWidget(((data['question_index'] as int) + 1), data['user_answer'] == data['correct_answer'] ? Colors.greenAccent : Colors.pinkAccent),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data['question'] as String, style: GoogleFonts.lato(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    Text(data['user_answer'].toString(), textAlign: TextAlign.start, style: GoogleFonts.lato(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(data['correct_answer'].toString(), textAlign: TextAlign.start, style: GoogleFonts.lato(color: Color.fromARGB(255, 2, 39, 68), fontSize: 16, fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,)
                  ],
                ),
              )
            ],);
          }).toList()
        ),
      ),
    );
  }
}
