import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionPaperModel {
  String id;
  String title;
  String imageUrl;
  String description;
  int timeSeconds;
  List<dynamic> questions;
  final int questionsCount;

  QuestionPaperModel(
      {required this.id,
        required this.title,
        required this.imageUrl,
        required this.description,
        required this.timeSeconds,
        required this.questions,
        required this.questionsCount,
      });

  QuestionPaperModel.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    title = json['title'],
    imageUrl = json['image_url'],
    description = json['Description'],
    timeSeconds = json['time_seconds'],
    questions = json["questions"].map((v)=>Question.fromJson(v)).toList(),
    questionsCount = 0;

  QuestionPaperModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) :
        id = snapshot.id,
        title = snapshot['title'],
        imageUrl = snapshot['imageUrl'],
        description = snapshot['description'],
        timeSeconds = snapshot['time_seconds'],
        questions = [],
        questionsCount = snapshot["questions_count"] as int;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image_url'] = imageUrl;
    data['Description'] = description;
    data['time_seconds'] = timeSeconds;
    data['questions'] = questions.map((v) => v.toJson()).toList();
    return data;
  }
}

class Question {
  final String id;
  final String question;
  List<dynamic> answers;
  final String correctAnswer;
  String? selectedAnswer;

  Question({required this.id, required this.question, required this.answers, required this.correctAnswer});

  Question.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    question = json['question'],
    correctAnswer = json['correct_answer'],
    answers = json["answers"].map((v)=>Answer.fromJson(v)).toList();

  Question.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot):
        id = snapshot.id,
        question = snapshot["question"],
        answers = [],
        correctAnswer = snapshot["correct_answer"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['answers'] = answers.map((v) => v.toJson()).toList();
    data['correct_answer'] = correctAnswer;
    return data;
  }


}

class Answer {
  final String identifier;
  final String answer;

  Answer({required this.identifier, required this.answer});

  Answer.fromJson(Map<String, dynamic> json) :
        identifier = json['identifier'],
        answer = json['Answer'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identifier'] = identifier;
    data['Answer'] = answer;
    return data;
  }

  Answer.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot):
      identifier = snapshot["identifier"],
      answer = snapshot["answer"];
}
