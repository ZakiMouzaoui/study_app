import 'package:flutter/material.dart';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/configs/themes/text_styles.dart';
import 'package:study_app/controllers/question_paper/question_paper_controller.dart';
import 'package:study_app/screens/home/menu_screen.dart';
import 'package:study_app/screens/home/question_card.dart';
import 'package:study_app/widgets/content_area.dart';

import '../../controllers/zoom_drawer_controller.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  HomeScreen({Key? key}) : super(key: key);

  final _questionPaperController = Get.find<QuestionPaperController>();
  final _zoomDrawerController = Get.put(MyZoomDrawerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: linearGradient(context)
            ),
            child: GetBuilder<MyZoomDrawerController>(
              builder: (_) => ZoomDrawer(
                borderRadius: 50,
                showShadow: true,
                angle: 0,
                controller: _zoomDrawerController.zoomDrawerController,
                slideWidth: Get.width*0.75,
                //menuScreenTapClose: true,
                mainScreen: Container(
                  decoration: BoxDecoration(
                      gradient: linearGradient(context)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                                child: const FaIcon(FontAwesomeIcons.barsStaggered),
                                onTap: (){
                                  _zoomDrawerController.toggleDrawer();
                                },
                            ),
                            const SizedBox(height: 20,),
                            Row(
                              children: [
                                const FaIcon(FontAwesomeIcons.handPeace),
                                const SizedBox(width: 5,),
                                Text("Hello friend",style: detailStyle(context).copyWith(color: Colors.white))
                              ],
                            ),
                            const SizedBox(height: 5,),
                            Text(
                                "What do you want to learn today?",
                                style: headerText(context)
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: ContentArea(
                            child: GetBuilder<QuestionPaperController>(
                              builder: (_) => _questionPaperController.loading
                                ? const Center(
                                child: CircularProgressIndicator(),
                              )
                              : ListView.separated(
                                  itemBuilder: (_, index){
                                    return QuestionCard(
                                        questionPaperModel: _questionPaperController.papers[index]
                                    );
                                  },
                                  separatorBuilder: (_, __)=>const SizedBox(height: 20,),
                                  itemCount: _questionPaperController.papers.length
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                menuScreen: MenuScreen(),
              ),
            ),
          )
        )
    );
  }
}
