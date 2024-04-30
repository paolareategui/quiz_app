import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/models/state.dart';
import 'package:quiz_app/screens/home_screen/user_information.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(context) {
    return Consumer<StateModel>(
      builder: (context, state, child) {
        return Center(
          child: Column(
            children: [
              Image.asset("assets/images/typography-main.jpg",
                  fit: BoxFit.fitHeight),
              const UserInfo(),
              const SizedBox(height: 30),
              OutlinedButton.icon(
                onPressed: state.startQuiz,
                icon: const Icon(Icons.arrow_circle_right),
                label: const Text("Start the quiz"),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                      width: 1.0, color: Color.fromARGB(255, 248, 167, 97)),
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
