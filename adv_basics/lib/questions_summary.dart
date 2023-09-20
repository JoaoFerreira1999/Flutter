import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: data['user_answer'] == data['correct_answer']
                          ? const Color.fromARGB(255, 207, 64, 207)
                          : const Color.fromARGB(255, 5, 33, 160)),
                  child: Text(
                    ((data['question_index'] as int) + 1).toString(),
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          data['user_answer'] as String,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 207, 64, 207),
                              fontSize: 15),
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 5, 33, 160),
                              fontSize: 15),
                        ),
                      ]),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
