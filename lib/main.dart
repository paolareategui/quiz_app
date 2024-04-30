import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/app_quiz.dart';
import 'package:quiz_app/models/state.dart';

void main() async {
  runApp(ChangeNotifierProvider(
      create: (context) => StateModel(), child: const Quiz()));
}
