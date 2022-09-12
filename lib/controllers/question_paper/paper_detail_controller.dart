import 'dart:async';

import 'package:get/get.dart';
import 'package:study_app/models/question_paper_model.dart';

import '../../models/question.dart';

class PaperDetailController extends GetxController{
  final QuestionPaperModel paperModel = Get.arguments["paperModel"];
  var index=0;
  var questions = <QuestionModel>[];
  var selected = false;
  Timer? _timer;
  var time = "00:00";
  int remainSeconds = 1;
  int answered = 0;

  @override
  void onInit() {
    getQuestions();
    _timer = Timer.periodic(
        Duration(seconds: 1),
        (timer){

        }
    );
    super.onInit();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void getQuestions(){
    for(Question q in paperModel.questions) {
      questions.add(QuestionModel(
          question: q,
          answered: false
      ));
    }
    _startTimer(paperModel.timeSeconds);
    update();
  }

  void _startTimer(int seconds) {
    const duration =   Duration(seconds: 1);
    remainSeconds = seconds;
    _timer =  Timer.periodic(
      duration,
          (Timer timer) {
        if (remainSeconds == 0) {
          timer.cancel();
        } else {
          int minutes = remainSeconds~/60;
          int seconds = (remainSeconds%60);
          time = minutes.toString().padLeft(2,"0")+":"+seconds.toString().padLeft(2,"0");
          remainSeconds--;
          update();
        }
      },
    );


  }

  increaseIndex(){
    if(index < questions.length-1){
      index ++;
      update();
    }
  }

  decreaseIndex(){
    if(index > 0){
      index --;
      update();
    }
  }

  void changeIndex(value, {isGoBack=true}){
    index = value;
    update();
    if(isGoBack){
      Get.back();
    }
  }

  selectAnswer(identifier){
    questions[index].question.selectedAnswer = identifier;
    update();
  }

  bool isLastQuestion(){
    return index == questions.length - 1;
  }
  
  void complete(){
    _timer?.cancel();
    Get.offAndToNamed("/result");
  }

  int questionsAnswered(){
    return questions.where((element) => element.question.selectedAnswer != null).length;
  }

}