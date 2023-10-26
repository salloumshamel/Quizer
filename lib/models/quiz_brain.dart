import 'package:flutter/material.dart';
import 'package:quizer/models/quetsion.dart';

class QuizBrain {
  int _currentIndex = 0;
  int score = 0;

  List<Question> questions = [
    Question("The square root of 64 is 8.", true),
    Question("An obtuse angle is smaller than a right angle.", false),
    Question("Zero is an even number.", true),
    Question("The equation 2x + 5 = 12 has a solution of x = 3.", false),
    Question("Pi (π) is an irrational number.", true),
    Question("A prime number is divisible by only 1 and itself.", true),
    Question("The sum of angles in a triangle is always 180 degrees.", true),
    Question("0.5 is equivalent to 5/10.", true),
    Question(
        "The area of a circle is calculated using the formula A = πr².", true),
    Question("The number 1 is considered a prime number.", false),
    Question("Finish Press Any Key To Play Again", false),
  ];
  List<Icon> answers = [];

  bool lastQuestion() {
    return _currentIndex == questions.length - 1;
  }

  void nextQuestion() {
    if (lastQuestion()) {
      _currentIndex = 0;
      answers = [];
      score = 0;
      return;
    }
    _currentIndex += 1;
  }

  Question getQuestion() {
    return questions[_currentIndex];
  }

  void compareSolution(bool answer) {
    if (questions[_currentIndex].answer == answer) {
      score++;
      answers.add(const Icon(
        Icons.check,
        color: Colors.green,
        size: 30,
      ));
    } else {
      answers.add(const Icon(
        Icons.close,
        color: Colors.red,
        size: 30,
      ));
    }
  }
}
