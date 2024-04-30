import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/models/state.dart';
import 'package:quiz_app/screens/home_screen/app_home_screen.dart';
import 'package:quiz_app/screens/questions_screen/app_questions_screen.dart';
import 'package:quiz_app/screens/results_screen/app_results_screen.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 5, 65, 55),
          outline: const Color(0xff798C89),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 60, 98, 86),
      ),
      home: Consumer<StateModel>(builder: (context, state, child) {
        return Scaffold(
          body: Container(
              child: switch (state.quizStatus) {
            "in-progress" => const QuestionsScreen(),
            "complete" => const ResultsScreen(),
            _ => const HomeScreen(),
          }),
        );
      }),
    ));
  }
}
