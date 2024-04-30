import 'package:flutter/material.dart';

class SummarySection extends StatelessWidget {
  const SummarySection(this.displayData, {super.key});

  final List<Map<String, Object>> displayData;

  bool isCorrectAnswer(String userInput, String correctAnswer) {
    return userInput == correctAnswer ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: displayData.map((data) {
            return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 30,
                width: 30,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isCorrectAnswer(data['chosenAnswer'] as String,
                          data['correctAnswer'] as String)
                      ? const Color.fromARGB(255, 70, 149, 71)
                      : const Color.fromARGB(255, 227, 112, 128),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  ((data['question_index'] as int) + 1).toString(),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['question'].toString(),
                      style:
                          TextStyle(color: Color.fromARGB(255, 223, 186, 151)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('Your answer: ${data['chosenAnswer'] as String}',
                        style: TextStyle(
                            color: Color.fromARGB(255, 242, 239, 236))),
                    Text('Correct answer: ${data['correctAnswer'] as String}',
                        style: TextStyle(
                            color: Color.fromARGB(255, 242, 239, 236))),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ]);
          }).toList(),
        ),
      ),
    );
  }
}
