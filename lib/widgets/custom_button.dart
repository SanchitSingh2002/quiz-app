import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required this.onTap, required this.answerText, super.key});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          backgroundColor: Color.fromARGB(255, 2, 39, 68),
          foregroundColor: Colors.white70,
          shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(3))
        ),
        child: Text(answerText,textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),
      ),
    );
  }
}