import 'package:quiz_app/models/questions_model.dart';

List<QuizQuestion> getQuestions() {
  return [
    const QuizQuestion(
      "Q1: What term describes the practice of arranging type to make written language legible, readable, and visually appealing?",
      ["Typography (Correct)", "Calligraphy", "Graphology"],
    ),
    const QuizQuestion(
      "Q2: Which famous printing press inventor is credited with the development of movable type in the 15th century?",
      ["Johannes Gutenberg (Correct)", "Leonardo da Vinci", "Isaac Newton"],
    ),
    const QuizQuestion(
      "Q3: What is the term for the horizontal line upon which characters in a line of type rest?",
      ["Baseline (Correct)", "Midline", "Cap line"],
    ),
    const QuizQuestion(
      "Q4: What are the two main classifications of typefaces?",
      [
        "Serif and Sans-serif (Correct)",
        "Script and Gothic",
        "Italic and Bold"
      ],
    ),
    const QuizQuestion(
      "Q5: Which type of font has small decorative strokes, or serifs, at the ends of characters?",
      ["Serif font (Correct)", "Sans-serif font", "Gothic font"],
    ),
    const QuizQuestion(
      "Q6: What is the name of the space between lines of text in typography?",
      ["Leading (Correct)", "Tracking", "Kerning"],
    ),
    const QuizQuestion(
      "Q7: Which term describes the adjustment of space between characters in a line of text?",
      ["Kerning (Correct)", "Tracking", "Leading"],
    ),
    const QuizQuestion(
      "Q8: What is the term for the adjustment of space between a group of letters or characters to fit them into a defined space?",
      ["Tracking (Correct)", "Kerning", "Justification"],
    ),
    const QuizQuestion(
      "Q9: What is the term for the width of a font's characters, measured from one end to the other?",
      ["Typeface width (Correct)", "Font size", "Typeface height"],
    ),
    const QuizQuestion(
      "Q10: Which typographic measurement system is based on the height of characters and is commonly used in printing and design?",
      ["Points (pt) (Correct)", "Pixels", "Inches"],
    ),
  ];
}
