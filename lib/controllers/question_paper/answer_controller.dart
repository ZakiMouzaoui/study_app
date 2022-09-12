import 'package:get/get.dart';
import 'package:study_app/controllers/question_paper/paper_detail_controller.dart';

import '../../models/question_paper_model.dart';

class AnswerController extends GetxController{
  var answers = <Answer>[];

  final paperDetailController = Get.find<PaperDetailController>();

  @override
  void onInit() {
    super.onInit();
  }
}