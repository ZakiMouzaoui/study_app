import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:study_app/controllers/question_paper/paper_detail_controller.dart';
import 'package:study_app/widgets/answer_card_widget.dart';
import 'package:study_app/widgets/content_area.dart';
import 'package:study_app/widgets/quiz_number_card.dart';


class ResultScreen extends StatelessWidget {
  ResultScreen({Key? key}) : super(key: key);

  final _paperController = Get.find<PaperDetailController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.pink
          ),
          child: Column(

              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${_paperController.questionsAnswered()} out of ${_paperController.questions.length} answered",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      )

                    ],
                  ),
                ),
                Expanded(
                    child: ContentArea(
                      child: Column(
                        children: [
                          SvgPicture.asset('assets/images/bulb.svg'),
                          const SizedBox(height: 20,),
                          Text("Congratulations",style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),),
                          const SizedBox(height: 10,),
                          Text("You have got 71.735 points",style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500
                          ),),
                          SizedBox(height: 30,),
                          Text(
                              "Tap below question numbers to view answers",
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontWeight: FontWeight.bold
                              ),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            height: 55,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: _paperController.questions.length,
                                itemBuilder: (_,index){
                                  final question = _paperController.questions[index].question;
                                  return QuizNumberCard(

                                      status: question.selectedAnswer != null
                                          ? question.selectedAnswer == question.correctAnswer
                                      ? AnswerStatus.correct : AnswerStatus.wrong : AnswerStatus.notAnswered,
                                      index: index+1,
                                      onTap: (){
                                        _paperController.changeIndex(index, isGoBack: false);
                                        Get.toNamed("/checkAnswer");
                                      }
                                  );
                                }

                            ),
                          ),
                        ],
                      ),
                    )
                )

              ],
            ),
          ),
        ),

    );
  }
}
