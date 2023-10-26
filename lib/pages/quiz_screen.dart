// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:quizer/models/quiz_brain.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});
  @override
  State<QuizScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<QuizScreen> {
  final QuizBrain _quizBrain = QuizBrain();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Center(
            child: const Text(
              'Math Quiz Application',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        backgroundColor: Colors.black87,
        body: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 350,
                    child: Center(
                      child: Text(
                        _quizBrain.lastQuestion()
                            ? 'Your Quiz Is Finished And Your Score Is ${_quizBrain.score}/${_quizBrain.questions.length}'
                            : _quizBrain.getQuestion().title!,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  _quizBrain.lastQuestion()
                      ? InkWell(
                          onTap: () {
                            setState(() {
                              _quizBrain.compareSolution(true);
                              _quizBrain.nextQuestion();
                            });
                          },
                          child: Container(
                            width: 100,
                            height: 50,
                            color: Colors.green,
                            child: Center(
                              child: Text(
                                'Reload',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _quizBrain.compareSolution(true);
                                  _quizBrain.nextQuestion();
                                });
                              },
                              child: Container(
                                width: 100,
                                height: 50,
                                color: Colors.green,
                                child: Center(
                                  child: Text(
                                    'true',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _quizBrain.compareSolution(false);
                                  _quizBrain.nextQuestion();
                                });
                              },
                              child: Container(
                                width: 100,
                                height: 50,
                                color: Colors.red,
                                child: Center(
                                  child: Text(
                                    'false',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                ],
              ),
              Center(
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: _quizBrain.answers.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Expanded(
                        child: _quizBrain.answers[index],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
