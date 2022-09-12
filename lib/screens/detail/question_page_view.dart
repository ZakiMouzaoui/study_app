import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/controllers/question_paper/paper_detail_controller.dart';
import 'package:study_app/models/question.dart';
import 'package:study_app/widgets/answer_card_widget.dart';

import '../../widgets/content_area.dart';



class QuestionPageView extends StatelessWidget {
  QuestionPageView({Key? key, required this.questionModel, required this.questionIndex}) : super(key: key);

  final QuestionModel questionModel;
  final _paperDetailController = Get.find<PaperDetailController>();
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    return ContentArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          questionModel.question.question,
          style: const TextStyle(
              fontWeight: FontWeight.bold
          ),
          
        ),
        const SizedBox(height: 20,),
        Expanded(child: GetBuilder<PaperDetailController>(
          builder: (_) => ListView.builder(
              itemBuilder: (_, index) => AnswerCardWidget(
                  answerModel: questionModel.question.answers[index],
                  isSelected: questionModel.question.answers[index].identifier
                == _paperDetailController.questions[_paperDetailController.index].question.selectedAnswer,
              ),
              itemCount: questionModel.question.answers.length,
          ),
        )
        ),
        Row(
            children: [
              _paperDetailController.index > 0 ? GestureDetector(
                onTap: (){
                  _paperDetailController.decreaseIndex();
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Theme.of(context).primaryColor,
                      )
                  ),
                ),
              ) : Container(),
              Expanded(child: GestureDetector(
                onTap:
                  _paperDetailController.isLastQuestion()
                  ? (){
                  Get.toNamed('/overview');
                }:(){_paperDetailController.increaseIndex();},
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: Center(
                    child: Text(
                      _paperDetailController.isLastQuestion() ? "Complete" : "Next",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),
                    ),
                  ),
                ),
              ),)

            ],
          ),

      ],
    ));
  }
}
