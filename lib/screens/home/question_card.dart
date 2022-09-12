import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/text_styles.dart';
import 'package:study_app/controllers/question_paper/question_paper_controller.dart';
import 'package:study_app/models/question_paper_model.dart';
import 'package:study_app/widgets/icon_and_text.dart';

class QuestionCard extends GetView<QuestionPaperController> {
  const QuestionCard({Key? key, required this.questionPaperModel})
      : super(key: key);

  final QuestionPaperModel questionPaperModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.navigateToQuestions(paperModel: questionPaperModel);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).cardColor),
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  child: Container(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    child: SizedBox(
                      height: Get.width * 0.15,
                      width: Get.width * 0.15,
                      child: CachedNetworkImage(
                        imageUrl: questionPaperModel.imageUrl,
                        placeholder: (_, __) => Container(
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(),
                        ),
                        errorWidget: (_, __, ___) =>
                            Image.asset("assets/images/app_splash_logo.png"),
                      ),
                    ),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(questionPaperModel.title, style: cardTitle(context)),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(questionPaperModel.description),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          IconAndText(
                              icon: Icon(
                                Icons.help_outline_sharp,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Theme.of(context).primaryColor,
                              ),
                              text: Text(
                                '${questionPaperModel.questionsCount} questions',
                                style: detailStyle(context),
                              )),
                          const SizedBox(
                            width: 15,
                          ),
                          IconAndText(
                              icon: Icon(
                                Icons.timer,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Theme.of(context).primaryColor,
                              ),
                              text: Text(
                                '${(questionPaperModel.timeSeconds / 60).ceil()} mins',
                                style: detailStyle(context),
                              ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: const FaIcon(FontAwesomeIcons.trophy)
                ),
              ))
        ]),
      ),
    );
  }
}
