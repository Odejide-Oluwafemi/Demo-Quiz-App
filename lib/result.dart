import "package:flutter/material.dart";

class Result extends StatelessWidget {
  final int resultScore;
  final int questionCount;
  final Function() resetCallback;

  const Result({
    super.key,
    required this.resultScore,
    required this.questionCount,
    required this.resetCallback,
  });

  double getPercent(int value, int maxValue) {
    return (value / maxValue) * 100;
  }

  String get resultPhrase {
    String resText = "End of Quiz!";

    int maxAttainableScore = 10 * questionCount;
    double percentageScore = getPercent(resultScore, maxAttainableScore);
    if (percentageScore >= 80.0) {
      resText = "Absolute Worst!";
    } else if (percentageScore >= 68.0) {
      resText = "E. Bad!";
    } else if (percentageScore >= 58.0) {
      resText = "D. Poor!";
    } else if (percentageScore >= 48.0) {
      resText = "C. Fair";
    } else if (percentageScore >= 40.0) {
      resText = "B. Good!";
    } else {
      resText = "A. Excellent";
    }

    return resText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            resultPhrase,
            style: const TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12.0),
          TextButton(
            onPressed: resetCallback,
            child: const Text("Restart Quiz!"),
          ),
        ],
      ),
    );
  }
}
