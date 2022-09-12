import 'package:flutter/material.dart';
import 'package:study_app/configs/themes/text_styles.dart';
import 'package:study_app/models/question_paper_model.dart';


class NotAnswerCard extends StatelessWidget {
  const NotAnswerCard({Key? key, required this.answer}) : super(key: key);

  final Answer answer;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(right: 5, bottom: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: Row(
              children: [
                Text(answer.identifier,
                    style: answerCardStyle),
                const SizedBox(
                  width: 5,
                ),
                Text(answer.answer,
                    style: answerCardStyle),
              ],
            )));
  }
}
