import "package:flutter/material.dart";

import "./question.dart";
import "./answer.dart";

class Quiz extends StatelessWidget {
  final Function(int) callback;
  final List<Map<String, Object>> questions;
  final int questionIndex;
  const Quiz({
    required this.callback,
    required this.questions,
    required this.questionIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Question(questions[questionIndex]["questionText"].toString()),
        ...(questions[questionIndex]["answers"] as List<Map<String, Object>>)
            .map((answer) {
          return Container(
              width: double.infinity,
              height: 38.0,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(120),
              ),
              margin:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              child: Answer(answer["text"].toString(),
                  () => callback(answer["score"] as int)));
        }).toList(),
      ],
    );
  }
}
