import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/controllers/question_paper/paper_detail_controller.dart';
import 'package:study_app/widgets/content_area.dart';
import 'package:study_app/widgets/correct_answer_card.dart';
import 'package:study_app/widgets/not_answered_card.dart';
import 'package:study_app/widgets/wrong_answer_card.dart';

class AnswerCheckScreen extends StatelessWidget {
  AnswerCheckScreen({Key? key}) : super(key: key);

  final _paperDetailController = Get.find<PaperDetailController>();

  @override
  Widget build(BuildContext context) {
    final questionModel =
        _paperDetailController.questions[_paperDetailController.index].question;
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<PaperDetailController>(
          builder: (_) => Container(
              decoration: const BoxDecoration(color: Colors.pink),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: const Icon(Icons.arrow_back_ios),
                          onTap: () {
                            Get.back();
                          },
                        ),
                        Text(
                          "Q 0${_paperDetailController.index + 1}",
                          style: const TextStyle(
                              color: onSurfaceTextColor,
                              fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          child: const Icon(Icons.grid_view_outlined),
                          onTap: () {
                            Get.toNamed("/overview");
                          },
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ContentArea(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Text(
                            questionModel.question,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                              child: GetBuilder<PaperDetailController>(
                            builder: (_) => ListView.builder(
                              itemBuilder: (_, index) {
                                final answer = questionModel.answers[index].identifier;
                                final selectedAnswer = questionModel.selectedAnswer;
                                final correctAnswer = questionModel.correctAnswer;

                                if(answer == correctAnswer && selectedAnswer == answer){
                                  return CorrectAnswerCard(
                                      answer: questionModel.answers[index]);
                                }
                                else if(answer != selectedAnswer && answer == correctAnswer){
                                  return CorrectAnswerCard(
                                      answer: questionModel.answers[index]);
                                  }
                                  else if(answer == selectedAnswer && selectedAnswer != correctAnswer){
                                    return WrongAnswerCard(answer: questionModel.answers[index]);
                                }

                                return NotAnswerCard(answer: questionModel.answers[index]);
                              },
                              itemCount: questionModel.answers.length,
                            ),
                          ))
                        ])),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
