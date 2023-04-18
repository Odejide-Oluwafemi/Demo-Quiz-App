import "package:flutter/material.dart";

class Answer extends StatelessWidget {
  final String _answerText;
  final Function() callback;

  const Answer(this._answerText, this.callback, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      child: Text(_answerText),
    );
  }
}
