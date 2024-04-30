import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/screens/results_screen/app_summary_section.dart';
import 'package:quiz_app/data/questions.dart' as data;
import 'package:quiz_app/models/state.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StateModel>(builder: (context, state, child) {
      var questions = data.getQuestions();
      final summaryData = state.getSummaryData();
      final numOfQuestions = questions.length;
      final numOfCorrectAnswers = summaryData
          .where((data) => data['correctAnswer'] == data['chosenAnswer'])
          .length;

      return Center(
        child: Container(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: 500,
              height: 300,
              child:
                  Image.asset('assets/images/type8.jpg', fit: BoxFit.fitWidth),
            ),
            Text(
              'You have answered $numOfCorrectAnswers out of $numOfQuestions  questions correctly!',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 206, 136, 44),
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            SummarySection(summaryData),
            const SizedBox(height: 30),
            TextButton(
              onPressed: state.resetQuiz,
              child: const Text(
                "Restart the quiz",
                style: TextStyle(color: Color.fromARGB(255, 206, 136, 44)),
              ),
            ),
          ]),
        ),
      );
    });
  }
}
