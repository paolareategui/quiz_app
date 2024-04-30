import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.answerText, required this.onAnswerSelect});

  final String answerText;

  final void Function() onAnswerSelect; //must initialise the function first

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onAnswerSelect,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Text(answerText),
    );
  }
}
