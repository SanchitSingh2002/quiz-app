import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget(this.questionNumber, this.circleColor, {super.key});

  final int questionNumber;
  final Color circleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      width: 40, // Adjust size as needed
      height: 40,
      decoration: BoxDecoration(
        color: circleColor, // Red background
        shape: BoxShape.circle, // Makes it a circle
      ),
      alignment: Alignment.center, // Centers text inside the circle
      child: Text(
        '$questionNumber',
        style: TextStyle(
          color: Colors.white, // Ensures text is visible
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

  }
}
