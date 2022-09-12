import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:study_app/controllers/auth/auth_controller.dart';
import 'package:study_app/firebase_ref/refrences.dart';
import 'package:study_app/models/question_paper_model.dart';
import 'package:study_app/services/firebase_storage_service.dart';

class QuestionPaperController extends GetxController{
  final papers = <QuestionPaperModel>[];
  var loading = false;

  @override
  void onReady() {
    getPapers();
    super.onReady();
  }

  void getPapers() async{
    loading = true;
    update();
    try{
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRef.get();
      final paperList = data.docs.map((e) => QuestionPaperModel.fromSnapshot(e)).toList();
      for(var paper in paperList){
        final questionsSnapshot = await questionPaperRef.doc(paper.id).collection("questions").get();
        final questions = questionsSnapshot.docs.map((e) => Question.fromSnapshot(e)).toList();

        for(var question in questions){
          final answersSnapshot = await questionPaperRF(paperId: paper.id, questionId: question.id).collection("answers").get();
          final answers = answersSnapshot.docs.map((e) => Answer.fromSnapshot(e)).toList();
          question.answers = answers;
        }

        paper.questions = questions;

        final imgPath = await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl = imgPath!;
      }
      papers.assignAll(paperList);
      loading = false;
      update();
    }


    catch(e){
      loading = false;
      update();
    }
  }

  void navigateToQuestions({required QuestionPaperModel paperModel, bool tryAgain=false}){
    AuthController _authController = Get.find<AuthController>();

    if(_authController.isLoggedIn()){
      if(tryAgain){
        Get.back();

      }
      else{
        Get.toNamed("/detail", arguments: {
          "paperModel": paperModel
        });
      }
    }
    else{
      _authController.showLoginAlertDialog();
    }

  }
}
