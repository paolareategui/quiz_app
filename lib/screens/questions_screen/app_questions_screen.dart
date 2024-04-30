import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/screens/questions_screen/app_answer_button.dart';
import 'package:quiz_app/models/state.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(Object context) {
    List<String> images = [
      'assets/images/type1.jpg',
      'assets/images/type2.jpg',
      'assets/images/type3.jpg',
      'assets/images/type4.jpg',
      'assets/images/type5.jpg',
      'assets/images/type6.jpg',
      'assets/images/type7.jpg',
      'assets/images/type8.jpg',
      'assets/images/type9.jpg',
      'assets/images/type10.jpg',
    ];

    var activeImage = 'assets/images/type1.jpg';

    Random random = Random();
    int randomIndex = 0;

    randomIndex = random.nextInt(images.length);
    setState(() {
      activeImage = images[randomIndex];
    });

    return Consumer<StateModel>(builder: (context, state, child) {
      var currentQuestion = state.getCurrentQuestion();

      return Center(
          child: Column(
        children: [
          SizedBox(
            width: 500,
            height: 300,
            child: Image.asset(activeImage, fit: BoxFit.fitWidth),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  currentQuestion.questionText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(255, 243, 243, 1),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 30),
                ...currentQuestion.getShuffledAnswerList().map((answer) {
                  return AnswerButton(
                      answerText: answer,
                      onAnswerSelect: () {
                        state.saveAnswer(answer);
                        state.advanceQuestion();
                      });
                }),
              ],
            ),
          ),
        ],
      ));
    });
  }
}
