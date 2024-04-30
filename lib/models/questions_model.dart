class QuizQuestion {
  const QuizQuestion(this.questionText, this.answersList);

  final String questionText;
  final List<String> answersList;

  List<String> getShuffledAnswerList() {
    final shuffledAnswersList = List.of(answersList);

    shuffledAnswersList.shuffle();
    //shuffle can't return anything, it only shuffles

    return shuffledAnswersList;
  }
}
