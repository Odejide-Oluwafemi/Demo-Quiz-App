import "package:flutter/material.dart";

import "./quiz.dart";
import "./result.dart";

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Quiz App",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _questions = const [
    {
      "questionText": "What's your favorite Fruit?",
      "answers": [
        {"text": "PineApple", "score": 7},
        {"text": "Apple", "score": 4},
        {"text": "Orange", "score": 2},
        {"text": "SpikeBerry", "score": 10},
      ]
    },
    {
      "questionText": "What's your favorite Color?",
      "answers": [
        {"text": "Red", "score": 8},
        {"text": "Black", "score": 10},
        {"text": "White", "score": 1},
        {"text": "Yellow", "score": 3},
      ]
    },
    {
      "questionText": "Which of these Animals do you take interest in?",
      "answers": [
        {"text": "Lion", "score": 7},
        {"text": "Crocodile", "score": 9},
        {"text": "Cat", "score": 4},
        {"text": "Goldfish", "score": 2},
        {"text": "Shark", "score": 10},
        {"text": "Lizard", "score": 5},
      ]
    },
  ];

  var _currentQuestion = 0;
  var _totalScore = 0;

  void answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _currentQuestion += 1;
    });
  }

  void resetQuiz() {
    setState(() {
      _currentQuestion = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Personality Test App"),
        elevation: 0.0,
      ),
      body: _currentQuestion < _questions.length
          ? Quiz(
              callback: answerQuestion,
              questions: _questions,
              questionIndex: _currentQuestion,
            )
          : Result(
              resultScore: _totalScore,
              questionCount: _questions.length,
              resetCallback: resetQuiz,
            ),
    );
  }
}
