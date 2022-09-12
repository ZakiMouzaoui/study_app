import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/controllers/question_paper/paper_detail_controller.dart';
import 'package:study_app/models/question_paper_model.dart';

import '../configs/themes/text_styles.dart';

enum AnswerStatus{
  answered, notAnswered, correct, wrong
}

class AnswerCardWidget extends StatelessWidget {
  AnswerCardWidget({Key? key, required this.answerModel, required this.isSelected}) : super(key: key);

  final Answer answerModel;
  final bool isSelected;

  final _paperDetailController = Get.find<PaperDetailController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _paperDetailController.selectAnswer(answerModel.identifier);
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(right: 5, bottom: 10),
        decoration: BoxDecoration(
            color: isSelected ? Theme.of(context).primaryColor : Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: Row(
              children: [
                Text(
                    answerModel.identifier,style: answerCardStyle?.copyWith(
                  color: isSelected ? onSurfaceTextColor : null
                )
                ),
                const SizedBox(width: 5,),
                Text(answerModel.answer,style: answerCardStyle?.copyWith(
                  color: isSelected ? onSurfaceTextColor : null
                )),
              ],
            )
        ),
      ),
    );
  }
}
