import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:quiz_app/models/questions_model.dart';
import 'package:quiz_app/data/questions.dart' as data;

class StateModel extends ChangeNotifier {
  final List<QuizQuestion> _questions = data.getQuestions();
  List<String> _answers = List.filled(data.getQuestions().length, '');

  int currentQuestion = 0;
  var answerNumber = 0;
  String _status = "start";

  StateModel() {
    resetQuiz();
  }

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<QuizQuestion> get questions =>
      UnmodifiableListView(_questions);

  UnmodifiableListView<String> get answers => UnmodifiableListView(_answers);

  // QuizQuestion getCurrentQuestion() {
  //   if (currentQuestion < _questions.length) {
  //     return _questions[currentQuestion];
  //   } else {
  //     // return a null question since we don't have any
  //     return const QuizQuestion('', []);
  //   }
  // }

  QuizQuestion getCurrentQuestion() => _questions[currentQuestion];

  String get quizStatus => _status;

  void saveAnswer(String answer) {
    _answers[currentQuestion] = answer;
    print(_answers.length);
    notifyListeners();
  }

  void advanceQuestion() {
    if (++currentQuestion >= _questions.length) {
      _status = "complete";
      notifyListeners();
    }
  }

  void resetQuiz() {
    currentQuestion = 0;
    _status = "start";
    resetAnswers();
    notifyListeners();
  }

  void startQuiz() {
    _status = "in-progress";
    notifyListeners();
  }

  void resetAnswers() {
    _answers = List.filled(data.getQuestions().length, '');
  }

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summaryData = [];

    for (var i = 0; i < _answers.length; i++) {
      summaryData.add({
        'question_index': i,
        'question': _questions[i].questionText,
        'correctAnswer': _questions[i].answersList[0],
        'chosenAnswer': _answers[i],
      });
    }
    print(summaryData);
    return summaryData;
  }
}
