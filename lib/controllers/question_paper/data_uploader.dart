import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:study_app/firebase_ref/loading_status.dart';
import 'package:study_app/firebase_ref/refrences.dart';
import 'package:study_app/models/question_paper_model.dart';


class DataUploader extends GetxController{
  final BuildContext context;

  DataUploader({
    required this.context
  });

  var questionPapers = [];
  var loadingStatus = LoadingStatus.loading;

  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  void uploadData() async{
    loadingStatus = LoadingStatus.loading;
    final fireStore = FirebaseFirestore.instance;
    var batch = fireStore.batch();

    final manifestContent = await DefaultAssetBundle.of(context).loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    final papers = manifestMap.keys.where((path) => path.startsWith("assets/DB/papers") && path.contains(".json")).toList();
    for(final paper in papers){
      final paperContent = json.decode(await rootBundle.loadString(paper));
      final paperModel = QuestionPaperModel.fromJson(paperContent);
      questionPapers.add(paperModel);
      batch.set(questionPaperRef.doc(paperModel.id), {
        "title": paperModel.title,
        "description": paperModel.description,
        "imageUrl": paperModel.imageUrl,
        "time_seconds": paperModel.timeSeconds,
        "questions_count": paperModel.questions.length,
      });
      for(final question in paperModel.questions){
        final questionPaperRef = questionPaperRF(
            paperId: paperModel.id,
            questionId: question.id
        );

        batch.set(questionPaperRef, {
          "question": question.question,
          "correct_answer": question.correctAnswer
        });
        for(Answer answer in question.answers){
          batch.set(questionPaperRef.collection("answers").doc(answer.identifier), {
            "answer": answer.answer,
            "identifier": answer.identifier
          });
        }
      }
    }

    await batch.commit().then(
            (value) {
              loadingStatus = LoadingStatus.completed;
              update();
            });
  }
}
