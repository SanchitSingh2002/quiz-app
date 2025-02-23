import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StarterScreen extends StatelessWidget {
  StarterScreen(this.currentScreen, {super.key});

  void Function() currentScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/quiz-logo.png", color: Colors.white38, width: 300,),
          SizedBox(height: 30),
          Text(
            "Learn Flutter",
            style: GoogleFonts.lato(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: currentScreen,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.purple,
            ),
            icon: Icon(Icons.arrow_forward, size: 25, color: Colors.white),
            label: Text("Start Quiz", style: GoogleFonts.lato(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
