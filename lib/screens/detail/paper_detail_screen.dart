import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/controllers/question_paper/paper_detail_controller.dart';
import 'package:study_app/screens/detail/question_page_view.dart';


class PaperDetailScreen extends StatelessWidget {
  PaperDetailScreen({Key? key}) : super(key: key);

  final _paperDetailController = Get.find<PaperDetailController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<PaperDetailController>(
            builder: (_) => Container(
                      decoration: const BoxDecoration(
                          color: Colors.pink
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(color: onSurfaceTextColor)
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.timer),
                                      const SizedBox(width: 5,),
                                      Text(_paperDetailController.time,
                                        style: const TextStyle(
                                            color: onSurfaceTextColor,
                                            fontWeight: FontWeight.bold
                                        ),)
                                    ],
                                  ),
                                ),
                                Text("Q 0${_paperDetailController.index+1}",style: const TextStyle(
                                    color: onSurfaceTextColor,
                                    fontWeight: FontWeight.bold
                                ),),
                                GestureDetector(
                                    child: const Icon(Icons.grid_view_outlined),
                                  onTap: (){
                                      Get.toNamed("/overview");
                                  },
                                )
                              ],
                            ),
                          ),
                          Expanded(child: QuestionPageView(

                              questionModel: _paperDetailController.questions[_paperDetailController.index],
                            questionIndex: _paperDetailController.index,
                          ))
                        ],
                      )
                  ),
            ),
            )


    );
  }
}
