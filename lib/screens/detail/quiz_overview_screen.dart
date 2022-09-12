import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/controllers/question_paper/paper_detail_controller.dart';
import 'package:study_app/widgets/answer_card_widget.dart';
import 'package:study_app/widgets/content_area.dart';
import 'package:study_app/widgets/quiz_number_card.dart';


class QuizOverviewScreen extends StatelessWidget {
  QuizOverviewScreen({Key? key}) : super(key: key);

  final _paperController = Get.find<PaperDetailController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.pink
          ),
          child: GetBuilder<PaperDetailController>(
            builder: (_) => Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                    children: [
                      Expanded(child: GestureDetector(
                          child: Icon(Icons.arrow_back_ios),
                          onTap: (){
                            Get.back();
                          },
                      )),
                      Expanded(child: Text("${_paperController.questionsAnswered()} out of ${_paperController.questions.length} answered",style: const TextStyle(
                        color: onSurfaceTextColor,
                        fontWeight: FontWeight.bold
                      ),)),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
                Expanded(
                  child: ContentArea(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.timer,color: Theme.of(context).primaryColor,),
                              const SizedBox(width: 10,),
                              Text(
                                _paperController.time,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Text(
                                  "Remaining",
                                  style: TextStyle(color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const SizedBox(height: 20,),
                          SizedBox(
                            height: 55,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: _paperController.questions.length,
                                itemBuilder: (_,index)=>
                                    QuizNumberCard(
                                      index: index+1,
                                      status:
                                      _paperController.questions[index].question.selectedAnswer != null
                                      ? AnswerStatus.answered : AnswerStatus.notAnswered,
                                      onTap: (){
                                        _paperController.changeIndex(index);
                                      },
                                )
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap:
                                (){
                              _paperController.complete();
                                },
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Center(
                                child: Text(
                                  "Complete",
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
